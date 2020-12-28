-- split a string
function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function listContent(guildMember,mode)
	local ypos = -10;
	for _, member in ipairs(guildMember) do

		local res = Split(member,",")

		--if pvpMode.isChecked and res[2] == "1" then 
		if res[mode] == "1" then 
		local memberLine = matesListFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		memberLine:SetPoint("TOPLEFT",10 ,ypos)
		memberLine:SetText(res[1])

		local whisp = CreateFrame("Button", "G_whisp", matesListFrame, "UIPanelButtonTemplate")
		whisp:SetText(" Whisp ")
		whisp:SetPoint("TOPLEFT",120 ,ypos)
		whisp:SetWidth(100)

		local group = CreateFrame("Button", "G_group", matesListFrame, "UIPanelButtonTemplate")
		group:SetPoint("TOPLEFT",250 ,ypos)
		group:SetText(" Invit ")
		group:SetWidth(100)
		ypos = ypos - 25
		end
		
	end ;
end
-- (1)
local f = CreateFrame("Frame", "MaxiFrame", UIParent, BackdropTemplateMixin and "BackdropTemplate");
f:SetSize(410, 400)
f:SetPoint("CENTER")

-- (2)
f:SetBackdrop({
	bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
	edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
	edgeSize = 1,
})
f:SetBackdropColor(0, 0, 0, .5)
f:SetBackdropBorderColor(0, 0, 0)

-- (3)
f:EnableMouse(true)
f:SetMovable(true)
f:RegisterForDrag("LeftButton")
f:SetScript("OnDragStart", f.StartMoving)
f:SetScript("OnDragStop", f.StopMovingOrSizing)
f:SetScript("OnHide", f.StopMovingOrSizing)

-- (4)
local close = CreateFrame("Button", "YourCloseButtonName", f, "UIPanelCloseButton")
close:SetPoint("TOPRIGHT", f, "TOPRIGHT")
close:SetScript("OnClick", function()
	f:Hide()
end)

-- playstyle boxes

local modeSelector = CreateFrame ("Frame", "SelectorFrame", f)
modeSelector:SetSize(380, 50)
modeSelector:SetPoint("TOPLEFT",20,-20)

 pvpMode = CreateFrame("CheckButton", "pvpCheckbox", modeSelector, "ChatConfigCheckButtonTemplate");
pvpCheckboxText:SetText("PVP");
pvpMode:SetPoint("TOPLEFT", 0, 0);
pvpMode.tooltip = "I want to kill some peoples";


 wquestMode = CreateFrame("CheckButton", "Wquest", modeSelector, "ChatConfigCheckButtonTemplate");
WquestText:SetText("World quests");
Wquest:SetPoint("TOPLEFT", 0, -20);
wquestMode.tooltip = "I will do my world quests";

 mythicMode = CreateFrame("CheckButton", "mythic", modeSelector, "ChatConfigCheckButtonTemplate");
mythicText:SetText("Mythic");
mythic:SetPoint("TOPLEFT", 200, 0);
mythicMode.tooltip = "It's mythic time !";

 torghastMode = CreateFrame("CheckButton", "torghast", modeSelector, "ChatConfigCheckButtonTemplate");
torghastText:SetText("Torghast");
torghast:SetPoint("TOPLEFT", 200, -20);
torghastMode.tooltip = "I'm going to clear some torghast floors";

local sf = CreateFrame("ScrollFrame", nil, f,BackdropTemplateMixin and "UIPanelScrollFrameTemplate,BackdropTemplate")
sf:SetSize(360, 310)
sf:SetPoint("TOPLEFT",20,-70)
sf:SetBackdrop({
	bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
	edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
	edgeSize = 1,
})
sf:SetBackdropColor(0, 0, 0, .5)
sf:SetBackdropBorderColor(0, 0, 0)

matesListFrame = CreateFrame ("Frame", "G_matesListFrame", f, BackdropTemplateMixin and "BackdropTemplate")
matesListFrame:SetSize(360, 310)
matesListFrame:SetPoint("TOPLEFT",20,-70)


local guildMember = {"griga,0,1,0,1", "Celuryl,0,1,0,1", "Kaspa,0,1,0,1", "Maxidoo,0,1,0,1","Kanesh,0,1,0,1","Soupeline,0,1,0,1","Reycto,0,1,0,1"
					,"Vahnniiiz,0,1,0,1","Sarrg,0,1,0,1","Athé,0,1,0,1","Universis,1,0,0,1","phillipe,0,0,0,1","jean heude,0,1,0,0",
					"jaques,1,0,0,1","Ho le con,0,0,0,0"}


	-- listContent(guildMember)

sf:SetScrollChild(matesListFrame)

pvpMode:SetScript("OnClick", 
   function()
	listContent(guildMember,2)
   end
);

wquestMode:SetScript("OnClick", 
	function()
	listContent(guildMember,3)
	end
);

