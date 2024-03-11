-- Move the extra aircraft capabilities of the Airport ...
UPDATE Buildings SET AirModifier=0 WHERE Type='BUILDING_AIRPORT';
-- ... to the Military Base
UPDATE Buildings SET AirModifier=4 WHERE Type='BUILDING_MILITARY_BASE';

UPDATE CustomModOptions SET Value=1 WHERE Name='EVENTS_CITY_CONNECTIONS';
