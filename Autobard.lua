--[[
This addon will try to switch to a tabard that provides rep when entering a dungeon.

Rationale:
I made the addon because I forget to switch to a rep tabard when entering a dungeon.
Normally I wear a pretty tabard or none. It picks the tabard for the faction that
has most rep already so you will finish that factions rep first and then finish another one.

Basically all the addon does is try to switch to a tabard that provides rep when in a dungeon.

]]--


local _, ATBD = ...

-- "Constants"
local MAX_REP = 42999 -- Is max rep when Exalted and the bar is full


-- Frame to catch events
ATBD.frame = CreateFrame("Frame", "AutobardFrame")

-- Defaults
--ATBD.fromTabard = nil   -- Tabard that we switched from
--ATBD.toTabard = nil     -- Tabard that we switched to



-- Calculates a number that is a measure of rep.
function ATBD.GetFactionRep(factionId)
	local name, description, standingID, barMin, barMax, barValue = GetFactionInfoByID(factionId)

	return barValue
end


-- Find out if this dungeson provides rep for the given faction
function ATBD.DungeonProvidesRepForFaction(factionId)

print("factionId", factionId)
	local mapId = GetCurrentMapAreaID()

	print("mapId", mapId)
	-- Get factionrep group for factionID (to be defined table)
	local repGroup = ATBD.factions[factionId]
print("repGroup, dungeonRepGroups:", repGroup, ATBD.dungeons[mapId].normal)

	-- Check if correct rep in normal mode
	if (ATBD.dungeons[mapId].normal and bit.band(ATBD.dungeons[mapId].normal, repGroup) > 0) then 
print("Normal OK")
		return true 
	end

	-- Check if correct rep in heroic mode if applicable
	if (ATBD.dungeons[mapId].heroic and GetDungeonDifficulty() == 2) then  --2 means Heroic
		if (bit.band(ATBD.dungeons[mapId].heroic, repGroup) > 0) then 
print("Heroic OK")
			return true 
		end
	end

print("Not OK")
	return false
end


-- Equips best rep tabard
function ATBD.EquipRepTabard()

	local availableItems = GetInventoryItemsForSlot(INVSLOT_TABARD)

	if (not availableItems) then
		-- Abort if no tabards available
		return
	end

	-- See if there is a tabard that gives rep in this dungeon
	local currentTabardId = GetInventoryItemID("player", INVSLOT_TABARD)
	local lastRep = 0
	local bestTabard

print("Current: ", currentTabardId)

	for _, tabardId in pairs(availableItems) do
print("tabardId: ", tabardId)
		if (ATBD.tabards[tabardId]) then
print("tabardId known: ", ATBD.tabards[tabardId])

			if ( ATBD.DungeonProvidesRepForFaction(ATBD.tabards[tabardId])) then

				-- Its a different tabard and one that the addon knows (so it will provide rep)
				local thisRep = ATBD.GetFactionRep(ATBD.tabards[tabardId])
	print("rep: ", thisRep)

				if ((thisRep < MAX_REP) and (thisRep > lastRep)) then
					-- If this faction has more rep, prefer this one
					bestTabard = tabardId
					lastRep = thisRep
	print("bestTabard: ", bestTabard)
				end
			end
		end
	end

	-- Equip the tabard (if one is found and it is a different one)
	if (bestTabard and bestTabard ~= currentTabardId) then
		ATBD.fromTabard = currentTabardId
		ATBD.toTabard = bestTabard

print("From, To", ATBD.fromTabard, ATBD.toTabard)

		EquipItemByName(ATBD.toTabard) -- Also works with IDs instead of names

		local equippedTabard = GetInventoryItemID("player", INVSLOT_TABARD)
		if (equippedTabard ~= ATBD.toTabard) then
			print("Equipping tabard failed, retry...")
			ATBD.retryTimer = 1
			ATBD.frame:SetScript("OnUpdate", ATBD.OnUpdate)
		end
	end

end


-- Dequips rep tabard if it was put on by the addon
function ATBD.DequipRepTabard()
	if (not UnitIsDeadOrGhost("player")) then
		-- We are not dead
print("Not dead")

		if (ATBD.toTabard) then
			-- We changed the players tabard

			print("Switch back")
			if (IsEquippedItem(ATBD.toTabard)) then
				-- Player is still wearing the switched to tabard
				-- So try to switch back
				if (ATBD.fromTabard) then
print("Back from, To", ATBD.toTabard, ATBD.fromTabard)
					EquipItemByName(ATBD.fromTabard) -- Also works with IDs
				else
print("Dequipping", ATBD.toTabard)
					-- No tabard to switch back to, so dequip the current one
					PickupInventoryItem(INVSLOT_TABARD)
					
					-- This is silly, I can either put it in the Backpack or another Bag
					-- there seems to be no function just put it in any bag
					-- So manually figure out if there is space in bag or backpack
					for containerId = NUM_BAG_SLOTS, 1, -1 do
						freeSlots, bagType = GetContainerNumFreeSlots(containerId)
