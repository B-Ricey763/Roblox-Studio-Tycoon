local Upgrader = {}
Upgrader.__index = Upgrader

function Upgrader.new(tycoon, instance) 
	local self = setmetatable({}, Upgrader)
	self.Instance = instance
	
	return self
end

function Upgrader:Init()
	self.Instance.Detector.Touched:Connect(function(...)
		self:OnTouch(...)
	end)
end

function Upgrader:OnTouch(hit)
	local worth = hit:GetAttribute("Worth")
	
	if worth then
		hit:SetAttribute("Worth", worth * self.Instance:GetAttribute("Multiplier"))
	end
end

return Upgrader
