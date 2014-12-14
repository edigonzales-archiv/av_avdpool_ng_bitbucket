-- LookUp_ili1_v13.Lookup_tables.Reliability_type
CREATE TABLE av_mopublic_meta.Reliability_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(4) NOT NULL
  ,Designation_f varchar(4) NOT NULL
  ,Designation_i varchar(4) NOT NULL
  ,Designation_e varchar(4) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Reliability_type IS '@iliname LookUp_ili1_v13.Lookup_tables.Reliability_type';
CREATE TABLE av_mopublic_meta.T_ILI2DB_BASKET (
  T_Id integer PRIMARY KEY
  ,dataset integer NULL
  ,topic varchar(200) NOT NULL
  ,T_Ili_Tid varchar(200) NULL
  ,attachmentKey varchar(200) NOT NULL
)
;
CREATE TABLE av_mopublic_meta.T_ILI2DB_MODEL (
  file varchar(250) NOT NULL
  ,iliversion varchar(3) NOT NULL
  ,modelName text NOT NULL
  ,content text NOT NULL
  ,importDate timestamp NOT NULL
  ,PRIMARY KEY (modelName,iliversion)
)
;
-- LookUp_ili1_v13.Lookup_tables.Fluid_type
CREATE TABLE av_mopublic_meta.Fluid_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(10) NOT NULL
  ,Designation_f varchar(10) NOT NULL
  ,Designation_i varchar(10) NOT NULL
  ,Designation_e varchar(10) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Fluid_type IS '@iliname LookUp_ili1_v13.Lookup_tables.Fluid_type';
CREATE TABLE av_mopublic_meta.T_ILI2DB_IMPORT_OBJECT (
  T_Id integer PRIMARY KEY
  ,import_basket integer NOT NULL
  ,class varchar(200) NOT NULL
  ,objectCount integer NULL
  ,start_t_id integer NULL
  ,end_t_id integer NULL
)
;
-- LookUp_ili1_v13.Lookup_tables.Bound_validity_type
CREATE TABLE av_mopublic_meta.Bound_validity_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(15) NOT NULL
  ,Designation_f varchar(15) NOT NULL
  ,Designation_i varchar(15) NOT NULL
  ,Designation_e varchar(15) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Bound_validity_type IS '@iliname LookUp_ili1_v13.Lookup_tables.Bound_validity_type';
-- LookUp_ili1_v13.Lookup_tables.LCS_type
CREATE TABLE av_mopublic_meta.LCS_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(30) NOT NULL
  ,Designation_f varchar(30) NOT NULL
  ,Designation_i varchar(30) NOT NULL
  ,Designation_e varchar(30) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.LCS_type IS '@iliname LookUp_ili1_v13.Lookup_tables.LCS_type';
-- LookUp_ili1_v13.Lookup_tables.Boolean_type
CREATE TABLE av_mopublic_meta.Boolean_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(4) NOT NULL
  ,Designation_f varchar(4) NOT NULL
  ,Designation_i varchar(4) NOT NULL
  ,Designation_e varchar(4) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Boolean_type IS '@iliname LookUp_ili1_v13.Lookup_tables.Boolean_type';
