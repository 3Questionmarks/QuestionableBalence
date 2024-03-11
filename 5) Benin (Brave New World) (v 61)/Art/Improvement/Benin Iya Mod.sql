INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_IYA', 'Improvement', 'IYA';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.8,  'ART_DEF_IMPROVEMENT_IYA', 'SNAPSHOT', 'ART_DEF_RESOURCE_NONE', 'iya_hb.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.8,  'ART_DEF_IMPROVEMENT_IYA', 'SNAPSHOT', 'ART_DEF_RESOURCE_NONE', 'iya.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.6,  'ART_DEF_IMPROVEMENT_IYA', 'SNAPSHOT', 'ART_DEF_RESOURCE_NONE', 'iya_pl.fxsxml_pl', 1;