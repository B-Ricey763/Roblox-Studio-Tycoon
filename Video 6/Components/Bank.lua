local PlayerManager = require(script.Parent.Parent.PlayerManager)

local Bank = {}
Bank.__index = Bank

function Bank.new(tycoon, instance)
	local self = setmetatable({}, Bank)
	self.Tycoon = tycoon
	self.Instance = instance
	self.Balance = 0
	
	return self
end

function Bank:Init()
	self.Tycoon:SubscribeTopic("WorthChange", function(...)
		self:OnWorthChange(...)
	end)
	self.Instance.Pad.Touched:Connect(function(...)
		self:OnTouched(...)
	end)
end

function Bank:OnWorthChange(worth)
	self.Balance += worth
	self:SetDisplay("$" .. self.Balance)
end

function Bank:SetDisplay(str)
	self.Instance.Display.Money.Text = str
end

function Bank:OnTouched(hitPart)
	local character = hitPart:FindFirstAncestorWhichIsA("Model")
	if character then
		local player = game:GetService("Players"):GetPlayerFromCharacter(character)
		if player and player == self.Tycoon.Owner then
			local playerMoney = PlayerManager.GetMoney(player) + self.Balance
			PlayerManager.SetMoney(player, playerMoney)
			self.Balance = 0
			self:SetDisplay("$0")
		end
	end
end

return Bank
