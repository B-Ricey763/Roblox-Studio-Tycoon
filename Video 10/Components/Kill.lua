local Kill = {}


Kill.__index = Kill



function Kill.new(tycoon, instance)


	local self = setmetatable({}, Kill)


	self.Tycoon = tycoon


	self.Instance = instance


	


	return self


end



function Kill:Init()


	self.Instance.Touched:Connect(function(...)


		self:OnTouched(...)


	end)


end



function Kill:OnTouched(hit)


	local owner = self.Tycoon.Owner


	local character = hit:FindFirstAncestorWhichIsA("Model")


	local humanoid = character and character:FindFirstChild("Humanoid")


	


	if humanoid and character ~= owner.Character then


		humanoid:TakeDamage(100)


	end


end



return Kill


