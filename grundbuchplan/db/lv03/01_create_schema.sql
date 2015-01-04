CREATE SCHEMA av_grundbuchplan AUTHORIZATION stefan;
GRANT ALL ON SCHEMA av_grundbuchplan TO stefan;
GRANT USAGE ON SCHEMA av_grundbuchplan TO mspublic;

COMMENT ON SCHEMA av_grundbuchplan IS 'Zusätzlich Tabellen und View für Plan für das Grundbuch ("zukunftige" Sicht).';
