--
-- PostgreSQL database dump
--

-- Started on 2014-12-14 19:44:48 CET

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = av_mopublic_meta, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 608 (class 1259 OID 20251)
-- Dependencies: 12
-- Name: lookup_tables_classe_queries; Type: TABLE; Schema: av_mopublic_meta; Owner: stefan; Tablespace: 
--

CREATE TABLE lookup_tables_classe_queries (
    ogc_fid integer NOT NULL,
    id_classe double precision,
    id_topic double precision,
    sql_query character varying
);


ALTER TABLE av_mopublic_meta.lookup_tables_classe_queries OWNER TO stefan;

--
-- TOC entry 609 (class 1259 OID 20257)
-- Dependencies: 12 608
-- Name: lookup_tables_classe_queries_ogc_fid_seq; Type: SEQUENCE; Schema: av_mopublic_meta; Owner: stefan
--

CREATE SEQUENCE lookup_tables_classe_queries_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE av_mopublic_meta.lookup_tables_classe_queries_ogc_fid_seq OWNER TO stefan;

--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 609
-- Name: lookup_tables_classe_queries_ogc_fid_seq; Type: SEQUENCE OWNED BY; Schema: av_mopublic_meta; Owner: stefan
--

ALTER SEQUENCE lookup_tables_classe_queries_ogc_fid_seq OWNED BY lookup_tables_classe_queries.ogc_fid;


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 609
-- Name: lookup_tables_classe_queries_ogc_fid_seq; Type: SEQUENCE SET; Schema: av_mopublic_meta; Owner: stefan
--

SELECT pg_catalog.setval('lookup_tables_classe_queries_ogc_fid_seq', 31, true);


--
-- TOC entry 4940 (class 2604 OID 20409)
-- Dependencies: 609 608
-- Name: ogc_fid; Type: DEFAULT; Schema: av_mopublic_meta; Owner: stefan
--

ALTER TABLE ONLY lookup_tables_classe_queries ALTER COLUMN ogc_fid SET DEFAULT nextval('lookup_tables_classe_queries_ogc_fid_seq'::regclass);


--
-- TOC entry 4943 (class 0 OID 20251)
-- Dependencies: 608
-- Data for Name: lookup_tables_classe_queries; Type: TABLE DATA; Schema: av_mopublic_meta; Owner: stefan
--

INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (4, 4, 2, 'SELECT a.ogc_fid as ogc_fid, a.tid, a.geometrie as ___geometry, c.designation_e as ___quality, d.designation_e as ___type, b.gwr_egid::INTEGER as ___regbl_egid, a.gem_bfs as ___fosnr
FROM av_mopublic_meta.lookup_tables_lcs_type as d, av_mopublic_meta.lookup_tables_qualitystandard_type as c, av_avdpool_ng.bodenbedeckung_projboflaeche as a LEFT OUTER JOIN av_avdpool_ng.bodenbedeckung_projgebaeudenummer as b
ON (a.tid = b.projgebaeudenummer_von)
WHERE a.art = 0
AND 4 = c.code
AND 0 = d.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (6, 7, 3, 'SELECT  DISTINCT b.ogc_fid as ogc_fid, a.tid as tid, a.objektname_von as postext_of, e.designation_e as ___type, a.name as ___number_name, b.pos as ___pos, b.ori as ___ori, a.gem_bfs as ___fosnr
FROM av_avdpool_ng.einzelobjekte_objektname as a, av_avdpool_ng.einzelobjekte_objektnamepos as b, av_avdpool_ng.einzelobjekte_einzelobjekt as c, av_avdpool_ng.einzelobjekte_flaechenelement as d, av_mopublic_meta.lookup_tables_text_type as e 
WHERE b.objektnamepos_von = a.tid
AND a.objektname_von = c.tid
AND d.flaechenelement_von = c.tid
AND 1 = e.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (10, 11, 3, 'SELECT DISTINCT b.ogc_fid as ogc_fid, a.tid as tid, a.objektname_von as postext_of, e.designation_e as ___type, a.name as ___number_name, b.pos as ___pos, b.ori as ___ori, a.gem_bfs as ___fosnr
FROM av_avdpool_ng.einzelobjekte_objektname as a, av_avdpool_ng.einzelobjekte_objektnamepos as b, av_avdpool_ng.einzelobjekte_einzelobjekt as c, av_avdpool_ng.einzelobjekte_punktelement as d, av_mopublic_meta.lookup_tables_text_type as e 
WHERE b.objektnamepos_von = a.tid
AND a.objektname_von = c.tid
AND d.punktelement_von = c.tid
AND 1 = e.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (3, 3, 2, 'SELECT a.ogc_fid as ogc_fid, a.tid as tid, a.objektname_von as postext_of, c.designation_e as ___type, a.name as ___number_name, b.pos as ___pos, b.ori as ___ori, a.gem_bfs as ___fosnr 
FROM av_avdpool_ng.bodenbedeckung_objektname as a, av_avdpool_ng.bodenbedeckung_objektnamepos as b, av_mopublic_meta.lookup_tables_text_type as c
WHERE a.tid = b.objektnamepos_von
AND 1 = c.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (7, 8, 3, 'SELECT b.ogc_fid as ogc_fid, b.tid as tid, f.designation_e as ___validity, e.designation_e as ___type, b.geometrie as ___geometry, g.designation_e as ___quality, a.gem_bfs as ___fosnr
FROM av_avdpool_ng.einzelobjekte_linienelement as b, av_mopublic_meta.lookup_tables_so_type_to_swiss as c, av_avdpool_ng.einzelobjekte_einzelobjekt as a, av_mopublic_meta.lookup_tables_so_type as e, av_mopublic_meta.lookup_tables_qualitystandard_type as g, av_mopublic_meta.lookup_tables_validity_type as f
WHERE a.tid = b.linienelement_von
AND a.art = c.so
AND c.ch = e.code
AND 1 = f.code
AND 0 = g.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (5, 6, 3, 'SELECT b.ogc_fid as ogc_fid, b.tid as tid, f.designation_e as ___validity, e.designation_e as ___type, b.geometrie as ___geometry, g.designation_e as ___quality, d.gwr_egid::INTEGER as ___regbl_egid, a.gem_bfs as ___fosnr
FROM av_mopublic_meta.lookup_tables_qualitystandard_type as g, av_mopublic_meta.lookup_tables_validity_type as f, av_mopublic_meta.lookup_tables_so_type_to_swiss as c, av_mopublic_meta.lookup_tables_so_type as e, av_avdpool_ng.einzelobjekte_flaechenelement as b, av_avdpool_ng.einzelobjekte_einzelobjekt as a
  LEFT OUTER JOIN av_avdpool_ng.einzelobjekte_objektnummer as d ON (a.tid = d.objektnummer_von)
WHERE a.tid = b.flaechenelement_von
AND a.art = c.so
AND c.ch = e.code
AND 1 = f.code
AND 0 = g.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (1, 2, 2, 'SELECT a.ogc_fid as ogc_fid, a.tid as tid, a.geometrie as ___geometry, d.designation_e as ___quality, c.designation_e as ___type, b.gwr_egid::INTEGER as ___regbl_egid, a.gem_bfs as ___fosnr 
FROM av_mopublic_meta.lookup_tables_qualitystandard_type as d, av_mopublic_meta.lookup_tables_lcs_type as c, 
(SELECT b.id, b.so, b.ch, a.ogc_fid, a.tid, a.entstehung, a.geometrie, CASE WHEN a.qualitaet IS NULL THEN 0 ELSE a.qualitaet END as qualitaet, a.art, a.gem_bfs, a.los, a.lieferdatum 
FROM av_mopublic_meta.lookup_tables_lcs_type_to_swiss as b, av_avdpool_ng.bodenbedeckung_boflaeche as a 
WHERE a.art = b.so) as a 
LEFT OUTER JOIN av_avdpool_ng.bodenbedeckung_gebaeudenummer as b 
ON (a.tid = b.gebaeudenummer_von) 
WHERE a.ch = c.code
AND a.qualitaet = d.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (8, 9, 3, 'SELECT DISTINCT b.ogc_fid as ogc_fid, a.tid as tid, a.objektname_von as postext_of, e.designation_e as ___type, a.name as ___number_name, b.pos as ___pos, b.ori as ___ori, a.gem_bfs as ___fosnr
FROM av_avdpool_ng.einzelobjekte_objektname as a, av_avdpool_ng.einzelobjekte_objektnamepos as b, av_avdpool_ng.einzelobjekte_einzelobjekt as c, av_avdpool_ng.einzelobjekte_linienelement as d, av_mopublic_meta.lookup_tables_text_type as e 
WHERE b.objektnamepos_von = a.tid
AND a.objektname_von = c.tid
AND d.linienelement_von = c.tid
AND 1 = e.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (11, 16, 5, 'SELECT ogc_fid, tid, category as ___category, name as ___name, geometry as ___geometry, type as ___type, fosnr as ___fosnr 
FROM (
  SELECT a.ogc_fid, a.tid, b.designation_e as category, name, geometrie as geometry, NULL::varchar as type, gem_bfs as fosnr
  FROM av_avdpool_ng.nomenklatur_flurname as a, av_mopublic_meta.lookup_tables_local_names_type as b
  WHERE 0 = b.code
UNION
  SELECT a.ogc_fid, a.tid, b.designation_e as category, name, geometrie as geometry, NULL::varchar as type, gem_bfs as fosnr
  FROM av_avdpool_ng.nomenklatur_ortsname as a, av_mopublic_meta.lookup_tables_local_names_type as b
  WHERE 1 = b.code
) as a');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (13, 18, 6, 'SELECT b.ogc_fid as ogc_fid, b.tid as tid, b.geometrie as ___geometry, c.designation_e as ___validity, b.lagegen as ___plan_accuracy, d.designation_e as ___plan_reliability, e.designation_e as ___mark, b.gem_bfs as ___fosnr
FROM av_avdpool_ng.liegenschaften_lsnachfuehrung as a, av_avdpool_ng.liegenschaften_grenzpunkt as b, av_mopublic_meta.lookup_tables_validity_type as c, av_mopublic_meta.lookup_tables_reliability_type as d, av_mopublic_meta.lookup_tables_mark_type as e
WHERE b.entstehung = a.tid
AND a.gueltigkeit = c.code
AND b.lagezuv = d.code
AND b.punktzeichen = e.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (14, 19, 6, 'SELECT b.ogc_fid as ogc_fid, a.tid as tid, a.nbident as ___identnd, a.nummer as ___number, a.egris_egrid as ___egris_egrid, c.designation_e as ___completeness, b.flaechenmass as ___area, b.geometrie as ___geometry, b.gem_bfs as ___fosnr
FROM av_avdpool_ng.liegenschaften_grundstueck as a, av_avdpool_ng.liegenschaften_liegenschaft as b, av_mopublic_meta.lookup_tables_completeness_type as c
WHERE b.liegenschaft_von = a.tid
AND a.vollstaendigkeit = c.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (15, 20, 6, 'SELECT b.ogc_fid as ogc_fid, b.tid as tid, b.grundstueckpos_von as posnumber_of, a.nbident as ___identnd, a.nummer as ___number, b.pos as ___pos, CASE WHEN b.ori IS NULL THEN 100 ELSE b.ori END as ___ori, b.gem_bfs as ___fosnr
FROM av_avdpool_ng.liegenschaften_grundstueck as a, av_avdpool_ng.liegenschaften_grundstueckpos as b
WHERE a.tid = b.grundstueckpos_von
AND art = 0');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (23, 30, 7, 'SELECT DISTINCT ON (b.ogc_fid) b.ogc_fid, b.tid as tid, a.tid as posname_of, a.betreiber as ___operating_company, b.pos as ___pos, b.ori as ___ori, b.gem_bfs as ___fosnr
FROM
  (SELECT DISTINCT b.linienelement_von, b.tid, a.betreiber
  FROM  av_avdpool_ng.rohrleitungen_leitungsobjekt as a, av_avdpool_ng.rohrleitungen_linienelement as b
  WHERE a.tid = b.linienelement_von) AS a, av_avdpool_ng.rohrleitungen_leitungsobjektpos as b
WHERE a.linienelement_von = b.leitungsobjektpos_von');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (16, 21, 6, 'SELECT ogc_fid, tid, identnd as ___identnd, number as ___number, egris_egrid as ___egris_egrid, completeness as ___completeness, realestate_type as ___realestate_type, area as ___area, geometry as ___geometry, fosnr as ___fosnr
FROM 
(
  SELECT b.ogc_fid, b.tid as tid, b.nbident as identnd, b.nummer as number, b.egris_egrid as egris_egrid, c.designation_e as completeness, d.designation_e as realestate_type, a.flaechenmass as area, a.geometrie as geometry, a.gem_bfs as fosnr
  FROM av_avdpool_ng.liegenschaften_selbstrecht as a, av_avdpool_ng.liegenschaften_grundstueck as b, av_mopublic_meta.lookup_tables_completeness_type as c, av_mopublic_meta.lookup_tables_realestate_type as d
  WHERE a.selbstrecht_von = b.tid
  AND b.vollstaendigkeit = c.code
  AND (b.art-1) = d.code
UNION
  SELECT b.ogc_fid, b.tid as tid, b.nbident as identnd, b.nummer as number, b.egris_egrid as egris_egrid, c.designation_e as completeness, d.designation_e as realestate_type, a.flaechenmass as area, a.geometrie as geometry, a.gem_bfs as fosnr
  FROM av_avdpool_ng.liegenschaften_bergwerk as a, av_avdpool_ng.liegenschaften_grundstueck as b, av_mopublic_meta.lookup_tables_completeness_type as c, av_mopublic_meta.lookup_tables_realestate_type as d
  WHERE a.bergwerk_von = b.tid
  AND b.vollstaendigkeit = c.code
  AND 4 = d.code
) as a');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (18, 23, 6, 'SELECT b.ogc_fid as ogc_fid, a.tid as tid, a.nbident as ___identnd, a.nummer as ___number, a.egris_egrid as ___egris_egrid, c.designation_e as ___completeness, b.flaechenmass as ___area, b.geometrie as ___geometry, b.gem_bfs as ___fosnr
FROM av_avdpool_ng.liegenschaften_projgrundstueck as a, av_avdpool_ng.liegenschaften_projliegenschaft as b, av_mopublic_meta.lookup_tables_completeness_type as c
WHERE b.projliegenschaft_von = a.tid
AND a.vollstaendigkeit = c.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (20, 25, 6, 'SELECT ogc_fid, tid, identnd as ___identnd, number as ___number, egris_egrid as ___egris_egrid, completeness as ___completeness, realestate_type as ___realestate_type, area as ___area, geometry as ___geometry, fosnr as ___fosnr
FROM 
(
  SELECT b.ogc_fid, b.tid as tid, b.nbident as identnd, b.nummer as number, b.egris_egrid as egris_egrid, c.designation_e as completeness, d.designation_e as realestate_type, a.flaechenmass as area, a.geometrie as geometry, a.gem_bfs as fosnr
  FROM av_avdpool_ng.liegenschaften_projselbstrecht as a, av_avdpool_ng.liegenschaften_projgrundstueck as b, av_mopublic_meta.lookup_tables_completeness_type as c, av_mopublic_meta.lookup_tables_realestate_type as d
  WHERE a.projselbstrecht_von = b.tid
  AND b.vollstaendigkeit = c.code
  AND (b.art-1) = d.code  
UNION
  SELECT b.ogc_fid, b.tid as tid, b.nbident as identnd, b.nummer as number, b.egris_egrid as egris_egrid, c.designation_e as completeness, d.designation_e as realestate_type, a.flaechenmass as area, a.geometrie as geometry, a.gem_bfs as fosnr
  FROM av_avdpool_ng.liegenschaften_projbergwerk as a, av_avdpool_ng.liegenschaften_projgrundstueck as b, av_mopublic_meta.lookup_tables_completeness_type as c, av_mopublic_meta.lookup_tables_realestate_type as d
  WHERE a.projbergwerk_von = b.tid
  AND b.vollstaendigkeit = c.code
  AND (b.art-1) = d.code  
) as a');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (12, 17, 5, 'SELECT ogc_fid, tid, posname_of as posname_of, category as ___category, name as ___name, pos as ___pos, ori as ___ori, fosnr as ___fosnr 
FROM (
  SELECT a.ogc_fid, a.tid, a.flurnamepos_von as posname_of, c.designation_e as category, b.name, a.pos, CASE WHEN a.ori IS NULL THEN 100 ELSE a.ori END as ori, a.gem_bfs as fosnr
  FROM av_avdpool_ng.nomenklatur_flurnamepos as a, av_avdpool_ng.nomenklatur_flurname as b, av_mopublic_meta.lookup_tables_local_names_type as c
  WHERE b.tid = a.flurnamepos_von
  AND 0 = c.code 
UNION
  SELECT a.ogc_fid, a.tid, a.ortsnamepos_von as posname_of, c.designation_e as category, b.name, a.pos, CASE WHEN a.ori IS NULL THEN 100 ELSE a.ori END as ori, a.gem_bfs as fosnr
  FROM av_avdpool_ng.nomenklatur_ortsnamepos as a, av_avdpool_ng.nomenklatur_ortsname as b, av_mopublic_meta.lookup_tables_local_names_type as c
  WHERE b.tid = a.ortsnamepos_von
  AND 1 = c.code   
UNION
  SELECT a.ogc_fid, a.tid, NULL::varchar as posname_of, c.designation_e as category, b.name, a.pos, CASE WHEN a.ori IS NULL THEN 100 ELSE a.ori END as ori, a.gem_bfs as fosnr
  FROM av_avdpool_ng.nomenklatur_gelaendenamepos as a, av_avdpool_ng.nomenklatur_gelaendename as b, av_mopublic_meta.lookup_tables_local_names_type as c
  WHERE b.tid = a.gelaendenamepos_von
  AND 2 = c.code 
) as a');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (24, 32, 8, 'SELECT b.ogc_fid as ogc_fid, b.tid as tid, b.geometrie as ___geometry, c.designation_e as ___validity, b.lagegen as ___plan_accuracy, d.designation_e as ___plan_reliability, e.designation_e as ___mark, b.gem_bfs as ___fosnr
FROM av_avdpool_ng.gemeindegrenzen_gemnachfuehrung as a, av_avdpool_ng.gemeindegrenzen_hoheitsgrenzpunkt as b, av_mopublic_meta.lookup_tables_validity_type as c, av_mopublic_meta.lookup_tables_reliability_type as d, av_mopublic_meta.lookup_tables_mark_type as e
WHERE b.entstehung = a.tid
AND a.gueltigkeit = c.code
AND b.lagezuv = d.code
AND b.punktzeichen = e.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (19, 24, 6, 'SELECT b.ogc_fid as ogc_fid, b.tid as tid, b.projgrundstueckpos_von as posnumber_of, a.nbident as ___identnd, a.nummer as ___number, b.pos as ___pos, CASE WHEN b.ori IS NULL THEN 100 ELSE b.ori END as ___ori, b.gem_bfs as ___fosnr
FROM av_avdpool_ng.liegenschaften_projgrundstueck as a, av_avdpool_ng.liegenschaften_projgrundstueckpos as b
WHERE a.tid = b.projgrundstueckpos_von');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (28, 36, 9, 'SELECT DISTINCT ON (a.ogc_fid) a.ogc_fid as ogc_fid, a.tid, b.text as ___street_name, c.designation_e as ___is_official_designation, NULL::geometry as geometry, a.gem_bfs as ___fosnr
FROM 
(SELECT ogc_fid, tid, CASE WHEN istoffiziellebezeichnung = 0 THEN 1 ELSE 0 END as istoffiziellebezeichnung, gem_bfs FROM av_avdpool_ng.gebaeudeadressen_lokalisation) as a, 
av_avdpool_ng.gebaeudeadressen_lokalisationsname as b, 
av_mopublic_meta.lookup_tables_boolean_type as c
WHERE b.benannte = a.tid
AND a.istoffiziellebezeichnung = c.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (26, 34, 8, 'SELECT b.ogc_fid as ogc_fid, b.tid as tid, a.name as ___name, b.geometrie as ___geometry, b.gem_bfs as ___fosnr
FROM av_avdpool_ng.gemeindegrenzen_gemeinde as a, av_avdpool_ng.gemeindegrenzen_projgemeindegrenze as b
WHERE b.projgemeindegrenze_von = a.tid');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (9, 10, 3, 'SELECT b.ogc_fid as ogc_fid, b.tid as tid, f.designation_e as ___validity, e.designation_e as ___type, b.geometrie as ___geometry, g.designation_e as ___quality, CASE WHEN b.ori IS NULL THEN 100 ELSE b.ori END as ___ori, a.gem_bfs as ___fosnr
FROM av_avdpool_ng.einzelobjekte_punktelement as b, av_mopublic_meta.lookup_tables_so_type_to_swiss as c, av_avdpool_ng.einzelobjekte_einzelobjekt as a, av_mopublic_meta.lookup_tables_so_type as e, av_mopublic_meta.lookup_tables_qualitystandard_type as g, av_mopublic_meta.lookup_tables_validity_type as f
WHERE a.tid = b.punktelement_von
AND a.art = c.so
AND c.ch = e.code
AND 1 = f.code
AND 0 = g.code
');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (25, 33, 8, 'SELECT b.ogc_fid as ogc_fid, b.tid as tid, a.name as ___name, b.geometrie as ___geometry, b.gem_bfs as ___fosnr
FROM av_avdpool_ng.gemeindegrenzen_gemeinde as a, av_avdpool_ng.gemeindegrenzen_gemeindegrenze as b
WHERE b.gemeindegrenze_von = a.tid');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (17, 22, 6, 'SELECT a.ogc_fid, a.tid as tid, a.grundstueckpos_von as posnumber_of, b.identnd as ___identnd, b.number as ___number, a.pos as ___pos, CASE WHEN a.ori IS NULL THEN 100 ELSE a.ori END as ___ori, a.gem_bfs as ___fosnr
FROM av_avdpool_ng.liegenschaften_grundstueckpos as a, 
(
 SELECT * FROM 
 (
  SELECT b.ogc_fid, b.tid as tid, b.nbident as identnd, b.nummer as number, b.egris_egrid as egris_egrid, c.designation_e as completeness, d.designation_e as realestate_type, a.flaechenmass as area, a.geometrie as geometry, a.gem_bfs as fosnr
  FROM av_avdpool_ng.liegenschaften_selbstrecht as a, av_avdpool_ng.liegenschaften_grundstueck as b, av_mopublic_meta.lookup_tables_completeness_type as c, av_mopublic_meta.lookup_tables_realestate_type as d
  WHERE a.selbstrecht_von = b.tid
  AND b.vollstaendigkeit = c.code
  AND (b.art-1) = d.code
 UNION
  SELECT b.ogc_fid, b.tid as tid, b.nbident as identnd, b.nummer as number, b.egris_egrid as egris_egrid, c.designation_e as completeness, d.designation_e as realestate_type, a.flaechenmass as area, a.geometrie as geometry, a.gem_bfs as fosnr
  FROM av_avdpool_ng.liegenschaften_bergwerk as a, av_avdpool_ng.liegenschaften_grundstueck as b, av_mopublic_meta.lookup_tables_completeness_type as c, av_mopublic_meta.lookup_tables_realestate_type as d
  WHERE a.bergwerk_von = b.tid
  AND b.vollstaendigkeit = c.code
  AND 4 = d.code
 ) as c
) as b
WHERE b.tid = a.grundstueckpos_von');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (21, 26, 6, 'SELECT a.ogc_fid, a.tid as tid, a.projgrundstueckpos_von as posnumber_of, b.identnd as ___identnd, b.number as ___number, a.pos as ___pos, CASE WHEN a.ori IS NULL THEN 100 ELSE a.ori END as ___ori, a.gem_bfs as ___fosnr
FROM av_avdpool_ng.liegenschaften_projgrundstueckpos as a,  
(
 SELECT *
 FROM 
 (
  SELECT b.ogc_fid, b.tid as tid, b.nbident as identnd, b.nummer as number, b.egris_egrid as egris_egrid, c.designation_e as completeness, d.designation_e as realestate_type, a.flaechenmass as area, a.geometrie as geometry, a.gem_bfs as fosnr
  FROM av_avdpool_ng.liegenschaften_projselbstrecht as a, av_avdpool_ng.liegenschaften_projgrundstueck as b, av_mopublic_meta.lookup_tables_completeness_type as c, av_mopublic_meta.lookup_tables_realestate_type as d
  WHERE a.projselbstrecht_von = b.tid
  AND b.vollstaendigkeit = c.code
  AND (b.art-1) = d.code  
 UNION
  SELECT b.ogc_fid, b.tid as tid, b.nbident as identnd, b.nummer as number, b.egris_egrid as egris_egrid, c.designation_e as completeness, d.designation_e as realestate_type, a.flaechenmass as area, a.geometrie as geometry, a.gem_bfs as fosnr
  FROM av_avdpool_ng.liegenschaften_projbergwerk as a, av_avdpool_ng.liegenschaften_projgrundstueck as b, av_mopublic_meta.lookup_tables_completeness_type as c, av_mopublic_meta.lookup_tables_realestate_type as d
  WHERE a.projbergwerk_von = b.tid
  AND b.vollstaendigkeit = c.code
  AND (b.art-1) = d.code  
 ) as c
) as b
 
WHERE b.tid = a.projgrundstueckpos_von');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (29, 37, 9, 'SELECT b.ogc_fid as ogc_fid, b.tid as tid, a.tid as street_name_of, a.text as ___street_name, b.pos as ___pos, CASE WHEN b.ori IS NULL THEN 100 ELSE b.ori END as ___ori, a.gem_bfs as ___fosnr
FROM av_avdpool_ng.gebaeudeadressen_lokalisationsname as a, av_avdpool_ng.gebaeudeadressen_lokalisationsnamepos as b
WHERE b.lokalisationsnamepos_von = a.tid');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (22, 29, 7, 'SELECT b.ogc_fid as ogc_fid, b.tid as tid, a.betreiber as ___operating_company, d.designation_e as ___fluid, b.geometrie as ___geometry, e.designation_e as ___validity, b.gem_bfs as ___fosnr
FROM av_avdpool_ng.rohrleitungen_leitungsobjekt as a, av_avdpool_ng.rohrleitungen_linienelement as b, av_avdpool_ng.rohrleitungen_rlnachfuehrung as c, av_mopublic_meta.lookup_tables_fluid_type as d, av_mopublic_meta.lookup_tables_validity_type as e
WHERE b.linienelement_von = a.tid
AND a.entstehung = c.tid
AND a.art = d.code
AND c.gueltigkeit = e.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (27, 35, 8, 'SELECT ogc_fid, tid, type as ___type, geometry as ___geometry, bound_validity_type as ___bound_validity_type, fosnr as ___fosnr
FROM (
  SELECT a.ogc_fid, a.tid, b.designation_e as type, a.geometrie as geometry, c.designation_e as bound_validity_type, a.gem_bfs as fosnr
  FROM av_avdpool_ng.bezirksgrenzen_bezirksgrenzabschnitt as a, av_mopublic_meta.lookup_tables_other_territorial_bound_type as b, av_mopublic_meta.lookup_tables_bound_validity_type as c
  WHERE 0 = b.code
  AND a.gueltigkeit = c.code
UNION
  SELECT a.ogc_fid, a.tid, b.designation_e as type, a.geometrie as geometry, c.designation_e as bound_validity_type, a.gem_bfs as fosnr
  FROM av_avdpool_ng.kantonsgrenzen_kantonsgrenzabschnitt as a, av_mopublic_meta.lookup_tables_other_territorial_bound_type as b, av_mopublic_meta.lookup_tables_bound_validity_type as c
  WHERE 1 = b.code
  AND a.gueltigkeit = c.code
UNION
  SELECT a.ogc_fid, a.tid, b.designation_e as type, a.geometrie as geometry, c.designation_e as bound_validity_type, a.gem_bfs as fosnr
  FROM av_avdpool_ng.landesgrenzen_landesgrenzabschnitt as a, av_mopublic_meta.lookup_tables_other_territorial_bound_type as b, av_mopublic_meta.lookup_tables_bound_validity_type as c
  WHERE 2 = b.code
  AND a.gueltigkeit = c.code
) as a');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (30, 38, 9, 'SELECT c.ogc_fid as ogc_fid, c.tid as tid, a.tid as street_of, d.designation_e as ___validity, 
       c.lage as ___pos, e.designation_e as ___is_official_designation, 
       c.hoehenlage as ___level, c.hausnummer as ___house_number, NULL::varchar as ___name_of_house,
       c.gwr_egid::INTEGER as ___regbl_egid, c.gwr_edid as ___regbl_edid, 
       b.text as ___street_name, NULL::INTEGER as ___postalcode, NULL::INTEGER as ___additional_number, NULL::VARCHAR as ___city,
       a.gem_bfs as ___fosnr
FROM av_avdpool_ng.gebaeudeadressen_lokalisation as a,
  av_avdpool_ng.gebaeudeadressen_lokalisationsname as b, 
  (SELECT ogc_fid, tid, entstehung, gebaeudeeingang_von, CASE WHEN status IS NULL THEN 1 WHEN status = 0 THEN 0 ELSE 1 END as status, inaenderung, attributeprovisorisch, CASE WHEN istoffiziellebezeichnung = 0 THEN 1 ELSE 0 END as istoffiziellebezeichnung, lage, hoehenlage, hausnummer, im_gebaeude, gwr_egid, gwr_edid, gem_bfs, los, lieferdatum FROM av_avdpool_ng.gebaeudeadressen_gebaeudeeingang) as c,
  av_mopublic_meta.lookup_tables_validity_type as d,
  av_mopublic_meta.lookup_tables_boolean_type as e  
WHERE c.gebaeudeeingang_von = a.tid
AND b.benannte = a.tid
AND c.status = d.code
AND c.istoffiziellebezeichnung = e.code');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (31, 39, 9, 'SELECT b.ogc_fid as ogc_fid, b.tid, a.tid as pos_of, 0 as ___type, a.hausnummer as ___number_name, b.pos as ___pos, CASE WHEN b.ori IS NULL THEN 100 ELSE b.ori END as ___ori, b.gem_bfs as ___fosnr
FROM av_avdpool_ng.gebaeudeadressen_gebaeudeeingang as a, av_avdpool_ng.gebaeudeadressen_hausnummerpos as b
WHERE b.hausnummerpos_von = a.tid');
INSERT INTO lookup_tables_classe_queries (ogc_fid, id_classe, id_topic, sql_query) VALUES (2, 1, 1, 'SELECT a.ogc_fid, a.tid, b.designation_e as ___category, identnd as ___identnd, number as ___number, geometry as ___geometry, plan_accuracy as ___plan_accuracy, geom_alt as ___geom_alt, alt_accuracy as ___alt_accuracy, mark as ___mark, fosnr as ___fosnr 
FROM
(
  SELECT a.ogc_fid as ogc_fid, a.tid as tid, 0 as category, nbident as identnd, nummer as number, geometrie as geometry, lagegen as plan_accuracy, hoehegeom as geom_alt, hoehegen as alt_accuracy, b.designation_e as mark, gem_bfs as fosnr
  FROM av_avdpool_ng.fixpunktekategorie1_lfp1 as a, av_mopublic_meta.lookup_tables_mark_type as b
  WHERE 8 = b.code
UNION
  SELECT a.ogc_fid as ogc_fid, a.tid as tid, 1 as category, nbident as identnd, nummer as number, geometrie as geometry, lagegen as plan_accuracy, hoehegeom as geom_alt, hoehegen as alt_accuracy, b.designation_e as mark, gem_bfs as fosnr
  FROM av_avdpool_ng.fixpunktekategorie1_hfp1 as a, av_mopublic_meta.lookup_tables_mark_type as b
  WHERE 8 = b.code
UNION
  SELECT a.ogc_fid as ogc_fid, a.tid as tid, 2 as category, nbident as identnd, nummer as number, geometrie as geometry, lagegen as plan_accuracy, hoehegeom as geom_alt, hoehegen as alt_accuracy, b.designation_e as mark, gem_bfs as fosnr
  FROM av_avdpool_ng.fixpunktekategorie2_lfp2 as a, av_mopublic_meta.lookup_tables_mark_type as b
  WHERE 8 = b.code
UNION
  SELECT a.ogc_fid as ogc_fid, a.tid as tid, 3 as category, nbident as identnd, nummer as number, geometrie as geometry, lagegen as plan_accuracy, hoehegeom as geom_alt, hoehegen as alt_accuracy, b.designation_e as mark, gem_bfs as fosnr
  FROM av_avdpool_ng.fixpunktekategorie2_hfp2 as a, av_mopublic_meta.lookup_tables_mark_type as b
  WHERE 8 = b.code
UNION
  SELECT a.ogc_fid as ogc_fid, a.tid as tid, 4 as category, nbident as identnd, nummer as number, geometrie as geometry, lagegen as plan_accuracy, hoehegeom as geom_alt, hoehegen as alt_accuracy, b.designation_e as mark, gem_bfs as fosnr
  FROM av_avdpool_ng.fixpunktekategorie3_lfp3 as a, av_mopublic_meta.lookup_tables_mark_type as b
  WHERE a.punktzeichen = b.code
UNION
  SELECT a.ogc_fid as ogc_fid, a.tid as tid, 5 as category, nbident as identnd, nummer as number, geometrie as geometry, lagegen as plan_accuracy, hoehegeom as geom_alt, hoehegen as alt_accuracy, b.designation_e as mark, gem_bfs as fosnr
  FROM av_avdpool_ng.fixpunktekategorie3_hfp3 as a, av_mopublic_meta.lookup_tables_mark_type as b
   WHERE 8 = b.code 
) as a, av_mopublic_meta.lookup_tables_control_point_category as b 
WHERE a.category = b.code');


--
-- TOC entry 4942 (class 2606 OID 20438)
-- Dependencies: 608 608
-- Name: lookup_tables_classe_queries_pkey; Type: CONSTRAINT; Schema: av_mopublic_meta; Owner: stefan; Tablespace: 
--

ALTER TABLE ONLY lookup_tables_classe_queries
    ADD CONSTRAINT lookup_tables_classe_queries_pkey PRIMARY KEY (ogc_fid);


--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 608
-- Name: lookup_tables_classe_queries; Type: ACL; Schema: av_mopublic_meta; Owner: stefan
--

REVOKE ALL ON TABLE lookup_tables_classe_queries FROM PUBLIC;
REVOKE ALL ON TABLE lookup_tables_classe_queries FROM stefan;
GRANT ALL ON TABLE lookup_tables_classe_queries TO stefan;
GRANT SELECT ON TABLE lookup_tables_classe_queries TO mspublic;


-- Completed on 2014-12-14 19:44:48 CET

--
-- PostgreSQL database dump complete
--

