<?xml version="1.0" encoding="UTF-8"?><sld:StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:sld="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml" version="1.0.0">
  <sld:NamedLayer>
    <sld:Name>Economie_Bedrijventerreinkavels_style</sld:Name>
    <sld:UserStyle>
      <sld:Name>Economie_Bedrijventerreinkavels_style</sld:Name>
      <sld:Title>Economie Bedrijventerreinkavels style</sld:Title>
      <sld:FeatureTypeStyle>
        <sld:Name>name</sld:Name>
        <sld:Rule>
          <sld:Name>uitgeefbaar</sld:Name>
          <sld:Title>uitgeefbaar</sld:Title>
          <ogc:Filter>
        	<ogc:And>
                <ogc:Or>
                  <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>workflow_status</ogc:PropertyName>
                  <ogc:Literal>definitief</ogc:Literal>
                </ogc:PropertyIsEqualTo>
                  </ogc:Or>
                <ogc:Or>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>status</ogc:PropertyName>
                  <ogc:Literal>Terstond uitgeefbaar gemeente</ogc:Literal>
                </ogc:PropertyIsEqualTo>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>status</ogc:PropertyName>
                  <ogc:Literal>Terstond uitgeefbaar particulier</ogc:Literal>
                </ogc:PropertyIsEqualTo>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>status</ogc:PropertyName>
                  <ogc:Literal>Terstond uitgeefbaar</ogc:Literal>
                </ogc:PropertyIsEqualTo>
                </ogc:Or>
        </ogc:And>
          </ogc:Filter>
          <MaxScaleDenominator>50000</MaxScaleDenominator>
            <sld:PolygonSymbolizer>
            <sld:Stroke>
              <sld:CssParameter name="stroke">#4CE600</sld:CssParameter>
              <sld:CssParameter name="stroke-linecap">round</sld:CssParameter>
              <sld:CssParameter name="stroke-width">0.5</sld:CssParameter>
            </sld:Stroke>
              <sld:Fill>
               <sld:GraphicFill>
                 <sld:Graphic>
                   <sld:Mark>
                     <sld:WellKnownName>shape://horline</sld:WellKnownName>
                     <sld:Fill>
                       <sld:CssParameter name="fill">#4CE600</sld:CssParameter>
                     </sld:Fill>
                     <sld:Stroke>
                       <sld:CssParameter name="stroke">#4CE600</sld:CssParameter>
                     </sld:Stroke>
                   </sld:Mark>
                   <sld:Size>10</sld:Size>
                 </sld:Graphic>
                </sld:GraphicFill>
              <sld:CssParameter name="fill">#4CE600</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>niet terstond uitgeefbaar</sld:Name>
            <sld:Title>niet terstond uitgeefbaar</sld:Title>
            <ogc:Filter>
              <ogc:And>
				<ogc:Or>
					<ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>workflow_status</ogc:PropertyName>
                    <ogc:Literal>definitief</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  </ogc:Or>
                <ogc:Or>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>status</ogc:PropertyName>
                  <ogc:Literal>Niet terstond uitgeefbaar gemeente</ogc:Literal>
                </ogc:PropertyIsEqualTo>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>status</ogc:PropertyName>
                  <ogc:Literal>Niet terstond uitgeefbaar particulier</ogc:Literal>
                </ogc:PropertyIsEqualTo>
                </ogc:Or>            
              </ogc:And>
          </ogc:Filter>
          <MaxScaleDenominator>50000</MaxScaleDenominator>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:GraphicFill>
                <sld:Graphic>
                  <sld:Mark>
                    <sld:WellKnownName>shape://slash</sld:WellKnownName>
                    <sld:Fill>
                      <sld:CssParameter name="fill">#000000</sld:CssParameter>
                    </sld:Fill>
                    <sld:Stroke/>
                  </sld:Mark>
                  <sld:Size>10</sld:Size>
                </sld:Graphic>
              </sld:GraphicFill>
              <sld:CssParameter name="fill">#000000</sld:CssParameter>
            </sld:Fill>
            <sld:Stroke>
              <sld:CssParameter name="stroke-width">0.5</sld:CssParameter>
            </sld:Stroke>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>uitgegeven</sld:Name>
          <sld:Title>uitgegeven</sld:Title>
          <ogc:Filter>
              <ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>workflow_status</ogc:PropertyName>
                  <ogc:Literal>definitief</ogc:Literal>
                </ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>status</ogc:PropertyName>
              <ogc:Literal>Uitgegeven</ogc:Literal>
            </ogc:PropertyIsEqualTo>
            </ogc:And>
                </ogc:Filter>
          <MaxScaleDenominator>50000</MaxScaleDenominator>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:GraphicFill>
                <sld:Graphic>
                  <sld:Mark>
                    <sld:WellKnownName>shape://vertline</sld:WellKnownName>
                    <sld:Fill>
                      <sld:CssParameter name="fill">#FF0000</sld:CssParameter>
                    </sld:Fill>
                    <sld:Stroke>
                      <sld:CssParameter name="stroke">#FF0000</sld:CssParameter>
                      <sld:CssParameter name="stroke-width">0.5</sld:CssParameter>
                    </sld:Stroke>
                  </sld:Mark>
                  <sld:Size>10</sld:Size>
                </sld:Graphic>
              </sld:GraphicFill>
              <sld:CssParameter name="fill">#FF0000</sld:CssParameter>
            </sld:Fill>
            <sld:Stroke>
              <sld:CssParameter name="stroke">#FF0000</sld:CssParameter>
              <sld:CssParameter name="stroke-linecap">round</sld:CssParameter>
              <sld:CssParameter name="stroke-width">0.5</sld:CssParameter>
            </sld:Stroke>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>woonbebouwing</sld:Name>
          <sld:Title>woonbebouwing</sld:Title>
          <ogc:Filter>
              <ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>workflow_status</ogc:PropertyName>
                  <ogc:Literal>definitief</ogc:Literal>
                </ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>status</ogc:PropertyName>
              <ogc:Literal>Woonbebouwing</ogc:Literal>
            </ogc:PropertyIsEqualTo>
            </ogc:And>
                </ogc:Filter>
          <MaxScaleDenominator>50000</MaxScaleDenominator>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:GraphicFill>
                <sld:Graphic>
                  <sld:Mark>
                    <sld:WellKnownName>shape://slash</sld:WellKnownName>
                    <sld:Fill>
                      <sld:CssParameter name="fill">#004DA8</sld:CssParameter>
                    </sld:Fill>
                    <sld:Stroke>
                      <sld:CssParameter name="stroke">#004DA8</sld:CssParameter>
                      <sld:CssParameter name="stroke-width">0.5</sld:CssParameter>
                    </sld:Stroke>
                  </sld:Mark>
                  <sld:Size>12</sld:Size>
                </sld:Graphic>
              </sld:GraphicFill>
              <sld:CssParameter name="fill">#004DA8</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:GraphicFill>
                <sld:Graphic>
                  <sld:Mark>
                    <sld:WellKnownName>shape://backslash</sld:WellKnownName>
                    <sld:Fill>
                      <sld:CssParameter name="fill">#004DA8</sld:CssParameter>
                    </sld:Fill>
                    <sld:Stroke>
                      <sld:CssParameter name="stroke">#004DA8</sld:CssParameter>
                      <sld:CssParameter name="stroke-width">0.5</sld:CssParameter>
                    </sld:Stroke>
                  </sld:Mark>
                  <sld:Size>12</sld:Size>
                </sld:Graphic>
              </sld:GraphicFill>
              <sld:CssParameter name="fill">#004DA8</sld:CssParameter>
            </sld:Fill>
            <sld:Stroke>
              <sld:CssParameter name="stroke">#005CE6</sld:CssParameter>
              <sld:CssParameter name="stroke-width">0.5</sld:CssParameter>
            </sld:Stroke>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>openbare ruimte</sld:Name>
          <sld:Title>openbare ruimte</sld:Title>
          <ogc:Filter>
              <ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>workflow_status</ogc:PropertyName>
                  <ogc:Literal>definitief</ogc:Literal>
                </ogc:PropertyIsEqualTo>
				<ogc:PropertyIsEqualTo>
              <ogc:PropertyName>status</ogc:PropertyName>
              <ogc:Literal>Openbare ruimte</ogc:Literal>
            </ogc:PropertyIsEqualTo>
			</ogc:And>
          </ogc:Filter>
          <MaxScaleDenominator>50000</MaxScaleDenominator>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:GraphicFill>
                <sld:Graphic>
                  <sld:Mark>
                    <sld:WellKnownName>shape://slash</sld:WellKnownName>
                    <sld:Fill>
                      <sld:CssParameter name="fill">#FFFF00</sld:CssParameter>
                    </sld:Fill>
                    <sld:Stroke>
                      <sld:CssParameter name="stroke">#FFFF00</sld:CssParameter>
                      <sld:CssParameter name="stroke-width">0.5</sld:CssParameter>
                    </sld:Stroke>
                  </sld:Mark>
                  <sld:Size>12</sld:Size>
                </sld:Graphic>
              </sld:GraphicFill>
              <sld:CssParameter name="fill">#FFFF00</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:GraphicFill>
                <sld:Graphic>
                  <sld:Mark>
                    <sld:WellKnownName>shape://backslash</sld:WellKnownName>
                    <sld:Fill>
                      <sld:CssParameter name="fill">#FFFF00</sld:CssParameter>
                    </sld:Fill>
                    <sld:Stroke>
                      <sld:CssParameter name="stroke">#FFFF00</sld:CssParameter>
                      <sld:CssParameter name="stroke-width">0.5</sld:CssParameter>
                    </sld:Stroke>
                  </sld:Mark>
                  <sld:Size>12</sld:Size>
                </sld:Graphic>
              </sld:GraphicFill>
              <sld:CssParameter name="fill">#FFFF00</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>niet bekend</sld:Name>
          <sld:Title>niet bekend</sld:Title>
          <ogc:Filter>
              <ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>workflow_status</ogc:PropertyName>
                  <ogc:Literal>definitief</ogc:Literal>
                </ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>status</ogc:PropertyName>
              <ogc:Literal>Niet bekend</ogc:Literal>
            </ogc:PropertyIsEqualTo>
            </ogc:And>
                </ogc:Filter>
          <MaxScaleDenominator>50000</MaxScaleDenominator>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#CCCCCC</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
      </sld:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</sld:StyledLayerDescriptor>
