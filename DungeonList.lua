--[[
List of dungeons with their associated "repgroups"
]]--

local _, ATBD = ...

-- Dungeonlist
-- Note that all dungeons provide rep for the old world factions except for BC dungeons
-- Therefore this does need to be explicitly mentioned in the list of dungeons
-- Heroic only needs to list additional reps

local dl = {}


-- *** Classic dungeons ***

-- Stockades
dl[690] = { normal = ATBD_REPGROUP_CITY }

-- *** BC dungeons ***
-- These provide no rep, so no need to list them

-- *** WotLK Dungeons ***


-- *** Cata dungeons ***

-- The Deadmines
dl[756] = { normal = ATBD_REPGROUP_CITY,
            heroic = ATBD_REPGROUP_WOTLK + ATBD_REPGROUP_CATA }

-- Blackrock Caverns
dl[753] = { normal = ATBD_REPGROUP_CITY  + ATBD_REPGROUP_WOTLK,
            heroic = ATBD_REPGROUP_CATA }


ATBD.dungeons = dl