print("Baginfo id, free, type", containerId, freeSlots, bagType)
						if  ((freeSlots > 0) and (bagType == 0)) then
print("Putting it in bag", containerId, ContainerIDToInventoryID(containerId))
							PutItemInBag(ContainerIDToInventoryID(containerId))  -- This mapping seems to make it work
							break;
						end
					end

					-- If it is still on the cursor attempt the backpack
					-- when that is also full the player will get the UI error
					-- that his bags are all full, which is OK
					if (CursorHasItem()) then
print("Attempting backpack")
						PutItemInBackpack()
					end
				end

				ATBD.toTabard = nil
			end
		end
	end
end

-- Entering world see if we are in a dungeon or not and take action
function ATBD.PLAYER_ENTERING_WORLD(self, event, ...)
print("PLAYER_ENTERING_WORLD")

	local inInstance, instanceType = IsInInstance()

	if (inInstance and instanceType == "party") then
		-- We are in a 5 man instance
		if (InCombatLockdown()) then
			-- Try later when the fight is over
			ATBD.delayedEnteringWorld = true
			ATBD.frame:RegisterEvent("PLAYER_REGEN_ENABLED")
		else
			ATBD.EquipRepTabard()
		end
	else
		-- Not in a dungeon
		ATBD.DequipRepTabard()
	end
end


-- Player leaving world, restore previous tabard
function ATBD.PLAYER_LEAVING_WORLD(self, event, ...)
print("PLAYER_LEAVING_WORLD")
		if (not InCombatLockdown()) then
			-- Don't bother to try later, 
			--   we will either enter te world again
			--   or the player is logging out
			ATBD.DequipRepTabard()
		end
end


-- Player reputaion changed, see if we can switch tabard
function ATBD.UPDATE_FACTION(self, event, ...)
--print("UPDATE_FACTION")

	if (InCombatLockdown()) then
		-- Check later
		ATBD.delayedUpdateFaction = true
		ATBD.frame:UnregisterEvent("UPDATE_FACTION")
		ATBD.frame:RegisterEvent("PLAYER_REGEN_ENABLED")
		return
	end

	if (ATBD.toTabard) then
		-- We changed the players tabard
		if (IsEquippedItem(ATBD.toTabard)) then
			-- Player is still wearing it

			if (ATBD.GetFactionRep(ATBD.tabards[ATBD.toTabard]) >= MAX_REP) then
				-- We got max rep, switch tabard
				ATBD.DequipRepTabard()
				ATBD.EquipRepTabard()
			end
		end
	end
end


-- Player got out of combat, see if we can switch tabard now if it was delayed
function ATBD.PLAYER_REGEN_ENABLED(self, event, ...)
print("PLAYER_REGEN_ENABLED")
	if (ATBD.delayedUpdateFaction) then
		ATBD.UPDATE_FACTION(self, event, ...)
		ATBD.frame:RegisterEvent("UPDATE_FACTION")
	end

	if (ATBD.delayedEnteringWorld) then
		ATBD.PLAYER_ENTERING_WORLD(self, event, ...)
	end

	ATBD.frame:UnregisterEvent("PLAYER_REGEN_ENABLED")
end


-- Retry equipping after a while
function ATBD.OnUpdate(self, elapsed)
	ATBD.retryTimer = ATBD.retryTimer - elapsed

	if (ATBD.retryTimer < 0) then
		if(ATBD.toTabard) then
			local equippedTabard = GetInventoryItemID("player", INVSLOT_TABARD)

			if (equippedTabard ~= ATBD.toTabard) then
				print("Tabard still not equipped, equip it")
				-- Retry equipping tabard
				EquipItemByName(ATBD.toTabard) -- Also works with IDs instead of names

				equippedTabard = GetInventoryItemID("player", INVSLOT_TABARD)
				if (equippedTabard ~= ATBD.toTabard) then
					print("Equipping tabard failed again, retry...")
					ATBD.retryTimer = 5
					ATBD.frame:SetScript("OnUpdate", ATBD.frame.OnUpdate)
				else
					print("Equipping tabard succeeded")
					ATBD.frame:SetScript("OnUpdate", nil)
				end
			else
				print("Tabard got equipped in the meantime")
				ATBD.frame:SetScript("OnUpdate", nil)
			end
		else
			print("No tabard to equip anymore")
			ATBD.frame:SetScript("OnUpdate", nil)
		end
	end
end


-- Generic event dispatcher
ATBD.frame:SetScript("OnEvent", function(self, event, ...) ATBD[event](self, event, ...) end )

-- Events
ATBD.frame:RegisterEvent("PLAYER_ENTERING_WORLD")
ATBD.frame:RegisterEvent("PLAYER_LEAVING_WORLD")
ATBD.frame:RegisterEvent("UPDATE_FACTION")

