local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Darkened's Exploit GUI!", "BloodTheme")

-- MAIN
local Main = Window:NewTab("Normal Exploits")
local MainSection = Main:NewSection("Pretty simple ngl.")


MainSection:NewButton("Fly Script (E TO FLY) (PC)", "FLYING", function()
    local mouse = game.Players.LocalPlayer:GetMouse()
 repeat wait() until mouse
 local plr = game.Players.LocalPlayer
 local torso = plr.Character.HumanoidRootPart
 local flying = true
 local deb = true
 local ctrl = {f = 0, b = 0, l = 0, r = 0}
 local lastctrl = {f = 0, b = 0, l = 0, r = 0}
 local maxspeed = 50
 local speed = 0

 function Fly()
 local bg = Instance.new("BodyGyro", torso)
 bg.P = 9e4
 bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
 bg.cframe = torso.CFrame
 local bv = Instance.new("BodyVelocity", torso)
 bv.velocity = Vector3.new(0,0.1,0)
 bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
 repeat wait()
 if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
 speed = speed+.5+(speed/maxspeed)
 if speed > maxspeed then
 speed = maxspeed
 end
 elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
 speed = speed-1
 if speed < 0 then
 speed = 0
 end
 end
 if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
 bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
 lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
 elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
 bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
 else
 bv.velocity = Vector3.new(0,0.1,0)
 end
 bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
 until not flying
 ctrl = {f = 0, b = 0, l = 0, r = 0}
 lastctrl = {f = 0, b = 0, l = 0, r = 0}
 speed = 0
 bg:Destroy()
 bv:Destroy()
 end
 mouse.KeyDown:connect(function(key)
 if key:lower() == "e" then
 if flying then flying = false
 else
 flying = true
 Fly()
 end
 elseif key:lower() == "w" then
 ctrl.f = 1
 elseif key:lower() == "s" then
 ctrl.b = -1
 elseif key:lower() == "a" then
 ctrl.l = -1
 elseif key:lower() == "d" then
 ctrl.r = 1
 end
 end)
 mouse.KeyUp:connect(function(key)
 if key:lower() == "w" then
 ctrl.f = 0
 elseif key:lower() == "s" then
 ctrl.b = 0
 elseif key:lower() == "a" then
 ctrl.l = 0
 elseif key:lower() == "d" then
 ctrl.r = 0
 end
 end)
 Fly()
end)

MainSection:NewButton("Fullbright", "SEE IN THE LIGHT!", function()
 if not _G.FullBrightExecuted then

	_G.FullBrightEnabled = false

	_G.NormalLightingSettings = {
		Brightness = game:GetService("Lighting").Brightness,
		ClockTime = game:GetService("Lighting").ClockTime,
		FogEnd = game:GetService("Lighting").FogEnd,
		GlobalShadows = game:GetService("Lighting").GlobalShadows,
		Ambient = game:GetService("Lighting").Ambient
	}

	game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
		if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
			_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Brightness = 1
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
		if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
			_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").ClockTime = 12
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
		if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
			_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").FogEnd = 786543
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
		if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
			_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").GlobalShadows = false
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
		if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
			_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
		end
	end)

	game:GetService("Lighting").Brightness = 1
	game:GetService("Lighting").ClockTime = 12
	game:GetService("Lighting").FogEnd = 786543
	game:GetService("Lighting").GlobalShadows = false
	game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

	local LatestValue = true
	spawn(function()
		repeat
			wait()
		until _G.FullBrightEnabled
		while wait() do
			if _G.FullBrightEnabled ~= LatestValue then
				if not _G.FullBrightEnabled then
					game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
					game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
					game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
					game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
					game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
				else
					game:GetService("Lighting").Brightness = 1
					game:GetService("Lighting").ClockTime = 12
					game:GetService("Lighting").FogEnd = 786543
					game:GetService("Lighting").GlobalShadows = false
					game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
				end
				LatestValue = not LatestValue
			end
		end
	end)
 end

 _G.FullBrightExecuted = true
 _G.FullBrightEnabled = not _G.FullBrightEnabled
