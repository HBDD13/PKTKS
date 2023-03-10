local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()

local InWhiteList = {
    "UndertaleRaphael",
    "Bernado10z",
    "eliomaluco23"
}

if table.find(InWhiteList, plr.Name) then
    mouse.KeyUp:Connect(function(input)
    	if input == "k" then
	    	local p = Instance.new("Part")
		    p.Anchored = true
    		p.Size = Vector3.new(20, 20, 20)
    		p.CanCollide = false
    		p.Material = Enum.Material.ForceField
	    	p.Color = Color3.new(255, 0, 0)
		    p.Parent = workspace
    		p.Position = mouse.Hit.Position
    		game.Debris:AddItem(p, 5)
            p.Touched:Connect(function(hit)
			    if hit.Parent ~= plr.Character and hit.Parent:FindFirstChildOfClass("Humanoid") and not game.Players:GetPlayerFromCharacter(hit.Parent) then
				    hit.Parent:FindFirstChildOfClass("Humanoid").Health = 0
			    	p:Destroy()
			    end
	    	end)
	    end
    end)
end