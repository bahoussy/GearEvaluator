local ADDON_NAME, addon = ...

print("=== MY ADDON MAIN.LUA LOADED ===")
print("Addon name:", ADDON_NAME)
print("SpecWeights exists:", addon.SpecWeights ~= nil)

local GetItemRating

SLASH_MYTEST1 = "/test"
SlashCmdList["MYTEST"] = function(msg)
    local itemID = tonumber(msg)
    if itemID then
        local _, itemLink = GetItemInfo(itemID)
        if itemLink then
            print(itemLink)
            local result = GetItemRating(itemLink)  
            if result then
    print(result.rating, string.format("%.1f", result.totalScore))
    print("itemLevel:", result.itemLevel, "ilvlScore:", result.ilvlScore)
    print("secondaryScore:", result.secondaryScore, "statScore:", result.statScore)
end
        else
            print("Item not cached. Try again in a second.")
        end
    else
        print("Please provide a valid item ID. Example: /test 19019")
    end
end


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

local RATING_COLORS = {
    ["S+"] = { 1,    0.5,  0    },
    ["S"]  = { 1,    0.84, 0    },
    ["A"]  = { 0.64, 0.84, 0.2  },
    ["B"]  = { 0.3,  0.7,  1    },
    ["C"]  = { 0.8,  0.8,  0.8  },
    ["D"]  = { 0.6,  0.4,  0.4  },
}
local SEASON_MIN_ILVL = 220
local SEASON_MAX_ILVL = 344

local SECONDARY_WEIGHTS = addon.SpecWeights.default

SlashCmdList["MYTEST"] = function(msg)
    -- expects something like: /test 271526:13335:12854
    local parts = { strsplit(":", msg) }
    local itemID = tonumber(parts[1])

    if not itemID then
        print("Please provide an item ID, optionally followed by bonus IDs.")
        print("Example: /test 271526:13335:12854")
        return
    end

    local bonusIDs = {}
    for i = 2, #parts do
        table.insert(bonusIDs, parts[i])
    end

    local itemString
    if #bonusIDs > 0 then
        itemString = "item:" .. itemID .. "::::::::::::" .. #bonusIDs .. ":" .. table.concat(bonusIDs, ":")
    else
        itemString = "item:" .. itemID
    end

    local _, itemLink = GetItemInfo(itemString)
    if itemLink then
        print(itemLink)
        local result = GetItemRating(itemLink)
        if result then
            print(result.rating, string.format("%.1f", result.totalScore))
            print("itemLevel:", result.itemLevel, "ilvlScore:", result.ilvlScore)
            print("secondaryScore:", result.secondaryScore, "statScore:", result.statScore)
        end
    else
        print("Item not cached yet. Try again in a second.")
    end
end

GetItemRating = function(itemLink)
    if not itemLink then return nil end

    local itemLevel = C_Item.GetDetailedItemLevelInfo(itemLink)
    if not itemLevel then return nil end

    local stats = C_Item.GetItemStats(itemLink)
    if not stats then stats = {} end
    local secondaryScore = 0

    for stat, value in pairs(stats) do
        local weight = SECONDARY_WEIGHTS[stat]

        if weight then
            secondaryScore = secondaryScore + (value * weight)
        end
    end

    local ilvlPercent =
        (itemLevel - SEASON_MIN_ILVL) /
        (SEASON_MAX_ILVL - SEASON_MIN_ILVL)

    ilvlPercent = math.max(0, math.min(1, ilvlPercent))
    local ilvlScore = ilvlPercent * 70 

    local STAT_RATIO_MIN = 0.02
    local STAT_RATIO_MAX = 0.18

    local statRatio = secondaryScore / itemLevel
    local statPercent = (statRatio - STAT_RATIO_MIN) / (STAT_RATIO_MAX - STAT_RATIO_MIN)
    statPercent = math.max(0, math.min(1, statPercent))
    local statScore = statPercent * 30

    local totalScore = ilvlScore + statScore
    local rating

    if totalScore >= 90 then
        rating = "S+"
    elseif totalScore >= 75 then
        rating = "S"
    elseif totalScore >= 55 then
        rating = "A"
    elseif totalScore >= 35 then
        rating = "B"
    elseif totalScore >= 15 then
        rating = "C"
    else
        rating = "D"
    end

    return {
        rating = rating,
        itemLevel = itemLevel,
        secondaryScore = secondaryScore,
        ilvlScore = ilvlScore,
        statScore = statScore,
        totalScore = totalScore,
    }
end


local bubbles = {}

local function CreateBubble(slotButton)
    local bubble = CreateFrame("Frame", nil, slotButton, "BackdropTemplate")

    bubble:SetSize(24, 16)
    bubble:SetPoint("TOPRIGHT", slotButton, "TOPRIGHT", 4, 4)
    bubble:SetFrameLevel(slotButton:GetFrameLevel() + 5)

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

    -- Allow the frame to receive mouse events.
    bubble:EnableMouse(true)

    bubble:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")

        GameTooltip:AddLine("Gear Score Breakdown", 1, 1, 1)
        GameTooltip:AddLine(" ")

        GameTooltip:AddDoubleLine(
            "Item Level",
            tostring(self.itemLevel),
            1, 1, 1,
            1, 1, 1
        )

        GameTooltip:AddDoubleLine(
            "Item Level Score",
            string.format("%.1f", self.ilvlScore),
            1, 1, 1,
            1, 1, 1
        )

        GameTooltip:AddDoubleLine(
            "Secondary Score",
            string.format("%.1f", self.secondaryScore),
            1, 1, 1,
            1, 1, 1
        )

        GameTooltip:AddDoubleLine(
            "Final Score",
            string.format("%.1f", self.totalScore),
            1, 0.84, 0,
            1, 1, 1
        )

        GameTooltip:Show()
    end)

    bubble:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    return bubble
end

local function TooltipRating(tooltip, data)
    if not tooltip or not data then return end

    local itemLink = (data.guid and C_Item.GetItemLinkByGUID(data.guid)) or data.hyperlink
    if not itemLink then return end

    local result = GetItemRating(itemLink)
    if result and result.rating then
        tooltip:AddLine(" |cffffd100("..result.rating..")")
        tooltip:AddLine(" |cffffd100("..result.totalScore..")")
    end
end
TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, TooltipRating)



local function UpdateAllRatings()
    for _, slot in ipairs(EQUIP_SLOTS) do
        local button = _G[slot.name]

        if button then
            bubbles[slot.name] =
                bubbles[slot.name] or CreateBubble(button)

            local bubble = bubbles[slot.name]

            local itemLink = GetInventoryItemLink("player", slot.id)
            local result = GetItemRating(itemLink)

            if result then
                bubble.text:SetText(result.rating)

                local color =
                    RATING_COLORS[result.rating] or { 1, 1, 1 }

                bubble.text:SetTextColor(
                    color[1],
                    color[2],
                    color[3]
                )

                bubble.itemLevel = result.itemLevel
                bubble.secondaryScore = result.secondaryScore
                bubble.ilvlScore = result.ilvlScore
                bubble.statScore = result.statScore
                bubble.totalScore = result.totalScore

                bubble:Show()
            else
                bubble:Hide()
            end
        end
    end
end


CharacterFrame:HookScript("OnShow", UpdateAllRatings)


local eventFrame = CreateFrame("Frame")

eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")

eventFrame:SetScript("OnEvent", function(self, event, ...)
    print("Event fired:", event)

    UpdateSpecWeights()

    UpdateAllRatings()
end)