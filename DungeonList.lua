--[[
List of dungeons with their associated "repgroups"
]]--

local _, ATBD = ...

-- Dungeonlist
-- Note that Heroic only needs to list additional reps compared to normal

local dl = {}


-- *** Classic dungeons ***

dl[680] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- RagefireChasm
dl[686] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Zul'farrak
dl[687] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Sunken Temple
dl[688] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Black Fathom Deeps
dl[690] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Stockades
dl[691] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Gnomeregan
dl[692] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Uldaman
dl[699] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- DireMaul
dl[704] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Blackrock Depths
dl[721] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- BlackrockSpire
dl[749] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- WailingCaverns
dl[750] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Maraudon
dl[760] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Razorfen Downs
dl[761] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Razorfen Kraul
dl[762] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Scarlet Monastry
dl[763] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Scholomance
dl[765] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Stratholme


-- *** BC dungeons ***
-- These provide no rep through tabards (yet?)

dl[710] = { normal = ATBD_REPGROUP_MISTS } -- The Shattered Halls
dl[797] = { normal = ATBD_REPGROUP_MISTS } -- Hellfire Ramparts
dl[725] = { normal = ATBD_REPGROUP_MISTS } -- The Blood Furnace

dl[726] = { normal = ATBD_REPGROUP_MISTS } -- The Underbog
dl[727] = { normal = ATBD_REPGROUP_MISTS } -- The Steamvault
dl[728] = { normal = ATBD_REPGROUP_MISTS } -- The Slave Pens

dl[724] = { normal = ATBD_REPGROUP_MISTS } -- Shadow Labyrinth
dl[732] = { normal = ATBD_REPGROUP_MISTS } -- Mana-Tombs
dl[722] = { normal = ATBD_REPGROUP_MISTS } -- Auchenai Crypts
dl[723] = { normal = ATBD_REPGROUP_MISTS } -- Sethekk Halls

dl[729] = { normal = ATBD_REPGROUP_MISTS } -- The Botanica
dl[730] = { normal = ATBD_REPGROUP_MISTS } -- The Mechanar
dl[731] = { normal = ATBD_REPGROUP_MISTS } -- The Arcatraz

dl[734] = { normal = ATBD_REPGROUP_MISTS } -- CoT: Old Hillsbrad
dl[733] = { normal = ATBD_REPGROUP_MISTS } -- CoT: The Black Morass

dl[798] = { normal = ATBD_REPGROUP_MISTS } -- Magister's Terrace


-- *** WotLK Dungeons ***

dl[523] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS, heroic = ATBD_REPGROUP_WOTLK }  -- Utgarde Keep
dl[520] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS, heroic = ATBD_REPGROUP_WOTLK }  -- The Nexus
dl[533] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS, heroic = ATBD_REPGROUP_WOTLK }  -- Azjol-Nerub: Azjol-Nerub
dl[522] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS, heroic = ATBD_REPGROUP_WOTLK }  -- Ahn'kahet: The Old Kingdom
dl[534] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS, heroic = ATBD_REPGROUP_WOTLK }  -- Drak'Tharon Keep
dl[536] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS, heroic = ATBD_REPGROUP_WOTLK }  -- The Violet Hold
dl[530] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS, heroic = ATBD_REPGROUP_WOTLK }  -- Gundrak
dl[526] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS, heroic = ATBD_REPGROUP_WOTLK }  -- Halls of Stone
dl[528] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS }          -- Oculus
dl[525] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS }          -- Halls of Lightning
dl[524] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS }          -- Utgarde Pinnacle
dl[521] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS }          -- Culling of Stratholme
dl[542] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS }          -- Trial of the Champion
dl[601] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS }          -- Forge of Souls
dl[602] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS }          -- Pit of Saron
dl[603] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS }          -- Halls of Reflection

-- *** Cataclysm dungeons ***

dl[756] = { xpack = ATBD_REPGROUP_CATA, normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS, heroic = ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA }  -- The Deadmines
dl[764] = { xpack = ATBD_REPGROUP_CATA, normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS, heroic = ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA }  -- Shadowfang Keep
dl[753] = { xpack = ATBD_REPGROUP_CATA, normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS, heroic = ATBD_REPGROUP_CATA }  -- Blackrock Caverns
dl[767] = { xpack = ATBD_REPGROUP_CATA, normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS, heroic = ATBD_REPGROUP_CATA }  -- Throne of Tides
dl[768] = { xpack = ATBD_REPGROUP_CATA, normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS, heroic = ATBD_REPGROUP_CATA }  -- Stonecore
dl[769] = { xpack = ATBD_REPGROUP_CATA, normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS, heroic = ATBD_REPGROUP_CATA }  -- Vortex Pinnacle
dl[759] = { xpack = ATBD_REPGROUP_CATA, normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA + ATBD_REPGROUP_MISTS }          -- GrimBatol
dl[759] = { xpack = ATBD_REPGROUP_CATA, normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA + ATBD_REPGROUP_MISTS }          -- Halls of Origination
dl[747] = { xpack = ATBD_REPGROUP_CATA, normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA + ATBD_REPGROUP_MISTS }          -- Lost City of Tol'vir

-- *** Patch 4.1 dungeons ***
dl[793] = { xpack = ATBD_REPGROUP_CATA, normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA + ATBD_REPGROUP_MISTS }          -- Zul'Gurub
dl[781] = { xpack = ATBD_REPGROUP_CATA, normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA + ATBD_REPGROUP_MISTS }          -- Zul'Aman

-- *** Patch 4.3 dungeons ***
dl[820] = { xpack = ATBD_REPGROUP_CATA, normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA + ATBD_REPGROUP_MISTS }          -- End Time
dl[816] = { xpack = ATBD_REPGROUP_CATA, normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA + ATBD_REPGROUP_MISTS }          -- Well of Eternity
dl[819] = { xpack = ATBD_REPGROUP_CATA, normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA + ATBD_REPGROUP_MISTS }          -- Hour of Twilight


-- *** Patch 5.0.4 dungeons ***
dl[871] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Scarlett Halls
dl[874] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Scarlet Monastery
dl[898] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_MISTS } -- Scholomance

-- *** Mists dungeons *** THE REPS ARE GUESSES FOR NOW
dl[875] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS } -- Gate of the Setting Sun MoP
dl[885] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS } -- Mogu'Shan Palace MoP
dl[877] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS } -- Shado-pan Monastery MoP
dl[887] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS } -- Siege of Niuzao Temple MoP
dl[876] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS } -- Stormstout Brewery MoP
dl[867] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_MISTS } -- Temple of the Jade Serpent 


ATBD.dungeons = dl
