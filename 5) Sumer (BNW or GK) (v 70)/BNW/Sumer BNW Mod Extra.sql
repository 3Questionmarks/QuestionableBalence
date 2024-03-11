--Piety BNW
--INSERT INTO Building_SpecialistYieldChanges 
--		(BuildingType,													  SpecialistType,                 YieldType,             Yield)
--SELECT	('BUILDING_AKKADIAN_MOD_ZIGGURAT_DUMMY'),			     ('SPECIALIST_JFD_MONK'),			('YIELD_FAITH'),			    (1)
--WHERE EXISTS (SELECT Type FROM Specialists WHERE Type = 'SPECIALIST_JFD_MONK');

INSERT INTO Building_SpecialistYieldChanges 
		(BuildingType,													  SpecialistType,                 YieldType,             Yield)
SELECT	('BUILDING_AKKADIAN_MOD_ZIGGURAT_DECISIONS_DUMMY'),	     ('SPECIALIST_JFD_MONK'),		  ('YIELD_SCIENCE'),			    (2)
WHERE EXISTS (SELECT Type FROM Specialists WHERE Type = 'SPECIALIST_JFD_MONK');