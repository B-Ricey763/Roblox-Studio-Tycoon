local Tycoon = require(script.Parent.Tycoon)

game:GetService("Players").PlayerAdded:Connect(function(player)
	local tycoon = Tycoon.new(player)
	tycoon:Init()
end)