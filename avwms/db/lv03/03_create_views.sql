-- DROP VIEW av_avwms.cppt;

CREATE OR REPLACE VIEW av_avwms.cppt AS 

SELECT *, round(ST_X(geometrie)::numeric,3) || ' / ' || round(ST_Y(geometrie)::numeric, 3) as koordinate  
FROM av_mopublic.fixpunktekategorie__lfp;

ALTER TABLE av_avwms.cppt OWNER TO stefan;
GRANT ALL ON TABLE av_avwms.cppt TO stefan;
GRANT SELECT ON TABLE av_avwms.cppt TO mspublic;

-- DROP VIEW av_avwms.hadr;
CREATE OR REPLACE VIEW av_avwms.hadr AS

SELECT h.ogc_fid, h.nummer_name, 'NULL'::VARCHAR as gebaeudename, h.ori, h.hali, h.vali, h.bfsnr, h.pos, g.gwr_egid, g.gwr_edid, g.lokalisationsname, g.plz, g.zusatzziffern, g.ortschaftsname
FROM av_mopublic.gebaeudeadressen__hausnummerpos as h, av_mopublic.gebaeudeadressen__gebaeudeeingang as g
WHERE h.hausnummerpos_von = g.tid;

ALTER TABLE av_avwms.hadr OWNER TO stefan;
GRANT ALL ON TABLE av_avwms.hadr TO stefan;
GRANT SELECT ON TABLE av_avwms.hadr TO mspublic;
