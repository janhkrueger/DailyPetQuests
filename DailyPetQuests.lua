print("Daily Pet Quests successfully loaded!")

local mainFrame = CreateFrame("Frame", "DailyPetQuestsFrame", UIParent, "BasicFrameTemplateWithInset")
mainFrame:SetSize(500, 350)
mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)

mainFrame.TitleBg:SetHeight(30)
mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
mainFrame.title:SetPoint("TOPLEFT", mainFrame.TitleBg, "TOPLEFT", 5, -3)
mainFrame.title:SetText("Daily Pet Quests")

mainFrame.playerName = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
mainFrame.playerName:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 15, -35)
mainFrame.playerName:SetText("Character: " .. UnitName("player") .. " (Level " .. UnitLevel("player") .. ")")

mainFrame:Hide()

mainFrame:EnableMouse(true)
mainFrame:SetMovable(true)
mainFrame:RegisterForDrag("LeftButton")
mainFrame:SetScript("OnDragStart", function(self)
	self:StartMoving()
end)
mainFrame:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
end)

mainFrame:SetScript("OnShow", function()
        PlaySound(808)
end)

mainFrame:SetScript("OnHide", function()
        PlaySound(808)
end)


-- Define the commands to open the addon window
SLASH_MYADDON1 = "/dpq"
SLASH_MYADDON2 = "/dailypetquests"

-- Open when closed, close then opened
SlashCmdList["MYADDON"] = function()
    if mainFrame:IsShown() then
        mainFrame:Hide()
    else
        mainFrame:Show()
    end
end



-- Allow to close the frame with the Escape key
table.insert(UISpecialFrames, "DailyPetQuestsFrame")