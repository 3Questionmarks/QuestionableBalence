-- Configurations
-- Author: LeeS
-- DateCreated: 1/10/2016 9:35:55 AM
-------------------------------------------------------------------------------------------------
--[[

1)	Variable iColumnsBackToLook designates how far forward a player can beeline within the tech tree before they must go back and research
	all the techs within a column in order to research 'higher-up' the tech tree columns.

2)	If iColumnsBackToLook is set to '2', and if a player has not completed all the techs in the 3rd tech tree column, they cannot 'dip into' the 5th tech tree column.
	So with iColumnsBackToLook set @ 2, you are allowed to freely 'reach-forward' only 1 column before you go back and finish all techs in the uncompleted column.

3)	As set (local iColumnsBackToLook = 2) you more or less have to complete one Era's techs before you can get very far into the next Era, but this system grants more
	latitude than hard-requiring that all techs in Era-X must be completed before a player can research into Era-Y, while at the same time preserving the need to
	research the whole tech tree as one 'makes technological progress' instead of researching all the way forward to Satellites (for example) without ever having
	discovered Chemistry or Gunpowder (for example).

4)	You can configure this effect to a more desired 'skipping-distance' in the tech-tree, but just bear in mind that too high a number for iColumnsBackToLook is
	essentially the same thing as not even having the mod enabled


]]--
-------------------------------------------------------------------------------------------------

iColumnsBackToLook = 2

-------------------------------------------------------------------------------------------------
--[[

Control if any otherwise available tech can be acquired for free from a wonder, policy, etc.
A. Set to 'false' = the tech tree beelining code decides which 'free' techs can be chosen
B. Set to 'true' = the tech tree beelining code is temporarily disabled for the 'free' techs 
	choice, and only the normal prerequisite-tech rules apply as to which techs are available
	for the 'free' tech(s).

]]--
-------------------------------------------------------------------------------------------------

bAnyFreeTechs = true