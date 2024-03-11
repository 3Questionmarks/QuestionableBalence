ALTER TABLE Traits ADD COLUMN LuaToInclude text DEFAULT null;
ALTER TABLE Traits ADD COLUMN RequiresExpansion boolean DEFAULT 0;

------------------------------------------------------------   
--JFD_TopPanelIncludes
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS 
    JFD_TopPanelIncludes (
    FileName                text        default null);
	 
CREATE TABLE IF NOT EXISTS 
    JFD_TopPanelAdditions (
    CivilizationType        text        REFERENCES Civilizations(Type)  default null,
    YieldType               text        REFERENCES Yields(Type)         default null,
    YieldSourceFunction     text                                        default null,
    YieldSourceToolTip      text                                        default null,
    MiscToolTipFunction     text                                        default null);

-- e.g.:
-- INSERT INTO JFD_TopPanelAdditions
        -- (CivilizationType,           YieldType,          YieldSourcefunction,                YieldSourceToolTip)
-- VALUES   ('CIVILIZATION_OTTOMAN',    'YIELD_SCIENCE',    'JFD_OttomanGetGoldFromPuppets',    'TXT_KEY_JFD_OTTOMAN_GOLD_FROM_PUPPETS'),
        -- ('CIVILIZATION_OTTOMAN', 'YIELD_GOLD',       'JFD_OttomanGetGoldFromPuppets',    'TXT_KEY_JFD_OTTOMAN_GOLD_FROM_PUPPETS'),
        -- ('CIVILIZATION_OTTOMAN', 'YIELD_FAITH',      'JFD_OttomanGetFaithFromPuppets',   'TXT_KEY_JFD_OTTOMAN_FAITH_FROM_PUPPETS');
 
--CivilizationType is if you want to restrict the changes to show up only for a specific civ.
 
--YieldType corresponds to either YIELD_GOLD, YIELD_FAITH, YIELD_JFD_PIETY, YIELD_JFD_PRESTIGE, YIELD_SCIENCE, YIELD_CULTURE, YIELD_GOLDEN_AGE, YIELD_TOURISM, or YIELD_HAPPINESS. 
--Note that YIELD_GOLDEN_AGE only works with ToolTips (doesn't display GAP Per Turn). 
--YIELD_TOURISM and YIELD_HAPPINESS only works with Misc Tooltips (can't add Happiness or Tourism on a per turn basis). 
 
--YieldSourceFunction is the function in your TopPanelIncludes table file which returns a number value corresponding to your YieldPerTurn output. These needs to be added without brackets.
--This should refer to a function within the lua file above. This function will return the value of your Yield Per Turn.
--As an example:
-- function JFD_GetHungaryGAPFromFPT(playerID)
    -- local player = Players[playerID]
    -- local mainReligionID = JFD_GetMainReligionID(playerID)
    -- local numGAPointsFromFaith = 0
    -- if player:HasReligionInMostCities(mainReligionID) then
        -- numGAPointsFromFaith = math.ceil(player:GetTotalFaithPerTurn() * 33 / 100)
    -- end
 
    -- return numGAPointsFromFaith
-- end
 
--YieldSourceToolTip is the text that goes along with the Yield output, usually telling where it comes from. Setup should be something like this:
--<Row Tag="TXT_KEY_JFD_GOLDEN_AGE_FROM_FAITH">
--  <Text>{1_Num} from being Faith Per Turn.</Text>
--</Row>
--Some texts add extra effects (like coloured text or pluses or minuses).
--Note that the text will not display on Turn 0.
 
-- Finally, MiscToolTipFunction should refer to a separate function within the above Lua file. This will return a converted TXT_KEY, which should have a corresponding text. This comment is placed at the very bottom of the Tooltips on the TopPanel.
-- For example:
-- function JFD_GetHungarianGoldenAges()
    -- return Locale.ConvertTextKey("TXT_KEY_JFD_HUNGARIAN_GOLDEN_AGES")
-- end
 
--If you aren't intending on including a Miscellaneous Tooltip, leave it null. Same goes for the CivilizationType, or any other fields which intend to be unused.
--==========================================================================================================================
--==========================================================================================================================