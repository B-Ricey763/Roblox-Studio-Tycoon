local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local player = Players.LocalPlayer

local function configGamepass(button)
	local id = button:GetAttribute("GamepassId")
	button.Activated:Connect(function()
		MarketplaceService:PromptGamePassPurchase(player, id)
	end)
end

local function configDevProduct(button)
	local id = button:GetAttribute("DevProductId")
	button.Activated:Connect(function()
		MarketplaceService:PromptProductPurchase(player, id)
	end)
end

for _, button in ipairs(CollectionService:GetTagged("GamepassButton")) do
	configGamepass(button)
end

for _, button in ipairs(CollectionService:GetTagged("DevProductButton")) do
	configDevProduct(button)
end

CollectionService:GetInstanceAddedSignal("GamepassButton"):Connect(configGamepass)
CollectionService:GetInstanceAddedSignal("DevProductButton"):Connect(configDevProduct)