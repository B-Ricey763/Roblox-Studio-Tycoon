local Tycoon = require(script.Parent.Tycoon)
local PlayerManager = require(script.Parent.PlayerManager)

PlayerManager.Start()

game:GetService("Players").PlayerAdded:Connect(function(player)
	local tycoon = Tycoon.new(player)
	tycoon:Init()
end)