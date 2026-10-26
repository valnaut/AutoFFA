local f = CreateFrame("Frame")
local wasInGroup = false
local checkQueued = false

local function SetInitialFFA()
    checkQueued = false
    if not IsInGroup() then return end

    local isLeader = (UnitIsGroupLeader and UnitIsGroupLeader("player"))
        or (IsInRaid() and IsRaidLeader() == 1)
        or (not IsInRaid() and IsPartyLeader() == 1)

    if isLeader and GetLootMethod() ~= "freeforall" then
        SetLootMethod("freeforall")
    end
end

f:SetScript("OnEvent", function(self, event)
    local inGroup = IsInGroup()

    if event == "PLAYER_ENTERING_WORLD" then
        wasInGroup = inGroup
        return
    end

    if inGroup and not wasInGroup then
        wasInGroup = true
        if not checkQueued then
            checkQueued = true
            C_Timer.After(0.5, SetInitialFFA)
        end
    elseif not inGroup then
        wasInGroup = false
    end
end)

f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("PARTY_MEMBERS_CHANGED")