local PRIMARY_STATS = {
    ITEM_MOD_STRENGTH_SHORT = true,
    ITEM_MOD_AGILITY_SHORT = true,
    ITEM_MOD_INTELLECT_SHORT = true,
    ITEM_MOD_STAMINA_SHORT = true,
}

local SECONDARY_STATS = {
    ITEM_MOD_CRIT_RATING_SHORT = true,
    ITEM_MOD_HASTE_RATING_SHORT = true,
    ITEM_MOD_MASTERY_RATING_SHORT = true,
    ITEM_MOD_VERSATILITY = true,
}

local className, classFilename, classID = UnitClass("player")
local spec = GetSpecialization()

local EQUIP_SLOTS = {
    { name = "CharacterHeadSlot",          id = INVSLOT_HEAD },
    { name = "CharacterNeckSlot",          id = INVSLOT_NECK },
    { name = "CharacterShoulderSlot",      id = INVSLOT_SHOULDER },
    { name = "CharacterBackSlot",          id = INVSLOT_BACK },
    { name = "CharacterChestSlot",         id = INVSLOT_CHEST },
    { name = "CharacterShirtSlot",         id = INVSLOT_BODY },
    { name = "CharacterTabardSlot",        id = INVSLOT_TABARD },
    { name = "CharacterWristSlot",         id = INVSLOT_WRIST },
    { name = "CharacterHandsSlot",         id = INVSLOT_HAND },
    { name = "CharacterWaistSlot",         id = INVSLOT_WAIST },
    { name = "CharacterLegsSlot",          id = INVSLOT_LEGS },
    { name = "CharacterFeetSlot",          id = INVSLOT_FEET },
    { name = "CharacterFinger0Slot",       id = INVSLOT_FINGER1 },
    { name = "CharacterFinger1Slot",       id = INVSLOT_FINGER2 },
    { name = "CharacterTrinket0Slot",      id = INVSLOT_TRINKET1 },
    { name = "CharacterTrinket1Slot",      id = INVSLOT_TRINKET2 },
    { name = "CharacterMainHandSlot",      id = INVSLOT_MAINHAND },
    { name = "CharacterSecondaryHandSlot", id = INVSLOT_OFFHAND },
}

-- Rating -> color, just for visual flair.
local RATING_COLORS = {
    ["S+"] = { 1,    0.5,  0    },
    ["S"]  = { 1,    0.84, 0    },
    ["A"]  = { 0.64, 0.84, 0.2  },
    ["B"]  = { 0.3,  0.7,  1    },
    ["C"]  = { 0.8,  0.8,  0.8  },
    ["D"]  = { 0.6,  0.4,  0.4  },
}

-- ============================================================
-- Single edit point per season/patch (point #1 from before -
-- this replaces the five scattered magic numbers you had).
-- ============================================================
local SEASON_MIN_ILVL = 220   -- season's floor (e.g. Explorer/Adventurer)
local SEASON_MAX_ILVL = 344   -- season's ceiling (e.g. Myth 9/6)

local SECONDARY_WEIGHTS = {
    ITEM_MOD_CRIT_RATING_SHORT     = 0.32,
    ITEM_MOD_HASTE_RATING_SHORT    = 0.61,
    ITEM_MOD_MASTERY_RATING_SHORT  = 0.42,
    ITEM_MOD_VERSATILITY           = 0.04,
}

local function GetItemRating(itemLink)
    if not itemLink then return nil end

    local itemLevel = C_Item.GetDetailedItemLevelInfo(itemLink)
    if not itemLevel then return nil end

    local stats = C_Item.GetItemStats(itemLink)
    local secondaryScore = 0
    for stat, value in pairs(stats) do
        local weight = SECONDARY_WEIGHTS[stat]
        if weight then
            secondaryScore = secondaryScore + (value * weight)
        end
    end

    -- Axis 1: where does this ilvl sit within THIS season's range,
    -- as a 0-1 fraction, instead of a raw number.
    local ilvlPercent = (itemLevel - SEASON_MIN_ILVL) / (SEASON_MAX_ILVL - SEASON_MIN_ILVL)
    ilvlPercent = math.max(0, math.min(1, ilvlPercent))

    -- Axis 2: stat quality RELATIVE to this item's own ilvl, not an
    -- absolute number - since higher ilvl items carry bigger stat
    -- budgets by design, dividing by itemLevel cancels that out.
    local statRatio = secondaryScore / itemLevel

    local totalScore = (ilvlPercent * 70) + (math.min(statRatio / 2.5, 1) * 30)

    print(itemLink .. ": " .. string.format("%.1f", totalScore))

    if totalScore >= 90 then return "S+"
    elseif totalScore >= 75 then return "S"
    elseif totalScore >= 55 then return "A"
    elseif totalScore >= 35 then return "B"
    elseif totalScore >= 15 then return "C"
    else return "D"
    end
end


local bubbles = {}

local function CreateBubble(slotButton)
    local bubble = CreateFrame("Frame", nil, slotButton, "BackdropTemplate")
    bubble:SetSize(24, 16)
    bubble:SetPoint("TOPRIGHT", slotButton, "TOPRIGHT", 4, 4)
    bubble:SetFrameLevel(slotButton:GetFrameLevel() + 5) -- sit above the icon
    bubble:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        edgeSize = 1,
    })
    bubble:SetBackdropColor(0, 0, 0, 0.85)
    bubble:SetBackdropBorderColor(1, 1, 1, 0.6)

    local text = bubble:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    text:SetPoint("CENTER")
    bubble.text = text

    return bubble
end

local function UpdateAllRatings()
    for _, slot in ipairs(EQUIP_SLOTS) do
        local button = _G[slot.name] -- Blizzard's frames are global, so _G lookup works
        if button then
            bubbles[slot.name] = bubbles[slot.name] or CreateBubble(button)
            local bubble = bubbles[slot.name]

            local itemLink = GetInventoryItemLink("player", slot.id)
            local rating = GetItemRating(itemLink)

            if rating then
                bubble.text:SetText(rating)
                local color = RATING_COLORS[rating] or { 1, 1, 1 }
                bubble.text:SetTextColor(color[1], color[2], color[3])
                bubble:Show()
            else
                bubble:Hide() -- empty slot, or item data not loaded yet
            end
        end
    end
end



CharacterFrame:HookScript("OnShow", UpdateAllRatings)