CREATE TABLE av_mopublic_meta.T_ILI2DB_DATASET (
  T_Id integer PRIMARY KEY
)
;
-- LookUp_ili1_v13.Lookup_tables.Topic_name
CREATE TABLE av_mopublic_meta.Topic_name (
  T_Id integer PRIMARY KEY
  ,id_topic integer NOT NULL
  ,Designation_d varchar(30) NOT NULL
  ,Designation_f varchar(30) NOT NULL
  ,Designation_i varchar(30) NOT NULL
  ,Designation_e varchar(30) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Topic_name IS '@iliname LookUp_ili1_v13.Lookup_tables.Topic_name';
-- LookUp_ili1_v13.Lookup_tables.Validity_type
CREATE TABLE av_mopublic_meta.Validity_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(15) NOT NULL
  ,Designation_f varchar(15) NOT NULL
  ,Designation_i varchar(15) NOT NULL
  ,Designation_e varchar(15) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Validity_type IS '@iliname LookUp_ili1_v13.Lookup_tables.Validity_type';
CREATE TABLE av_mopublic_meta.T_ILI2DB_IMPORT (
  T_Id integer PRIMARY KEY
  ,dataset integer NOT NULL
  ,importDate timestamp NOT NULL
  ,importUser varchar(40) NOT NULL
  ,importFile varchar(200) NOT NULL
)
;
-- LookUp_ili1_v13.Lookup_tables.Text_type
CREATE TABLE av_mopublic_meta.Text_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(6) NOT NULL
  ,Designation_f varchar(6) NOT NULL
  ,Designation_i varchar(6) NOT NULL
  ,Designation_e varchar(6) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Text_type IS '@iliname LookUp_ili1_v13.Lookup_tables.Text_type';
CREATE TABLE av_mopublic_meta.T_ILI2DB_CLASSNAME (
  IliName varchar(1024) PRIMARY KEY
  ,SqlName varchar(1024) NOT NULL
)
;
-- LookUp_ili1_v13.Lookup_tables.Mark_type
CREATE TABLE av_mopublic_meta.Mark_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(26) NOT NULL
  ,Designation_f varchar(26) NOT NULL
  ,Designation_i varchar(26) NOT NULL
  ,Designation_e varchar(26) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Mark_type IS '@iliname LookUp_ili1_v13.Lookup_tables.Mark_type';
-- LookUp_ili1_v13.Lookup_tables.Cut_out_surface_type
CREATE TABLE av_mopublic_meta.Cut_out_surface_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(20) NOT NULL
  ,Designation_f varchar(20) NOT NULL
  ,Designation_i varchar(20) NOT NULL
  ,Designation_e varchar(20) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Cut_out_surface_type IS '@iliname LookUp_ili1_v13.Lookup_tables.Cut_out_surface_type';
-- LookUp_ili1_v13.Lookup_tables.RealEstate_type
CREATE TABLE av_mopublic_meta.RealEstate_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(35) NOT NULL
  ,Designation_f varchar(35) NOT NULL
  ,Designation_i varchar(35) NOT NULL
  ,Designation_e varchar(35) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.RealEstate_type IS '@iliname LookUp_ili1_v13.Lookup_tables.RealEstate_type';
CREATE TABLE av_mopublic_meta.T_ILI2DB_INHERITANCE (
  thisClass varchar(60) PRIMARY KEY
  ,baseClass varchar(60) NULL
)
;
-- LookUp_ili1_v13.Lookup_tables.QualityStandard_type
CREATE TABLE av_mopublic_meta.QualityStandard_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(7) NOT NULL
  ,Designation_f varchar(7) NOT NULL
  ,Designation_i varchar(7) NOT NULL
  ,Designation_e varchar(7) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.QualityStandard_type IS '@iliname LookUp_ili1_v13.Lookup_tables.QualityStandard_type';
-- LookUp_ili1_v13.Lookup_tables.SO_type
CREATE TABLE av_mopublic_meta.SO_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(35) NOT NULL
  ,Designation_f varchar(35) NOT NULL
  ,Designation_i varchar(35) NOT NULL
  ,Designation_e varchar(35) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.SO_type IS '@iliname LookUp_ili1_v13.Lookup_tables.SO_type';
-- LookUp_ili1_v13.Lookup_tables.Local_names_type
CREATE TABLE av_mopublic_meta.Local_names_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(25) NOT NULL
  ,Designation_f varchar(25) NOT NULL
  ,Designation_i varchar(25) NOT NULL
  ,Designation_e varchar(25) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Local_names_type IS '@iliname LookUp_ili1_v13.Lookup_tables.Local_names_type';
-- LookUp_ili1_v13.Lookup_tables.Completeness_type
CREATE TABLE av_mopublic_meta.Completeness_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(15) NOT NULL
  ,Designation_f varchar(15) NOT NULL
  ,Designation_i varchar(15) NOT NULL
  ,Designation_e varchar(15) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Completeness_type IS '@iliname LookUp_ili1_v13.Lookup_tables.Completeness_type';
CREATE TABLE av_mopublic_meta.T_KEY_OBJECT (
  T_Key varchar(30) PRIMARY KEY
  ,T_LastUniqueId integer NOT NULL
  ,T_LastChange timestamp NOT NULL
  ,T_CreateDate timestamp NOT NULL
  ,T_User varchar(40) NOT NULL
)
;
CREATE TABLE av_mopublic_meta.T_ILI2DB_IMPORT_BASKET (
  T_Id integer PRIMARY KEY
  ,import integer NOT NULL
  ,basket integer NOT NULL
  ,objectCount integer NULL
  ,start_t_id integer NULL
  ,end_t_id integer NULL
)
;
CREATE TABLE av_mopublic_meta.T_ILI2DB_SETTINGS (
  tag varchar(60) PRIMARY KEY
  ,setting varchar(60) NULL
)
;
-- LookUp_ili1_v13.Lookup_tables.Terrain_edge_type
CREATE TABLE av_mopublic_meta.Terrain_edge_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(20) NOT NULL
  ,Designation_f varchar(20) NOT NULL
  ,Designation_i varchar(20) NOT NULL
  ,Designation_e varchar(20) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Terrain_edge_type IS '@iliname LookUp_ili1_v13.Lookup_tables.Terrain_edge_type';
-- LookUp_ili1_v13.Lookup_tables.Other_territorial_bound_type
CREATE TABLE av_mopublic_meta.Other_territorial_bound_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(25) NOT NULL
  ,Designation_f varchar(25) NOT NULL
  ,Designation_i varchar(25) NOT NULL
  ,Designation_e varchar(25) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Other_territorial_bound_type IS '@iliname LookUp_ili1_v13.Lookup_tables.Other_territorial_bound_type';
-- LookUp_ili1_v13.Lookup_tables.Control_point_Category
CREATE TABLE av_mopublic_meta.Control_point_Category (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(4) NOT NULL
  ,Designation_f varchar(4) NOT NULL
  ,Designation_i varchar(4) NOT NULL
  ,Designation_e varchar(4) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Control_point_Category IS '@iliname LookUp_ili1_v13.Lookup_tables.Control_point_Category';
CREATE TABLE av_mopublic_meta.T_ILI2DB_ATTRNAME (
  IliName varchar(1024) PRIMARY KEY
  ,SqlName varchar(1024) NOT NULL
)
;
-- LookUp_ili1_v13.Lookup_tables.Classe_name
CREATE TABLE av_mopublic_meta.Classe_name (
  T_Id integer PRIMARY KEY
  ,id_classe integer NOT NULL
  ,id_topic integer NOT NULL
  ,Designation_d varchar(35) NOT NULL
  ,Designation_f varchar(35) NOT NULL
  ,Designation_i varchar(35) NOT NULL
  ,Designation_e varchar(35) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Classe_name IS '@iliname LookUp_ili1_v13.Lookup_tables.Classe_name';
-- LookUp_ili1_v13.Lookup_tables.Attribute_name
CREATE TABLE av_mopublic_meta.Attribute_name (
  T_Id integer PRIMARY KEY
  ,id_attribute integer NOT NULL
  ,id_topic integer NOT NULL
  ,id_classe integer NOT NULL
  ,Designation_d varchar(30) NOT NULL
  ,Designation_f varchar(30) NOT NULL
  ,Designation_i varchar(30) NOT NULL
  ,Designation_e varchar(30) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Attribute_name IS '@iliname LookUp_ili1_v13.Lookup_tables.Attribute_name';
-- LookUp_ili1_v13.Lookup_tables.Territorial_bound_Line_type
CREATE TABLE av_mopublic_meta.Territorial_bound_Line_type (
  T_Id integer PRIMARY KEY
  ,Code integer NOT NULL
  ,Designation_d varchar(15) NOT NULL
  ,Designation_f varchar(15) NOT NULL
  ,Designation_i varchar(15) NOT NULL
  ,Designation_e varchar(15) NOT NULL
)
;
COMMENT ON TABLE av_mopublic_meta.Territorial_bound_Line_type IS '@iliname LookUp_ili1_v13.Lookup_tables.Territorial_bound_Line_type';
