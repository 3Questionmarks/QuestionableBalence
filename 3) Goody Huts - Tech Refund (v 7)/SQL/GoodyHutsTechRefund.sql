INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_GOODY_TECH', 1);  

ALTER TABLE HandicapInfos
  ADD GoodyHutTechRefundPercent INTEGER DEFAULT 0;

UPDATE HandicapInfos
  SET GoodyHutTechRefundPercent = 100
  WHERE Type = 'HANDICAP_SETTLER';
UPDATE HandicapInfos
  SET GoodyHutTechRefundPercent = 100
  WHERE Type = 'HANDICAP_CHIEFTAIN';
UPDATE HandicapInfos
  SET GoodyHutTechRefundPercent = 80
  WHERE Type = 'HANDICAP_WARLORD';
UPDATE HandicapInfos
  SET GoodyHutTechRefundPercent = 80
  WHERE Type = 'HANDICAP_AI_DEFAULT';
UPDATE HandicapInfos
  SET GoodyHutTechRefundPercent = 65
  WHERE Type = 'HANDICAP_PRINCE';
UPDATE HandicapInfos
  SET GoodyHutTechRefundPercent = 65
  WHERE Type = 'HANDICAP_KING';
UPDATE HandicapInfos
  SET GoodyHutTechRefundPercent = 50
  WHERE Type = 'HANDICAP_EMPEROR';
UPDATE HandicapInfos
  SET GoodyHutTechRefundPercent = 35
  WHERE Type = 'HANDICAP_IMMORTAL';
UPDATE HandicapInfos
  SET GoodyHutTechRefundPercent = 20
  WHERE Type = 'HANDICAP_DEITY';
