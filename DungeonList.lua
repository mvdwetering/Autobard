--[[
List of dungeons with their associated "repgroups"
]]--

local _, ATBD = ...

-- Dungeonlist
-- Note that Heroic only needs to list additional reps compared to normal

local dl = {}


-- *** Classic dungeons ***

dl[680] = { normal = ATBD_REPGROUP_CITY } -- RagefireChasm
dl[686] = { normal = ATBD_REPGROUP_CITY } -- Zul'farrak
dl[687] = { normal = ATBD_REPGROUP_CITY } -- Sunken Temple
dl[688] = { normal = ATBD_REPGROUP_CITY } -- Black Fathom Deeps
dl[690] = { normal = ATBD_REPGROUP_CITY } -- Stockades
dl[691] = { normal = ATBD_REPGROUP_CITY } -- Gnomeregan
dl[692] = { normal = ATBD_REPGROUP_CITY } -- Uldaman
dl[699] = { normal = ATBD_REPGROUP_CITY } -- DireMaul
dl[704] = { normal = ATBD_REPGROUP_CITY } -- Blackrock Depths
dl[721] = { normal = ATBD_REPGROUP_CITY } -- BlackrockSpire
dl[749] = { normal = ATBD_REPGROUP_CITY } -- WailingCaverns
dl[750] = { normal = ATBD_REPGROUP_CITY } -- Maraudon
dl[760] = { normal = ATBD_REPGROUP_CITY } -- Razorfen Downs
dl[761] = { normal = ATBD_REPGROUP_CITY } -- Razorfen Kraul
dl[762] = { normal = ATBD_REPGROUP_CITY } -- Scarlet Monastry
dl[763] = { normal = ATBD_REPGROUP_CITY } -- Scholomance
dl[765] = { normal = ATBD_REPGROUP_CITY } -- Stratholme


-- *** BC dungeons ***
-- These provide no rep through tabards (yet?)

dl[710] = { } -- The Shattered Halls
dl[797] = { } -- Hellfire Ramparts
dl[725] = { } -- The Blood Furnace

dl[726] = { } -- The Underbog
dl[727] = { } -- The Steamvault
dl[728] = { } -- The Slave Pens

dl[724] = { } -- Shadow Labyrinth
dl[732] = { } -- Mana-Tombs
dl[722] = { } -- Auchenai Crypts
dl[723] = { } -- Sethekk Halls

dl[729] = { } -- The Botanica
dl[730] = { } -- The Mechanar
dl[731] = { } -- The Arcatraz

dl[734] = { } -- CoT: Old Hillsbrad
dl[733] = { } -- CoT: The Black Morass

dl[798] = { } -- Magister's Terrace


-- *** WotLK Dungeons ***

dl[523] = { normal = ATBD_REPGROUP_CITY, heroic = ATBD_REPGROUP_WOTLK }  -- Utgarde Keep
dl[520] = { normal = ATBD_REPGROUP_CITY, heroic = ATBD_REPGROUP_WOTLK }  -- The Nexus
dl[533] = { normal = ATBD_REPGROUP_CITY, heroic = ATBD_REPGROUP_WOTLK }  -- Azjol-Nerub: Azjol-Nerub
dl[522] = { normal = ATBD_REPGROUP_CITY, heroic = ATBD_REPGROUP_WOTLK }  -- Ahn'kahet: The Old Kingdom
dl[534] = { normal = ATBD_REPGROUP_CITY, heroic = ATBD_REPGROUP_WOTLK }  -- Drak'Tharon Keep
dl[536] = { normal = ATBD_REPGROUP_CITY, heroic = ATBD_REPGROUP_WOTLK }  -- The Violet Hold
dl[530] = { normal = ATBD_REPGROUP_CITY, heroic = ATBD_REPGROUP_WOTLK }  -- Gundrak
dl[526] = { normal = ATBD_REPGROUP_CITY, heroic = ATBD_REPGROUP_WOTLK }  -- Halls of Stone
dl[528] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK }  -- Oculus
dl[525] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK }  -- Halls of Lightning
dl[524] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK }  -- Utgarde Pinnacle
dl[521] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK }  -- Culling of Stratholme
dl[542] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK }  -- Trial of the Champion
dl[601] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK }  -- Forge of Souls
dl[602] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK }  -- Pit of Saron
dl[603] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK }  -- Halls of Reflection

-- *** Cata dungeons ***

dl[756] = { normal = ATBD_REPGROUP_CITY, heroic = ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA }   -- The Deadmines
dl[764] = { normal = ATBD_REPGROUP_CITY, heroic = ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA }   -- Shadowfang Keep
dl[753] = { normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK, heroic = ATBD_REPGROUP_CATA }  -- Blackrock Caverns
dl[767] = { normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK, heroic = ATBD_REPGROUP_CATA }  -- Throne of Tides
dl[768] = { normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK, heroic = ATBD_REPGROUP_CATA }  -- Stonecore
dl[769] = { normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK, heroic = ATBD_REPGROUP_CATA }  -- Vortex Pinnacle
dl[759] = { normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA }          -- GrimBatol
dl[759] = { normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA }          -- Halls of Origination
dl[747] = { normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA }          -- Lost City of Tol'vir

-- *** Patch 4.1 dungeons ***
dl[793] = { normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA }          -- Zul'Gurub
dl[781] = { normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA }          -- Zul'Aman

-- *** Patch 4.3 dungeons ***
dl[820] = { normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA }          -- End Time
dl[816] = { normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA }          -- Well of Eternity
dl[819] = { normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA }          -- Hour of Twilight


-- *** Patch 5.0.4 dungeons ***
dl[871] = { normal = ATBD_REPGROUP_CITY } -- Scarlett Halls

-- *** Mists dungeons *** THE REPS ARE GUESSES FOR NOW
dl[875] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA + ATBD_REPGROUP_MISTS } -- Gate of the Setting Sun MoP
dl[885] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA + ATBD_REPGROUP_MISTS } -- Mogu'Shan Palace MoP
dl[877] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA + ATBD_REPGROUP_MISTS } -- Shado-pan Monastery MoP
dl[887] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA + ATBD_REPGROUP_MISTS } -- Siege of Niuzao Temple MoP
dl[876] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA + ATBD_REPGROUP_MISTS } -- Stormstout Brewery MoP
dl[867] = { normal = ATBD_REPGROUP_CITY + ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA + ATBD_REPGROUP_MISTS } -- Temple of the Jade Serpent 

ATBD.dungeons = dl
