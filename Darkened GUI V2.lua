--Made by : https://v3rmillion.net/member.php?action=profile&uid=1265584


_G.Settings = {
['Name'] = 'Darkeneds Exploit GUI! (V2)',
['Intro'] = false,
['Keybind'] = 'P'
}

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/QPehPJ6m", true))()


local MainScripts = Library:CreateTab('Main')

MainScripts:Button('Fly. (E)', function()
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

MainScripts:Button('Full Bright', function()
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

MainScripts:Button('Infinite Yield', function()
 loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

MainScripts:Label('Toggle below this is Super Speed.')

MainScripts:Toggle('Super Speed', false, function(bool)
 if bool then
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

MainScripts:Button('TP Tool', function()
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

MainScripts:Button('Death Zone RBLX Script', function()
 loadstring(game:HttpGet("https://pastebin.com/raw/bUiq0vWs"))();
end)

local ThyHoodScript = Library:CreateTab('Thy Hoods Scripts')
ThyHoodScript:Label('just use these only in thy hood alr?')

ThyHoodScript:Button('Get thyst Excalibur.', function()
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

local DoorsScripts = Library:CreateTab('Doors Roblox Script')
DoorsScripts:Label('Same thing as Thy Hood, only use them in the corresponding game.')

DoorsScripts:Button('MSDOORS Script', function()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/poopdoors_edited.lua"),true))()
end)

DoorsScripts:Button('Holy Hand Grenade Script (DOORS)', function()
    loadstring(game:HttpGet("https://pastebin.com/raw/x0YVrBkd", true))()
end)