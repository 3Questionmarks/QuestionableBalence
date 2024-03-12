-- Sapiens_DBUpdates
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT INTO Sapiens_DBUpdates (Name) VALUES ('FaithB_ArtInfo'),('FaithB_Balance'),('FaithB_Defines');
