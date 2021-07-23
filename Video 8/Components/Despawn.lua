local Despawn = {}
Despawn.__index = Despawn

function Despawn.new(tycoon, instance)
	local self = setmetatable({}, Despawn)
	self.Tycoon = tycoon
	self.Instance = instance
	
	return self
end

function Despawn:Init()
	self.Tycoon:SubscribeTopic("Button", function(id)
		if id == self.Instance:GetAttribute("Id") then
			self.Instance:Destroy()
		end
	end)
end

return Despawn
