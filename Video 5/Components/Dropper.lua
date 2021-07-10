local dropsFolder = game:GetService("ServerStorage").Drops
local Debris = game:GetService("Debris")

local Dropper = {}
Dropper.__index = Dropper

function Dropper.new(tycoon, instance)
	local self = setmetatable({}, Dropper)
	self.Tycoon = tycoon
	self.Instance = instance
	self.Rate = instance:GetAttribute("Rate")
	self.DropTemplate = dropsFolder[instance:GetAttribute("Drop")]
	self.DropSpawn = instance.Spout.Spawn
	
	return self
end

function Dropper:Init()
	coroutine.wrap(function()
		while true do
			self:Drop()
			wait(self.Rate)
		end
	end)()
end

function Dropper:Drop()
	local drop = self.DropTemplate:Clone()
	drop.Position = self.DropSpawn.WorldPosition
	drop.Parent = self.Instance
	
	Debris:AddItem(drop, 10)
end

return Dropper