end)

MainSection:NewToggle("Super-Speed", "Speed.", function(state)
    if state then
        getgenv().WalkSpeedValue = 100; --set your desired walkspeed here
 local Player = game:service'Players'.LocalPlayer;
 Player.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
 Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
 end)
 Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
    else
        getgenv().WalkSpeedValue = 25; --set your desired walkspeed here
        local Player = game:service'Players'.LocalPlayer;
        Player.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
        Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
        end)
        Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
    end
end)

MainSection:NewButton("Infinite Yield", "Inf Yield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

MainSection:NewButton("Death Zone RBLX Script", "Script", function()
    local UI = loadstring(game:HttpGet("https://pastebin.com/raw/tBv8Ex5G"))()
    local Window = UI:Main("Death Zone", "", "RightShift", "OrangeTheme")
    
    local CharacterTab = Window:Tab("Character")
    local ItemESPTab = Window:Tab("Item ESP")
    local PlayerESPTab = Window:Tab("Player ESP")
    local MiscTab = Window:Tab("Misc")
    
    local players = game:GetService("Players")
    local runservice = game:GetService("RunService")
    local player = players.LocalPlayer
    local heartbeat = runservice.Heartbeat
    local stepped = runservice.Stepped
    local lighting = game:GetService("Lighting")
    local camera = game:GetService("Workspace").CurrentCamera
    local workspace = game:GetService("Workspace")
    
    local CharSection = CharacterTab:Section()
    
    wsBypass = false
    CharSection:Toggle("Walk Speed", function(state)
        wsBypass = state
    end)
    
    wsSpeed = 16
    CharSection:Slider(57, 0, "Walk Speed Value", function(value)
        wsSpeed = value
    end)
    
    do
        local oldindex; oldindex = hookmetamethod(game, "__index", function(a, b) -- step 1 / bypass walkspeed
            if tostring(a) == "Humanoid" and tostring(b) == "WalkSpeed" and wsBypass then
                return 16
            end return oldindex(a, b)
        end)
        
        local oldnewindex; oldnewindex = hookmetamethod(game, "__newindex", function(a,b,c) -- step 2 / bypass walkspeed
            if tostring(a) == "Humanoid" and tostring(b) == "WalkSpeed" and wsBypass then
                return oldnewindex(a, b, wsSpeed)
            end return oldnewindex(a, b, c)
        end)
    end
    
    jmpBypass = false
    CharSection:Toggle("Jump Power", function(state)
        jmpBypass = state
    end)
    
    jmpPower = 50
    CharSection:Slider(120, 0, "Jump Power Value", function(value)
        jmpPower = value
    end)
    
    do
        local oldindex; oldindex = hookmetamethod(game, "__index", function(a, b) -- step 1 / bypass jump power
            if tostring(a) == "Humanoid" and tostring(b) == "JumpPower" then
                return 50
            end return oldindex(a, b)
        end)
        
        heartbeat:Connect(function() -- step 2 / bypass jump power
            pcall(function()
                if jmpBypass then 
                    player.Character.Humanoid.JumpPower = jmpPower
                else
                    player.Character.Humanoid.JumpPower = 50
                end
            end)
        end)
    end
    
    noclip = false
    CharSection:Toggle("No Clip", function(state)
        noclip = state
    end)
    
    CharSection:Button("No Jump Cooldown", function()
        while wait() do
            debug.setupvalue(getsenv(player.Backpack.JumpDisabler).f1, 3, 0)
            debug.setupvalue(getsenv(player.Backpack.JumpDisabler).f1, 2, function() return 1 end)
        end
    end)
    
    do
        stepped:Connect(function()
            pcall(function() if noclip then for i,v in pairs(player.Character:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end end end)
        end)
    end
    
    
    local MiscSection = MiscTab:Section()
    
    alwaysday = false
    MiscSection:Toggle("Always Day", function(state)
        alwaysday = state
    end)
    
    do
        lighting.Changed:Connect(function()
            if alwaysday then
                lighting.TimeOfDay = "13:00:00"
            end
        end)
    end
    
    MiscSection:KeyBind("Phase Through Wall", "LeftAlt", function()
        local oldNState = noclip
        local nCounter = 0
        noclip = true
    
        spawn(function()
            for i=1, 15 do
                wait(.5)
                nCounter += 1
            end
        end)
    
        local a = player.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.CFrame.lookVector
        repeat wait() player.Character:MoveTo(a) until nCounter == 1
    
        local b = player.Character.HumanoidRootPart.Position - Vector3.new(0,10,0)
        repeat wait() player.Character:MoveTo(b) until nCounter == 3
    
        local c = player.Character.HumanoidRootPart.Position + player.Character.HumanoidRootPart.CFrame.lookVector*7
        repeat wait() player.Character:MoveTo(c) until nCounter == 5
    
        local d = player.Character.HumanoidRootPart.Position + Vector3.new(0,11,0)
        repeat wait() player.Character:MoveTo(d) until nCounter == 7
    
        noclip = oldNState
    end)
    
    leaveifstaff = false
    MiscSection:Toggle("Leave If Staff Join", function(state)
        leaveifstaff = state
        for i,v in pairs(players:GetPlayers()) do
            if isStaff(player.UserId) and leaveifstaff then
                player:Kick("Left due to staff joining!")
            end
        end
    end)
    
    function isStaff(playerid)
        staffids = {367786152, 2573930396, 161219416, 501061949, 83353996, 46127169}
        for i,v in pairs(staffids) do
            if playerid == v then
                return true
            end
        end return false
    end
    
    do
        players.PlayerAdded:Connect(function(player)
            if isStaff(player.UserId) and leaveifstaff then
                player:Kick("Left due to staff joining!")
            end
        end)
    end
    
    MiscSection:Button("Rejoin Same Server", function(state)
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end)
    
    
    local EspSection = PlayerESPTab:Section()
    
    pName = false
    EspSection:Toggle("Name", function(state)
        pName = state
    end)
    
    pHp = false
    EspSection:Toggle("Health", function(state)
        pHp = state
    end)
    
    pDistance = false
    EspSection:Toggle("Distance", function(state)
        pDistance = state
    end)
    
    pTracers = false
    EspSection:Toggle("Tracers", function(state)
        pTracers = state
    end)
    
    pBoxes = false
    EspSection:Toggle("Boxes", function(state)
        pBoxes = state
    end)
    
    pEnableRenderRange = false
    EspSection:Toggle("Enable Render Range", function(state)
        pEnableRenderRange = state
    end)
    
    pRenderRange = 1500
    EspSection:Slider(3000, 0, "Render Range", function(value)
        pRenderRange = value
    end)
    
    function isCloseEnough(plr)
        if not pEnableRenderRange then return true end
        local estimation;
    
        if plr.Character:FindFirstChild("HumanoidRootPart") == nil then
            estimation = Vector3.new(plr.Character.CamCFrame.Value.X, plr.Character.CamCFrame.Value.Y, plr.Character.CamCFrame.Value.Z)
        else
            estimation = plr.Character.HumanoidRootPart.Position
        end
    
        if ((estimation-player.Character.HumanoidRootPart.Position).Magnitude * 0.28) < pRenderRange then
            return true
        else
            return false
        end
    end
    
    function tracerPlr(plr)
        local overRun = 0
        repeat wait() overRun += 1 until not plr or not plr.Character or plr.Character:FindFirstChild("HumanoidRootPart") ~= nil or not plr.Character or overRun > 400 or plr.Character:FindFirstChild("CamCFrame")
        if overRun > 400 or not plr.Character or not plr then return end
    
    
        local pos, vis;
        if plr.Character:FindFirstChild("HumanoidRootPart") == nil then
            local estimation = Vector3.new(plr.Character.CamCFrame.Value.X, plr.Character.CamCFrame.Value.Y, plr.Character.CamCFrame.Value.Z)
            pos, vis = camera:WorldToScreenPoint(estimation)
        elseif plr.Character:FindFirstChild("HumanoidRootPart") ~= nil then
            pos, vis = camera:WorldToScreenPoint(plr.Character.HumanoidRootPart.Position)
        end
    
        local line = Drawing.new("Line")
        line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
        line.To = Vector2.new(pos.x, pos.y - 20)
        line.Color = Color3.fromRGB(255,255,255)
        line.Thickness = 1.5
        line.Transparency = 0.5
    
        local update
        update = stepped:connect(function()
            if (not plr.Character:FindFirstChild("HumanoidRootPart") and not plr.Character:FindFirstChild("CamCFrame")) or not isCloseEnough(plr) or not pTracers then
                line.Visible = false
            else
                local estimation = Vector3.new(plr.Character.CamCFrame.Value.X, plr.Character.CamCFrame.Value.Y, plr.Character.CamCFrame.Value.Z)
                if plr.Character:FindFirstChild("Head") == nil then
                    pos, vis = camera:WorldToScreenPoint(estimation)
                else
                    pos, vis = camera:WorldToScreenPoint(plr.Character.Head.Position - Vector3.new(0,3,0))
                end
                if vis then line.To = Vector2.new(pos.x, pos.y) line.Visible = true else line.Visible = false end
            end
        end)
    
        local leaveManager
        leaveManager = players.PlayerRemoving:Connect(function(lplr)
            if lplr.Name == plr.Name then update:Disconnect() line:Remove() leaveManager:Disconnect() end
        end)
    end
    
    function boxPlr(plr)
        local overRun = 0
        repeat wait() overRun += 1 until not plr or not plr.Character or plr.Character:FindFirstChild("HumanoidRootPart") ~= nil or not plr.Character or overRun > 400
        if overRun > 400 or not plr.Character or not plr then return end
    
        local pos, vis = camera:WorldToScreenPoint(plr.Character.HumanoidRootPart.Position)
    
        local box = Drawing.new("Quad")
        box.PointA = Vector2.new()
        box.PointB = Vector2.new()
        box.PointC = Vector2.new()
        box.PointD = Vector2.new()
        box.Color = Color3.fromRGB(255,255,255)
        box.Thickness = 1.5
        box.Transparency = 1
    
        local update
        update = stepped:connect(function()
            if not plr.Character:FindFirstChild("HumanoidRootPart") or not isCloseEnough(plr) or not pBoxes then
                box.Visible = false
            else
                local pos, vis = camera:WorldToScreenPoint(plr.Character.HumanoidRootPart.Position)
    
                local size = Vector3.new(2,3,0) * plr.Character.Head.Size.Y
                local topright = (plr.Character.HumanoidRootPart.CFrame * CFrame.new(-size.X, -size.Y, 0)).Position
                local topleft = (plr.Character.HumanoidRootPart.CFrame * CFrame.new(size.X, -size.Y, 0)).Position
                local bottomright = (plr.Character.HumanoidRootPart.CFrame * CFrame.new(-size.X, size.Y, 0)).Position
                local bottomleft = (plr.Character.HumanoidRootPart.CFrame * CFrame.new(size.X, size.Y, 0)).Position
    
                local convertedTopright, visrt = camera:WorldToScreenPoint(topright)
                local convertedTopleft, vislt = camera:WorldToScreenPoint(topleft)
                local convertedBottomright, visrb = camera:WorldToScreenPoint(bottomright)
                local convertedBottomleft, vislb = camera:WorldToScreenPoint(bottomleft)
    
                if vis then
                    box.Visible = true
                    box.PointA = Vector2.new(convertedTopright.X, convertedTopright.Y + 36)
                    box.PointB = Vector2.new(convertedTopleft.X, convertedTopleft.Y + 36)
                    box.PointC = Vector2.new(convertedBottomleft.X, convertedBottomleft.Y + 36)
                    box.PointD = Vector2.new(convertedBottomright.X, convertedBottomright.Y + 36) 
                else 
                    box.Visible = false 
                end
            end
        end)
    
        local leaveManager
        leaveManager = players.PlayerRemoving:Connect(function(lplr)
            if lplr.Name == plr.Name then update:Disconnect() box:Remove() leaveManager:Disconnect() end
        end)
    end
    
    function nametagPlr(plr)
        local overRun = 0
        repeat wait() overRun += 1 until not plr or not plr.Character or plr.Character:FindFirstChild("HumanoidRootPart") ~= nil or not plr.Character or overRun > 400 or plr.Character:FindFirstChild("CamCFrame")
        if overRun > 400 or not plr.Character or not plr then return end
    
        local pos, vis;
        if plr.Character:FindFirstChild("HumanoidRootPart") == nil then
            local estimation = Vector3.new(plr.Character.CamCFrame.Value.X, plr.Character.CamCFrame.Value.Y, plr.Character.CamCFrame.Value.Z)
            pos, vis = camera:WorldToScreenPoint(estimation)
        elseif plr.Character:FindFirstChild("HumanoidRootPart") ~= nil then
            pos, vis = camera:WorldToScreenPoint(plr.Character.HumanoidRootPart.Position)
        end
    
    
        local nametag = Drawing.new("Text")
        nametag.Text = plr.Name
        nametag.Position = Vector2.new(pos.x, pos.y)
        nametag.Size = 18
        nametag.Color = Color3.fromRGB(255,255,255)
        nametag.Outline = true
        nametag.Center = true
    
        local update
        update = stepped:connect(function()
            if (not plr.Character:FindFirstChild("HumanoidRootPart") and not plr.Character:FindFirstChild("CamCFrame")) or not isCloseEnough(plr) then
                nametag.Visible = false
            else
                local estimation = Vector3.new(plr.Character.CamCFrame.Value.X, plr.Character.CamCFrame.Value.Y, plr.Character.CamCFrame.Value.Z)
                if plr.Character:FindFirstChild("HumanoidRootPart") == nil then
                    pos, vis = camera:WorldToScreenPoint(estimation)
                else
                    pos, vis = camera:WorldToScreenPoint(plr.Character.HumanoidRootPart.Position)
                end
    
                if vis then
                    nametag.Position = Vector2.new(pos.x, pos.y) 
                    nametag.Visible = true
                    nametag.Text = ""
    
                    if pName then
                        nametag.Text = plr.Name
                    end
    
                    local distance;
                    if pDistance then
                        if plr.Character:FindFirstChild("HumanoidRootPart") == nil then
                            local estimation = Vector3.new(plr.Character.CamCFrame.Value.X, plr.Character.CamCFrame.Value.Y, plr.Character.CamCFrame.Value.Z)
                            distance = math.floor((estimation-player.Character.HumanoidRootPart.Position).Magnitude*0.28)
                        else
                            distance = math.floor((plr.Character.HumanoidRootPart.Position-player.Character.HumanoidRootPart.Position).Magnitude*0.28)
                        end
                        nametag.Text = nametag.Text.." | "..tostring(distance).."m"
                    end
    
                    if pHp then
                        nametag.Text = nametag.Text.." | "..tostring(math.floor(plr.leaderstats.Health.Value)).."hp"
                    end
                else
                    nametag.Visible = false
                end
            end
        end)
    
        local leaveManager
        leaveManager = players.PlayerRemoving:Connect(function(lplr)
            if lplr.Name == plr.Name then update:Disconnect() nametag:Remove() leaveManager:Disconnect() end
        end)
    end
    
    function applyEsp(plr)
        spawn(function() boxPlr(plr) tracerPlr(plr) nametagPlr(plr) end)
    end
    
    for i,v in pairs(players:GetPlayers()) do
        if v ~= player and v.Character and v then applyEsp(v) end
    end
    
    players.PlayerAdded:Connect(function(plr)
        wait(2) applyEsp(plr)
    end)
    
    local foodEsp = false
    local ammoEsp = false
    local gunEsp = false
    local matEsp = false
    local miscEsp = false
    local attachmentsEsp = false
    local armorEsp = false
    local vehicleEsp = false
    local deathbagEsp = false
    
    local updatingI = false
    
    local iRenderRange = 200
    local counter = 0
    
    local types = setmetatable({
        ["WaterBottle"] = "food",
        ["Chips"] = "food",
        ["FirstAidKit"] = "food",
        ["CannedSoup"] = "food",
        ["Lemonade"] = "food",
        ["Soda"] = "food",
        ["Bandage"] = "food",
        ["MRE"] = "food",
        
        ["Stone"] = "mats",
        ["Metal"] = "mats",
        ["Wood"] = "mats",
        
        ["Fuel"] = "misc",
        ["BloodBag"] = "misc",
        
        ["SCARL"] = "guns",
        ["ASVAL"] = "guns",
        ["Beretta"] = "guns",
        ["ACWR"] = "guns",
        ["Magnum"] = "guns",
        ["M60"] = "guns",
        ["SPAS12"] = "guns",
        ["AK74M"] = "guns",
        ["M16"] = "guns",
        ["M1014"] = "guns",
        ["AK47"] = "guns",
        ["AEK971"] = "guns",
        ["MP7"] = "guns",
        ["M1911"] = "guns",
        ["P90"] = "guns",
        ["Minigun"] = "guns",
        ["Deagle"] = "guns",
        ["870MCS"] = "guns",
        ["AWP"] = "guns",
        ["M1Garand"] = "guns",
        ["PPSH41"] = "guns",
        ["DoubleBarrel"] = "guns",
        ["AUG"] = "guns"
    }, {
        __index = function(a, b)
            if string.find(b, "Mag") ~= nil then
                return "ammo"
            elseif string.find(b, "Barricade") ~= nil then
                return "misc"
            elseif string.find(b, "Attach") ~= nil then
                return "attachments"
            elseif string.find(b, "Vest") ~= nil or string.find(b, "Helmet") ~= nil or string.find(b, "Backpack") ~= nil or string.find(b, "Nightvision") ~= nil then
                return "armor" 
            end return nil
        end
    })
    
    function isOn(itype)
        if itype == "food" then
            return foodEsp
        elseif itype == "ammo" then
            return ammoEsp
        elseif itype == "guns" then 
            return gunEsp
        elseif itype == "mats" then
            return matEsp
        elseif itype == "misc" then
            return miscEsp
        elseif itype == "attachments" then
            return attachmentsEsp
        elseif itype == "armor" then
            return armorEsp
        elseif type == "car" then
            return vehicleEsp
        end
    end
    
    function addEsp(item, itemType)
        local partSet = "MainPart"
        if itemType == "mats" then partSet = "Union" elseif itemType == "car" then partSet = "Chassis" end
        
        if item == nil or item:FindFirstChild(partSet) == nil then return end
    
        local removed = not item:IsDescendantOf(workspace.GameStructures)
        if removed then return end
    
        local mainpart = item[partSet]
        
        local pos,vis = camera:WorldToScreenPoint(mainpart.Position)
        
        local nametag = Drawing.new("Text")
        if itemType == "car" then 
            nametag.Text = tostring(item)
        else
            nametag.Text = tostring(item.Config.ItemName.Value)
        end
        nametag.Position = Vector2.new(pos.x, pos.y)
        nametag.Size = 18
        nametag.Color = Color3.fromRGB(255,255,255)
        nametag.Outline = true
        nametag.Center = true
        
        counter += 1
        
        local update
        update = stepped:connect(function()
            pcall(function()
                local removed = not item:IsDescendantOf(workspace.GameStructures)
                if removed or updatingI then
                    counter -= 1
                    nametag:Remove()
                    update:Disconnect()
                end
                local pos,vis = camera:WorldToScreenPoint(mainpart.Position)
                if vis and isOn(itemType) then
                    if ((mainpart.Position-player.Character.HumanoidRootPart.Position).Magnitude * 0.28) < iRenderRange then
                        nametag.Position = Vector2.new(pos.x, pos.y)
                        nametag.Visible = true
                    else
                        nametag.Visible = false
                    end
                else
                    nametag.Visible = false
                end
            end)
        end)
    end
    
    local ItemEspSection = ItemESPTab:Section()
    
    ItemEspSection:Button("Update Item Esp", function()
        updatingI = true
        repeat wait() until counter == 0 wait()
        updatingI = false
    
        for i,v in pairs(workspace.GameStructures:GetChildren()) do
            for i2, a in pairs(v.Items:GetChildren()) do
                addEsp(a, types[tostring(a)]) 
            end
        end
    
        for i,v in pairs(workspace.Cars:GetChildren()) do
            addEsp(a, "car")
        end
    end)
    
    ItemEspSection:Toggle("Food/Meds", function(state)
        foodEsp = state
    end)
    
    ItemEspSection:Toggle("Ammo", function(state)
        ammoEsp = state
    end)
    
    ItemEspSection:Toggle("Guns", function(state)
        gunEsp = state
    end)
    
    ItemEspSection:Toggle("Mats", function(state)
        matEsp = state
    end)
    
    ItemEspSection:Toggle("Misc", function(state)
        miscEsp = state
    end)
    
    ItemEspSection:Toggle("Attachments", function(state)
        attachmentsEsp = state
    end)
    
    ItemEspSection:Toggle("Armor", function(state)
        armorEsp = state
    end)
    
    ItemEspSection:Toggle("Vehicles", function(state)
        vehicleEsp = state
    end)
    
    ItemEspSection:Slider(2500, 0, "Render Range", function(value)
        iRenderRange = value
    end)
    
    warn(tostring(math.random(11111,99999)).." | ".."Ran successfully!")
end)

--MISC
local Misc = Window:NewTab("Miscellaneous Exploits")
local MiscSection = Misc:NewSection("Thy Miscellaneous Exploitation")


--Thy Hood Scripts
local ThyHood = Window:NewTab("Thy Hood Scripts")
local ThyHoodSection = ThyHood:NewSection("Section Name")
ThyHoodSection:NewButton("Get the Excalibur", "ButtonInfo", function()
    local workspace = game.workspace;
 local player = game:GetService("Players").LocalPlayer;
 local goldenTrashPile = workspace:FindFirstChild("golden trash pile");
 local trashCore = goldenTrashPile.trashcore;
 local promimityPrompt = trashCore.ProximityPrompt;

 function getHumanoidRootPart()
   local character = player.Character or player.Character:Wait();
   return character.HumanoidRootPart;
 end

 local oldCFrame = getHumanoidRootPart().CFrame;
 getHumanoidRootPart().CFrame = CFrame.new(trashCore.Position.x , trashCore.Position.y + 3 , trashCore.Position.z);
 wait(0.5)
 fireproximityprompt(promimityPrompt , 0);
 getHumanoidRootPart().CFrame = oldCFrame;
end)

--just for the tp tool loloolololololollol
MainSection:NewButton("TP Tool", " ", function()

    local plr = game:GetService("Players").LocalPlayer
 local mouse = plr:GetMouse()

 local tool = Instance.new("Tool")
 tool.RequiresHandle = false
 tool.Name = "Click Teleport"

 tool.Activated:Connect(function()
 local root = plr.Character.HumanoidRootPart
 local pos = mouse.Hit.Position+Vector3.new(0,2.5,0)
 local offset = pos-root.Position
 root.CFrame = root.CFrame+offset
 end)

 tool.Parent = plr.Backpack
end)

--Player Settings
local PlayerSet = Window:NewTab("Player Modifier")
local PlayerSection = PlayerSet:NewSection("Modifiers")

PlayerSection:NewSlider("Jump Power", "SliderInfo", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)
PlayerSection:NewSlider("Walk Speed", "SliderInfo", 200, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)


--Script Hub
local ScriptHub = Window:NewTab("Script Hub")
local ScriptSection = ScriptHub:NewSection("Scripts that my friend, Elim, gave to me.")

ScriptSection:NewButton("Harked REBORN!", "Loads up Harked Reborn.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/JxcExploit/Harkedv2-script/main/Leaked-v2hardked"))()
end)


















































MainSection:NewKeybind("hide ui", "KeybindInfo", Enum.KeyCode.M, function()
	Library:ToggleUI()
end)
