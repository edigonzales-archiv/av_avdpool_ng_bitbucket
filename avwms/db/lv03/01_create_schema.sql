CREATE SCHEMA av_avwms AUTHORIZATION stefan;
GRANT ALL ON SCHEMA av_avwms TO stefan;
GRANT USAGE ON SCHEMA av_avwms TO mspublic;

COMMENT ON SCHEMA av_avwms IS 'Zusätzlich Tabellen und View für AV-WMS (aus Performancegründen).';
