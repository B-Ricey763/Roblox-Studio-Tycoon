local template = game:GetService("ServerStorage").Template

local function NewModel(model, cframe)
	local newModel = model:Clone()
	newModel:SetPrimaryPartCFrame(cframe)
	newModel.Parent = workspace
	return newModel
end

local Tycoon = {}
Tycoon.__index = Tycoon

function Tycoon.new(player)
	local self = setmetatable({}, Tycoon)
	self.Owner = player
	
	return self
end

function Tycoon:Init()
	self.Model = NewModel(template, CFrame.new(0, 1, 0))
end

function Tycoon:Destroy()
	self.Model:Destroy()
end

return Tycoon
