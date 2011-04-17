--[[
This addon will try to switch to a tabard that provides rep when entering a dungeon.

TODO
- Select a tabard that gives rep in that dungeon. E.g. Tabards do not
  give rep in BC dungeons. Cata tabards give no rep in LK dungeons (I think)

Rationale:
I made the addon because I forget to switch to a rep tabard when entering a dungeon.
Normally I wear a pretty tabard or none. It picks the tabard for the faction that
has most rep already so you will finish that factions rep first and then finish another one.

Basically all the addon does is try to switch to a tabard that provides rep when in a dungeon.

It will not:
- Switch tabards when you get exalted in a dungeon
- Be able to switch back when you reloadui or relog when in a dungeon
- Switch back if you manually changed the tabard in the dungeon 
  (this is intended since you manually overridden the addon)

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


-- Equips best rep tabard
function ATBD.EquipRepTabard()

	local availableItems = GetInventoryItemsForSlot(INVSLOT_TABARD)

	if (not availableItems) then
		-- Abort if no tabards available
		return
	end

	-- See if there is a tabard that gives rep (TODO in this dungeon)
	local currentTabardId = GetInventoryItemID("player", INVSLOT_TABARD)
	local lastRep = 0
	local bestTabard

print("Current: ", currentTabardId)

	for _, tabardId in pairs(availableItems) do
print("tabardId: ", tabardId)
		if (ATBD.tabards[tabardId]) then

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

	-- Equip the tabard (if one is found and it is a different one)
	if (bestTabard and bestTabard ~= currentTabardId) then
		ATBD.fromTabard = currentTabardId
		ATBD.toTabard = bestTabard

print("From, To", ATBD.fromTabard, ATBD.toTabard)

		EquipItemByName(bestTabard) -- Also works with IDs instead of names
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
print("In 5 man dungeon")
		-- We are in a 5 man instance
		ATBD.EquipRepTabard()
	else
		-- Not in a dungeon
print("Not in dungeon")
		ATBD.DequipRepTabard()
	end
end


-- Player leaving world, restore previous tabard
function ATBD.PLAYER_LEAVING_WORLD(self, event, ...)
	ATBD.DequipRepTabard()
end


-- Player reputaion changed, see if we can switch tabard
function ATBD.UPDATE_FACTION(self, event, ...)
--print("UPDATE_FACTION")

	if (InCombatLockdown()) then
		-- Check later
		ATBD.frame:UnregisterEvent("UPDATE_FACTION")
		ATBD.frame:RegisterEvent("PLAYER_REGEN_ENABLED")
		return
	end

	if (ATBD.toTabard) then
		-- We changed the players tabard
		if (IsEquippedItem(ATBD.toTabard)) then
			-- Player is still wearing it

			if (ATBD.GetFactionRep(ATBD.tabards[tabardId]) >= MAX_REP) then
				-- We got max rep, switch tabard
				ATBD.DequipRepTabard()
				ATBD.EquipRepTabard()
			end
		end
	end
end


-- Player got out of combat, see if we can switch tabard because of done with rep
function ATBD.PLAYER_REGEN_ENABLED(self, event, ...)
print("PLAYER_REGEN_ENABLED")
	ATBD.UPDATE_FACTION(self, event, ...)
	ATBD.frame:RegisterEvent("UPDATE_FACTION")
	ATBD.frame:UnregisterEvent("PLAYER_REGEN_ENABLED")
end


-- Generic event dispatcher
ATBD.frame:SetScript("OnEvent", function(self, event, ...) ATBD[event](self, event, ...) end )

-- Events
ATBD.frame:RegisterEvent("PLAYER_ENTERING_WORLD")
ATBD.frame:RegisterEvent("PLAYER_LEAVING_WORLD")
ATBD.frame:RegisterEvent("UPDATE_FACTION")

