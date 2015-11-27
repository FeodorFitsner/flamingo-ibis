/*
 * Copyright (C) 2015 B3Partners B.V.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package nl.b3p.viewer.stripes;

import com.vividsolutions.jts.geom.Geometry;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import net.sourceforge.stripes.action.StrictBinding;
import net.sourceforge.stripes.action.UrlBinding;
import nl.b3p.viewer.ibis.util.IbisConstants;
import nl.b3p.viewer.ibis.util.WorkflowStatus;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.geotools.data.DataUtilities;
import org.geotools.data.simple.SimpleFeatureStore;
import org.geotools.filter.identity.FeatureIdImpl;
import org.geotools.util.Converter;
import org.geotools.util.GeometryTypeConverterFactory;
import org.json.JSONException;
import org.json.JSONObject;
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.type.AttributeDescriptor;
import org.opengis.feature.type.GeometryType;
import org.opengis.filter.Filter;
import org.opengis.filter.identity.FeatureId;

/**
 * A workflow-supporting merge action bean for ibis.
 *
 * @author Mark Prins <mark@b3partners.nl>
 */
@UrlBinding("/action/feature/ibismerge")
@StrictBinding
public class IbisMergeFeaturesActionBean extends MergeFeaturesActionBean implements IbisConstants {

    private static final Log log = LogFactory.getLog(IbisMergeFeaturesActionBean.class);

    /**
     * Force the workflow status attribute on the feature. This will handle the
     * case where the {@code extraData} attribute is a piecs of json with the
     * workflow, eg
     * {@code {workflow_status:'afgevoerd',datum_mutatie:'2015-12-01Z00:00'}}.
     *
     * @param features A list of features to be modified
     * @return the list of modified features that are about to be committed to
     * the datastore
     *
     * @throws JSONException if json parsing failed
     */
    @Override
    protected List<SimpleFeature> handleExtraData(List<SimpleFeature> features) throws JSONException {
        JSONObject json = new JSONObject(this.getExtraData());
        Iterator items = json.keys();
        while (items.hasNext()) {
            String key = (String) items.next();
            for (SimpleFeature f : features) {
                log.debug(String.format("Setting value : %s for attribute: %s on feature %s", json.get(key), key, f.getID()));
                f.setAttribute(key, json.get(key));
            }
        }
        return features;
    }

    /**
     * Overrides deleting features by archiving them instead. {@inheritDoc}
     */
    @Override
    protected List<FeatureId> handleStrategy(SimpleFeature featureA, SimpleFeature featureB,
            Geometry newGeom, Filter filterA, Filter filterB, SimpleFeatureStore localStore, String localStrategy) throws Exception {
        List<FeatureId> ids = new ArrayList();
        String geomAttrName = localStore.getSchema().getGeometryDescriptor().getLocalName();
        GeometryType type = localStore.getSchema().getGeometryDescriptor().getType();
        GeometryTypeConverterFactory cf = new GeometryTypeConverterFactory();
        Converter c = cf.createConverter(Geometry.class,
                localStore.getSchema().getGeometryDescriptor().getType().getBinding(),
                null);

        if (this.getStrategy().equalsIgnoreCase("replace")) {

            //create a copy of A and add status archief
            SimpleFeature archiveFeatA = DataUtilities.createFeature(featureA.getType(),
                    DataUtilities.encodeFeature(featureA, false));
            archiveFeatA.setAttribute(IbisConstants.WORKFLOW_FIELDNAME, WorkflowStatus.afgevoerd);
            localStore.addFeatures(DataUtilities.collection(archiveFeatA));

            // update feature A, add new geom and new status
            featureA.setAttribute(geomAttrName, c.convert(newGeom, type.getBinding()));
            featureA = this.handleExtraData(featureA);
            Object[] attributevalues = featureA.getAttributes().toArray(new Object[featureA.getAttributeCount()]);
            AttributeDescriptor[] attributes = featureA.getFeatureType().getAttributeDescriptors().toArray(new AttributeDescriptor[featureA.getAttributeCount()]);
            localStore.modifyFeatures(attributes, attributevalues, filterA);

            // update B with status afgevoerd, null terreinid
            String[] fields = new String[]{WORKFLOW_FIELDNAME, KAVEL_TERREIN_ID_FIELDNAME};
            Object[] values = new Object[]{WorkflowStatus.afgevoerd, null};
            localStore.modifyFeatures(fields, values, filterB);
            
            ids.add(new FeatureIdImpl(this.getFidA()));
        } else if (this.getStrategy().equalsIgnoreCase("new")) {
            // archive the source feature (A) and merge partner(B)
            //   and create a new feature with the attributes of A but a new geom and new status.
            localStore.modifyFeatures(WORKFLOW_FIELDNAME, WorkflowStatus.afgevoerd, filterA);

            String[] fields = new String[]{WORKFLOW_FIELDNAME, KAVEL_TERREIN_ID_FIELDNAME};
            Object[] values = new Object[]{WorkflowStatus.afgevoerd, null};
            localStore.modifyFeatures(fields, values, filterB);

            SimpleFeature newFeat = DataUtilities.createFeature(featureA.getType(),
                    DataUtilities.encodeFeature(featureA, false));
            newFeat.setAttribute(geomAttrName, c.convert(newGeom, type.getBinding()));
            List<SimpleFeature> newFeats = new ArrayList();
            newFeats.add(newFeat);
            newFeats = this.handleExtraData(newFeats);
            ids = localStore.addFeatures(DataUtilities.collection(newFeats));
        } else {
            throw new IllegalArgumentException("Unknown strategy '" + this.getStrategy() + "', cannot merge.");
        }
        return ids;
    }
}