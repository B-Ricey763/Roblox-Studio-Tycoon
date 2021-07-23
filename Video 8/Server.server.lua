local Tycoon = require(script.Parent.Tycoon)
local PlayerManager = require(script.Parent.PlayerManager)

local function FindSpawn()
	for _, spawnPoint in ipairs(workspace.Spawns:GetChildren()) do
		if not spawnPoint:GetAttribute("Occupied") then
			return spawnPoint
		end
	end
end

PlayerManager.Start()

PlayerManager.PlayerAdded:Connect(function(player)
	local tycoon = Tycoon.new(player, FindSpawn())
	tycoon:Init()
end)