-- Create a temp city name table keeping all the Capital City names (first entry for each civ - hence the order by and group by clauses)
CREATE TABLE Civilization_CityNames_Temp AS
SELECT *
  FROM (
    SELECT *
    FROM Civilization_CityNames
    ORDER BY rowid DESC
  ) GROUP BY CivilizationType;

-- Copy the remaining cities to the temp table in a random order  
INSERT INTO Civilization_CityNames_Temp
SELECT DISTINCT *
  FROM Civilization_CityNames
  WHERE NOT EXISTS (
    SELECT *
	  FROM Civilization_CityNames_Temp
	  WHERE CityName = Civilization_CityNames.CityName
  ) ORDER BY RANDOM();

-- Copy everything back from the temp table, keeping the same order, and then tidy up after ourselves
DELETE FROM Civilization_CityNames;
INSERT INTO Civilization_CityNames SELECT * FROM Civilization_CityNames_Temp ORDER BY rowid ASC;
DROP TABLE Civilization_CityNames_Temp;
