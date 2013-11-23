---------------------------------------------
-- Setting up the local scope
---------------------------------------------
local myname, ns = ...

---------------------------------------------
-- Variables and shit
---------------------------------------------
local player = UnitName("player")
local server = GetRealmName()
local tooltips = {   -- hijacking the tooltips
  GameTooltip,
  ItemRefTooltip,
  ShoppingTooltip1,
  ShoppingTooltip2,
  ShoppingTooltip3,
  ItemRefShoppingTooltip1,
  ItemRefShoppingTooltip2,
  ItemRefShoppingTooltip3,
  WorldMapTooltip
}
local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local FACTION_BAR_COLORS = FACTION_BAR_COLORS
local GameTooltipStatusBar = GameTooltipStatusBar

---------------------------------------------
-- Config
---------------------------------------------
local font = STANDARD_TEXT_FONT

local backdrop = {
    bgFile = "Interface\Buttons\WHITE8x8",
    edgeFile = "Interface\Buttons\WHITE8x8",
    tiled = false,
    edgeSize = 1,
    insets = { left = -1, right = -1, top = -1, bottom = -1}
  }
local backdropColor = { .1,.1,.1,1 }
local borderColor = { .6,.6,.6,1 }
local scale = 1
local position = { "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -10, 250 }

---------------------------------------------
-- Functions
---------------------------------------------
-- Changing the textures
for idx, tooltip in ipairs(tooltips) do
  tooltip:SetBackdrop(backdrop)
  tooltip:SetScale(scale)
  tooltip:SetBackdropColor(backdropColor.r, backdropColor.g, backdropColor.b)
  tooltip:SetBackdropBorderColor(borderColor.r, borderColor.g, borderColor.b)
  -- tooltip:HookScript("OnShow", TooltipOnShow)
end

-- Reposition the HP bar
GameTooltipStatusBar:ClearAllPoints()
GameTooltipStatusBar:SetPoint("LEFT",3,0)
GameTooltipStatusBar:SetPoint("RIGHT",-3,0)
GameTooltipStatusBar:SetPoint("BOTTOM",GameTooltipStatusBar:GetParent(),"BOTTOM",0,3)
GameTooltipStatusBar:SetHeight(5)

GameTooltipStatusBar.bg = GameTooltipStatusBar:CreateTexture(nil,"BACKGROUND",nil,-8)
GameTooltipStatusBar.bg:SetPoint("TOPLEFT",-1,1)
GameTooltipStatusBar.bg:SetPoint("BOTTOMRIGHT",1,-1)
GameTooltipStatusBar.bg:SetTexture(1,1,1)
GameTooltipStatusBar.bg:SetVertexColor(0,0,0,0.7)

-- Hook to move
hooksecurefunc("GameTooltip_SetDefaultAnchor", function (tooltip, parent)
    tooltip:SetOwner(parent, "ANCHOR_NONE")
    tooltip:SetPoint(unpack(position))
end)

-- -- Hook into this func to color borders function GameTooltip_UnitColor(unit)

-- -- Hook into this for loading
-- hooksecurefunc ("GameTooltip_OnLoad", function (self, ...)
--     local TOOLTIP_UPDATE_TIME = _G.TOOLTIP_UPDATE_TIME
--     self.updateTooltip = TOOLTIP_UPDATE_TIME;
--     self:SetBackdropColor(backdropColor.r, backdropColor.g, backdropColor.b)
--     self:SetBackdropBorderColor(borderColor.r, borderColor.g, borderColor.b)
-- end)

-- -- Hooking into the On Hide
-- hooksecurefunc ("GameTooltip_OnHide", function (self, ...)
--     self:SetBackdropColor(backdropColor.r, backdropColor.g, backdropColor.b)
--     self:SetBackdropBorderColor(borderColor.r, borderColor.g, borderColor.b)
--     self.default = nil;
--     GameTooltip_ClearMoney(self);
--     GameTooltip_ClearStatusBars(self);
--     if ( self.shoppingTooltips ) then
--         for _, frame in pairs(self.shoppingTooltips) do
--             frame:Hide();
--         end
--     end
--     self.comparing = false;
-- end)

-- ---------------------------------------------
-- -- Registering Events
-- ---------------------------------------------
