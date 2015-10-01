-- View: "IBIS".v_component_ibis_report

-- DROP VIEW "IBIS".v_component_ibis_report;

CREATE OR REPLACE VIEW "IBIS".v_component_ibis_report AS 
 SELECT bedrijventerrein.id,
    bedrijventerrein.rin_nr,
    bedrijventerrein.datum,
    bedrijventerrein.reden,
    bedrijventerrein.workflow_status,
    bedrijventerrein.a_bestaatnietmeer,
    bedrijventerrein.a_bestemming,
    bedrijventerrein.a_gecontroleerd,
    bedrijventerrein.a_grootstedeel,
    bedrijventerrein.a_haruimtegebruik,
    bedrijventerrein.a_kernnaam,
    bedrijventerrein.a_ovwkavelgrootte,
    bedrijventerrein.a_planfase,
    bedrijventerrein.a_plannaam,
    bedrijventerrein.a_statusrpb,
    bedrijventerrein.a_type,
    bedrijventerrein.c_hyperlink,
    bedrijventerrein.c_onderhoudemail,
    bedrijventerrein.c_onderhoudnaam,
    bedrijventerrein.c_onderhoudtelefoon,
    bedrijventerrein.c_organisatie,
    bedrijventerrein.c_postcodeplaats,
    bedrijventerrein.c_verkoopadres,
    bedrijventerrein.c_verkoopemail,
    bedrijventerrein.c_verkoopnaam,
    bedrijventerrein.c_verkooptelefoon,
    bedrijventerrein.c_verkoopwebsite,
    bedrijventerrein.codeplanfase,
    bedrijventerrein.datum_controle,
    bedrijventerrein.l_foto1,
    bedrijventerrein.l_foto2,
    bedrijventerrein.l_foto3,
    bedrijventerrein.l_foto4,
    bedrijventerrein.o_afstandvliegveld,
    bedrijventerrein.o_collbeheer,
    bedrijventerrein.o_collinkoop,
    bedrijventerrein.o_collvoorz,
    bedrijventerrein.o_externebereikbaarheid,
    bedrijventerrein.o_internet,
    bedrijventerrein.o_maxhuur,
    bedrijventerrein.o_maxverkoop,
    bedrijventerrein.o_milieuwet,
    bedrijventerrein.o_milieuzone,
    bedrijventerrein.o_minhuur,
    bedrijventerrein.o_minverkoop,
    bedrijventerrein.o_naamvliegveld,
    bedrijventerrein.o_overslag,
    bedrijventerrein.o_parkeergelegenheid,
    bedrijventerrein.o_spoorontsluiting,
    bedrijventerrein.o_waterontsluiting,
    bedrijventerrein.o_wegontsluiting,
    bedrijventerrein.gemeenteid,
    st_buffer(st_envelope(bedrijventerrein.geom), 100::double precision)::geometry(Polygon,28992) AS bbox_terrein,
    v_gemeente_en_regio_envelopes.naam,
    v_gemeente_en_regio_envelopes.bbox_gemeente,
    v_gemeente_en_regio_envelopes.vvr_naam,
    v_gemeente_en_regio_envelopes.bbox_regio
   FROM bedrijventerrein
     LEFT JOIN v_gemeente_en_regio_envelopes ON bedrijventerrein.gemeenteid = v_gemeente_en_regio_envelopes.gem_id
  ORDER BY v_gemeente_en_regio_envelopes.vvr_naam, v_gemeente_en_regio_envelopes.naam, bedrijventerrein.a_plannaam;

ALTER TABLE "IBIS".v_component_ibis_report
  OWNER TO ibis;
COMMENT ON VIEW "IBIS".v_component_ibis_report
  IS 'koppelt de gemeente en regio gegevens aan de terreinen voor de IbisReport component';
