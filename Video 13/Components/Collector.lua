local playerManager = require(script.Parent.Parent.PlayerManager)

local Collector = {}
Collector.__index = Collector

function Collector.new(tycoon, instance)
	local self = setmetatable({}, Collector)
	self.Tycoon = tycoon
	self.Instance = instance

	return self
end

function Collector:Init()
	self.Instance.Collider.Touched:Connect(function(...)
		self:OnTouched(...)
	end)
end

function Collector:OnTouched(hitPart)
	local worth = hitPart:GetAttribute("Worth")
	if worth then
		local multiplier = self.Tycoon.Owner:GetAttribute("MoneyMultiplier") or 1
		local rebirthMultiplier = playerManager.GetMultiplier(self.Tycoon.Owner)
		self.Tycoon:PublishTopic("WorthChange", worth * multiplier * rebirthMultiplier)
		hitPart:Destroy()
	end
end

return Collector
