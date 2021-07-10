local Test = {}
Test.__index = Test

function Test.new(tycoon, instance)
	local self = setmetatable({}, Test)
	self.Tycoon = tycoon
	self.Instance = instance
	return self
end

function Test:Init()
	print("Test was initialized")
end

return Test