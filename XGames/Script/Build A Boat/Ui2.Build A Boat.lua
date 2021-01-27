local Library = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/Ui2.lua'))()

WalkSpeedSettings = {
    NSpeed = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed
}

JumpPowerSettings = {
    NJump = game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower
}

local Main = Library:CreateWindow("Player")

local LocalPlayerFolder = Main:AddFolder("LocalPlayer")

LocalPlayerFolder:AddLabel({text = "             WalkSpeed"})
LocalPlayerFolder:AddSlider({text=' Value', value = 16, min = 0,max = 300, callback = function(Value)
    _G.Speed = Value
end})
LocalPlayerFolder:AddToggle({text = ' Enable WalkSpeed', callback = function(Value)
    _G.WalkSpeed = Value
    while _G.WalkSpeed do wait()
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = _G.Speed
    end
    if _G.WalkSpeed == false then
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeedSettings.NSpeed
    end
end})
LocalPlayerFolder:AddLabel({text = "             JumpPower"})
LocalPlayerFolder:AddSlider({text=' Value', value = 50, min = 0, max = 300, callback = function(Value)
    _G.Jump = Value
end})
LocalPlayerFolder:AddToggle({text = ' Enable JumpPower', callback = function(Value)
    _G.JumpPower = Value
    while _G.JumpPower do wait()
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = _G.Jump
    end
    if _G.JumpPower == false then
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = JumpPowerSettings.NJump
    end
end})

local MiscFolder = Main:AddFolder("Misc")

MiscFolder:AddLabel({text = "                 Jump"})
local flyjumpx
MiscFolder:AddToggle({text = ' Fly Jump', callback = function(Value)
    if Value == true then
    if flyjumpx then flyjumpx:Disconnect() end
    flyjumpx = game:GetService("UserInputService").JumpRequest:Connect(function(Jump)
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
    end)
else
    if flyjumpx then flyjumpx:Disconnect() end
end
end})
MiscFolder:AddLabel({text = "                No Clip"})
MiscFolder:AddToggle({text = ' Classic No Clip', callback = function(Value)
noclip = true 
game:GetService('RunService').Stepped:connect(function()
if noclip then
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
end)
    if Value == true then
        noclip = true
    else
        noclip = false 
    end
end})
MiscFolder:AddToggle({text = ' Advance No Clip', callback = function(Value)
    local Noclipping = nil
Clip = false

if Value == true then
local function NoclipLoop()
		if Clip == false and game:GetService("Players").LocalPlayer.Character ~= nil then
			for _, child in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
					child.CanCollide = false
				end
			end
		end
    end
Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
else
    if Noclipping then
		Noclipping:Disconnect()
	end
    Clip = true
end
end})

MiscFolder:AddLabel({text = "                Telepot"})
MiscFolder:AddToggle({text = ' Enable Keybind TP', callback = function(Value)
    _G.EnableKeybindTP = Value
end})
MiscFolder:AddBind({text = ' Keybind TP', key = "", callback = function(Value)
local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse() 
    if _G.EnableKeybindTP then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mouse.hit.p)
    end
end})

local BABAutoFarm = Library:CreateWindow("Build A Boat ")

local AutoFarmFolder = BABAutoFarm:AddFolder("Auto Farm")

AutoFarmFolder:AddToggle({text = ' Auto Farm', callback = function(Value)
_G.EZ = Value

noclip = true 
game:GetService('RunService').Stepped:connect(function()
if noclip then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
end)
if _G.EZ then
    noclip = true
else
    noclip = false 
end
    
while _G.EZ do wait()
local TweenService = game:GetService("TweenService")
local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local info = TweenInfo.new(1, Enum.EasingStyle.Linear)
local g = {}
g.CFrame = CFrame.new(-51.5656, 65, 1369.09)
local Tween = TweenService:Create(HRP, info, g)
Tween:Play()
    
wait(2)
    
local aHRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local ainfo = TweenInfo.new(20, Enum.EasingStyle.Linear)
local ag = {}
ag.CFrame = CFrame.new(-51.5656, 65, 8500.09)
    
local aTween = TweenService:Create(aHRP, ainfo, ag)
aTween:Play()
    
wait(20)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-55.7065, -358.74, 9492.36)
wait(10)
game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
wait(10)
end
end})

local BABMiscFolder = BABAutoFarm:AddFolder("Misc")

BABMiscFolder:AddList({text = "Base Telepot", values = {"White","Red","Black","Green","Blue","Yellow","Pink"}, callback = function(Value)
    if Value == "White" then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-50.8146, -9.7, -500.2)
    elseif Value == "Red" then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(377.043, -9.7, -65.0704)
    elseif Value == "Black" then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-482.216, -9.7, -68.9846)
    elseif Value == "Green" then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-481.95, -9.7, 293.866)
    elseif Value == "Blue" then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(379.19, -9.7, 300.31)
    elseif Value == "Yellow" then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-484.445, -9.7, 639.808)
    elseif Value == "Pink" then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(377.688, -9.7, 646.362)
    end
end})

local Settings = Library:CreateWindow("Settings")

local SettingsFolder = Settings:AddFolder("Settings")

SettingsFolder:AddBind({text = ' Toggle UI', key = "RightShift", callback = function()
    Library:Close()
end})

Library:Init()