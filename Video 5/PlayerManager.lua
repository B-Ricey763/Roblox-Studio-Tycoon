local Players = game:GetService("Players")

local function LeaderboardSetup()
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	
	local money = Instance.new("IntValue")
	money.Name = "Money"
	money.Value = 0
	money.Parent = leaderstats
	return leaderstats
end

local PlayerManager = {}

function PlayerManager.Start()
	Players.PlayerAdded:Connect(PlayerManager.OnPlayerAdded)
end

function PlayerManager.OnPlayerAdded(player)
	local leaderstats = LeaderboardSetup()
	leaderstats.Parent = player
end

function PlayerManager.GetMoney(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	if leaderstats then
		local money = leaderstats:FindFirstChild("Money")
		if money then
			return money.Value
		end
	end	
	return 0
end

function PlayerManager.SetMoney(player, value)
	if value then
		local leaderstats = player:FindFirstChild("leaderstats")
		if leaderstats then
			local money = leaderstats:FindFirstChild("Money")
			if money then
				money.Value = value
			end
		end		
	end
end

return PlayerManager
