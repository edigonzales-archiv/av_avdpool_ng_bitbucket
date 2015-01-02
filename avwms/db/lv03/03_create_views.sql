-- DROP VIEW av_avwms.cppt;

CREATE OR REPLACE VIEW av_avwms.cppt AS 

SELECT *, round(ST_X(geometrie)::numeric,3) || ' / ' || round(ST_Y(geometrie)::numeric, 3) as koordinate  
FROM av_mopublic.fixpunktekategorie__lfp;

ALTER TABLE av_avwms.cppt OWNER TO stefan;
GRANT ALL ON TABLE av_avwms.cppt TO stefan;
GRANT SELECT ON TABLE av_avwms.cppt TO mspublic;
