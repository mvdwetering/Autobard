--[[
List of tabards and for which faction they provide rep
]]--

local _, ATBD = ...

-- Mapping table of tabard ID's to the faction that they give rep for
local tl = {}

-- Alliance cities
tl[45574] = 72			-- Stormwind
tl[45577] = 47			-- Ironforge
tl[45578] = 54			-- Gnomeregan
tl[45579] = 69			-- Darnassus
tl[45580] = 930			-- Exodar
tl[64882] = 1134		-- Gilneas

-- Horde cities
tl[45581] = 76			-- Orgrimmar
tl[45582] = 530			-- Darkspear Trolls
tl[45583] = 68			-- Undercity
tl[45584] = 81			-- Thunder Bluff
tl[45585] = 911			-- Silvermoon City
tl[64884] = 1133		-- Bilgewater Cartel

-- Lich King factions
tl[43154] = 1106		-- Argent Crusade
tl[43155] = 1098		-- Knights of the Ebon Blade
tl[43156] = 1091		-- The Wyrmrest Accord
tl[43157] = 1090		-- Kirin'Tor

-- Cata factions
tl[65905] = 1135		-- The Earthen Ring
tl[65906] = 1158		-- Guardians of Hyjal
tl[65907] = 1171		-- Therazane
tl[65909] = 1172		-- Dragonmaw Clan
tl[65904] = 1173		-- Ramkahen
tl[65908] = 1174		-- Wildhammer Clan

-- Mist factions
tl[83079] = 1353		-- Tushui Pandaren

-- Guild, there are more tabard that give rep for this faction
-- I assume player will only carry one so no special stuff needed
tl[69209] = 1168		-- Illustrious Guild Tabard 
tl[69210] = 1168		-- Renowned Guild Tabard (epic one)



ATBD.tabards = tl
