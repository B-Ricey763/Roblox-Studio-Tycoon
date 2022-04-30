local PlayerManager = require(script.Parent.PlayerManager)
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local products = {
	[1257541489] = function(player)
		PlayerManager.SetMoney(player, PlayerManager.GetMoney(player) + 1000)
		return true 
	end,
}

MarketplaceService.ProcessReceipt = function(info)
	local player = Players:GetPlayerByUserId(info.PlayerId)
	if not player then
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
	
	local success, result = pcall(products[info.ProductId], player)
	if not success or not result then 
		warn("Error for Product" .. result)
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
	
	return Enum.ProductPurchaseDecision.PurchaseGranted
end