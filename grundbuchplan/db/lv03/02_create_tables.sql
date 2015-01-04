-- DROP TABLE av_grundbuchplan.t_liegenschaften_liegenschaft;

CREATE TABLE av_grundbuchplan.t_liegenschaften_liegenschaft
(
  ogc_fid serial NOT NULL,
  tid character varying,
  liegenschaft_von character varying,
  nummerteilgrundstueck character varying,
  geometrie geometry(Polygon,21781),
  flaechenmass double precision,
  gem_bfs integer,
  los integer,
  lieferdatum date,
  numpos text,
  nummer character varying,
  mutation boolean DEFAULT false,
  CONSTRAINT t_liegenschaften_liegenschaft_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE av_grundbuchplan.t_liegenschaften_liegenschaft OWNER TO stefan;
GRANT ALL ON TABLE av_grundbuchplan.t_liegenschaften_liegenschaft TO stefan;
GRANT SELECT ON TABLE av_grundbuchplan.t_liegenschaften_liegenschaft TO mspublic;

CREATE INDEX idx_t_liegenschaften_liegenschaft_gem_bfs
  ON av_grundbuchplan.t_liegenschaften_liegenschaft
  USING btree
  (gem_bfs);
  
CREATE INDEX idx_t_liegenschaften_liegenschaft_geometrie
  ON av_grundbuchplan.t_liegenschaften_liegenschaft
  USING gist
  (geometrie);


-- DROP TABLE av_grundbuchplan.t_liegenschaften_projliegenschaft;

CREATE TABLE av_grundbuchplan.t_liegenschaften_projliegenschaft
(
  ogc_fid serial NOT NULL,
  tid character varying,
  projliegenschaft_von character varying,
  nummerteilgrundstueck character varying,
  geometrie geometry(Polygon,21781),
  flaechenmass double precision,
  gem_bfs integer,
  los integer,
  lieferdatum date,
  numpos text,
  nummer character varying,
  CONSTRAINT t_liegenschaften_projliegenschaft_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE av_grundbuchplan.t_liegenschaften_projliegenschaft OWNER TO stefan;
GRANT ALL ON TABLE av_grundbuchplan.t_liegenschaften_projliegenschaft TO stefan;
GRANT SELECT ON TABLE av_grundbuchplan.t_liegenschaften_projliegenschaft TO mspublic;

CREATE INDEX idx_t_liegenschaften_projliegenschaft_gem_bfs
  ON av_grundbuchplan.t_liegenschaften_projliegenschaft
  USING btree
  (gem_bfs);
  
CREATE INDEX idx_t_liegenschaften_projliegenschaft_geometrie
  ON av_grundbuchplan.t_liegenschaften_projliegenschaft
  USING gist
  (geometrie);

-- DROP TABLE av_grundbuchplan.t_liegenschaften_selbstrecht;

CREATE TABLE av_grundbuchplan.t_liegenschaften_selbstrecht
(
  ogc_fid serial NOT NULL,
  tid character varying,
  selbstrecht_von character varying,
  nummerteilgrundstueck character varying,
  geometrie geometry(Polygon,21781),
  flaechenmass double precision,
  gem_bfs integer,
  los integer,
  lieferdatum date,
  numpos text,
  nummer character varying,
  CONSTRAINT t_liegenschaften_selbstrecht_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE av_grundbuchplan.t_liegenschaften_selbstrecht OWNER TO stefan;
GRANT ALL ON TABLE av_grundbuchplan.t_liegenschaften_selbstrecht TO stefan;
GRANT SELECT ON TABLE av_grundbuchplan.t_liegenschaften_selbstrecht TO mspublic;

CREATE INDEX idx_t_liegenschaften_selbstrecht_gem_bfs
  ON av_grundbuchplan.t_liegenschaften_selbstrecht
  USING btree
  (gem_bfs);
  
CREATE INDEX idx_t_liegenschaften_selbstrecht_geometrie
  ON av_grundbuchplan.t_liegenschaften_selbstrecht
  USING gist
  (geometrie);
  
-- DROP TABLE av_grundbuchplan.t_liegenschaften_projselbstrecht;

CREATE TABLE av_grundbuchplan.t_liegenschaften_projselbstrecht
(
  ogc_fid serial NOT NULL,
  tid character varying,
  projselbstrecht_von character varying,
  nummerteilgrundstueck character varying,
  geometrie geometry(Polygon,21781),
  flaechenmass double precision,
  gem_bfs integer,
  los integer,
  lieferdatum date,
  numpos text,
  nummer character varying,
  CONSTRAINT t_liegenschaften_projselbstrecht_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE av_grundbuchplan.t_liegenschaften_projselbstrecht OWNER TO stefan;
GRANT ALL ON TABLE av_grundbuchplan.t_liegenschaften_projselbstrecht TO stefan;
GRANT SELECT ON TABLE av_grundbuchplan.t_liegenschaften_projselbstrecht TO mspublic;

CREATE INDEX idx_t_liegenschaften_projselbstrecht_gem_bfs
  ON av_grundbuchplan.t_liegenschaften_projselbstrecht
  USING btree
  (gem_bfs);

CREATE INDEX idx_t_liegenschaften_projselbstrecht_geometrie
  ON av_grundbuchplan.t_liegenschaften_projselbstrecht
  USING gist
  (geometrie);

-- DROP TABLE av_grundbuchplan.t_liegenschaften_grenzpunkt;

CREATE TABLE av_grundbuchplan.t_liegenschaften_grenzpunkt
(
  ogc_fid serial NOT NULL,
  bfsnr integer,
  gueltigkeit character varying,
  punktzeichen character varying,
  geometrie geometry(Point,21781),
  mutation boolean DEFAULT false,
  CONSTRAINT av_pfdgb_t_liegenschaften_grenzpunkt_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE av_grundbuchplan.t_liegenschaften_grenzpunkt OWNER TO stefan;
GRANT ALL ON TABLE av_grundbuchplan.t_liegenschaften_grenzpunkt TO stefan;
GRANT SELECT ON TABLE av_grundbuchplan.t_liegenschaften_grenzpunkt TO mspublic;

CREATE INDEX idx_t_liegenschaften_grenzpunkt_bfsnr
  ON av_grundbuchplan.t_liegenschaften_grenzpunkt
  USING btree
  (bfsnr);

CREATE INDEX idx_t_liegenschaften_grenzpunkt_geometrie
  ON av_grundbuchplan.t_liegenschaften_grenzpunkt
  USING gist
  (geometrie);

-- DROP TABLE av_grundbuchplan.t_liegenschaften_grundstueckpos;

CREATE TABLE av_grundbuchplan.t_liegenschaften_grundstueckpos
(
  ogc_fid serial NOT NULL,
  tid character varying,
  grundstueckpos_von character varying,
  pos geometry(Point,21781),
  ori double precision,
  hali integer,
  hali_txt character varying,
  vali integer,
  vali_txt character varying,
  groesse integer,
  groesse_txt character varying,
  hilfslinie geometry(LineString,21781),
  gem_bfs integer,
  los integer,
  lieferdatum date,
  nummer character varying,
  art integer,
  mutation boolean DEFAULT false,
  CONSTRAINT t_liegenschaften_grundstueckpos_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE av_grundbuchplan.t_liegenschaften_grundstueckpos OWNER TO stefan;

CREATE INDEX idx_t_liegenschaften_grundstueckpos_gem_bfs
  ON av_grundbuchplan.t_liegenschaften_grundstueckpos
  USING btree
  (gem_bfs);

CREATE INDEX idx_t_liegenschaften_grundstueckpos_hilfslinie
  ON av_grundbuchplan.t_liegenschaften_grundstueckpos
  USING gist
  (hilfslinie);

CREATE INDEX idx_t_liegenschaften_grundstueckpos_pos
  ON av_grundbuchplan.t_liegenschaften_grundstueckpos
  USING gist
  (pos);

