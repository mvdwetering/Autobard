--[[
List of factions to repgroups
]]--

local _, ATBD = ...

-- Mapping table of tabard ID's to the faction that they give rep for
local fl = {}

-- Alliance cities
fl[72]	 = ATBD_REPGROUP_CITY	-- Stormwind
fl[47]	 = ATBD_REPGROUP_CITY	-- Ironforge
fl[54]	 = ATBD_REPGROUP_CITY	-- Gnomeregan
fl[69]	 = ATBD_REPGROUP_CITY	-- Darnassus
fl[930]	 = ATBD_REPGROUP_CITY	-- Exodar
fl[1134] = ATBD_REPGROUP_CITY	-- Gilneas

-- Horde cities
fl[76]	 = ATBD_REPGROUP_CITY-- Orgrimmar
fl[530]	 = ATBD_REPGROUP_CITY-- Darkspear Trolls
fl[68]	 = ATBD_REPGROUP_CITY-- Undercity
fl[81]	 = ATBD_REPGROUP_CITY-- Thunder Bluff
fl[911]	 = ATBD_REPGROUP_CITY-- Silvermoon City
fl[1133] = ATBD_REPGROUP_CITY-- Bilgewater Cartel

-- Lich King factions
fl[1106] = ATBD_REPGROUP_WOTLK -- Argent Crusade
fl[1098] = ATBD_REPGROUP_WOTLK -- Knights of the Ebon Blade
fl[1091] = ATBD_REPGROUP_WOTLK -- The Wyrmrest Accord
fl[1090] = ATBD_REPGROUP_WOTLK -- Kirin'Tor

-- Cata factions
fl[1135] = ATBD_REPGROUP_CATA -- The Earthen Ring
fl[1158] = ATBD_REPGROUP_CATA -- Guardians of Hyjal
fl[1171] = ATBD_REPGROUP_CATA -- Therazane
fl[1172] = ATBD_REPGROUP_CATA -- Dragonmaw Clan
fl[1173] = ATBD_REPGROUP_CATA -- Ramkahen
fl[1174] = ATBD_REPGROUP_CATA -- Wildhammer Clan

-- Mists factions
 -- These seem to get rep in all dungeons
fl[1352] = ATBD_REPGROUP_MISTS -- Huojin Pandaren
fl[1353] = ATBD_REPGROUP_MISTS -- Tushui Pandaren

-- Guild faction
fl[1168] = ATBD_REPGROUP_ALL -- Illustrious Guild Tabard 
fl[1168] = ATBD_REPGROUP_ALL -- Renowned Guild Tabard (epic one)



ATBD.factions = fl
