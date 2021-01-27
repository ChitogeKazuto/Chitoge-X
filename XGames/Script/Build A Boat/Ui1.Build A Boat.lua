local XLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/Ui1.lua"))()
local ChitogeX = XLibrary.new("Chitoge X")

WalkSpeedSettings = {
    NSpeed = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed
}

JumpPowerSettings = {
    NJump = game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower
}

local LocalPlayerPage = ChitogeX:addPage("LocalPlayer", 4384401919)

local WalkSpeedSection = LocalPlayerPage:addSection("WalkSpeed")
WalkSpeedSection:addSlider("Value", 16, 0, 300, function(Value)
    _G.Speed = Value
end)
WalkSpeedSection:addToggle("Enable WalkSpeed", false, function(Value)
    _G.WalkSpeed = Value
    while _G.WalkSpeed do wait()
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = _G.Speed
    end
    if _G.WalkSpeed == false then
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeedSettings.NSpeed
    end
end)

local JumpPowerSection = LocalPlayerPage:addSection("JumpPower")
JumpPowerSection:addSlider("Value", 16, 0, 300, function(Value)
    _G.Jump = Value
end)
JumpPowerSection:addToggle("Enable JumpPower", false, function(Value)
    _G.JumpPower = Value
    while _G.JumpPower do wait()
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = _G.Jump
    end
    if _G.JumpPower == false then
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = JumpPowerSettings.NJump
    end
end)

local MiscPage = ChitogeX:addPage("Misc", 3944704135)

local JumpSection = MiscPage:addSection("Jump")

local flyjump
JumpSection:addToggle("Fly Jump", false, function(Value)
    if Value == true then
	if flyjump then flyjump:Disconnect() end
	flyjump = game:GetService("UserInputService").JumpRequest:Connect(function(Jump)
		game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
    end)
else
    if flyjump then flyjump:Disconnect() end
end
end)

local NoClipSection = MiscPage:addSection("No Clip")

NoClipSection:addToggle("Classic No Clip", false, function(Value)
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
end)
NoClipSection:addToggle("Advance No Clip", false, function(Value)
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
end)

local TelepotSection = MiscPage:addSection("Telepot")

TelepotSection:addToggle("Enable Keybind TP", false, function(Value)
    _G.EnableKeybindTP = Value
end)
TelepotSection:addKeybind("Keybind TP", Enum.KeyCode.G,function()
local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse() 
    if _G.EnableKeybindTP then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mouse.hit.p)
    end
end)

local BABAutoFarmPage = ChitogeX:addPage("Auto Farm", 4384400106)

local AutoFarmSection = BABAutoFarmPage:addSection("Auto Farm")

AutoFarmSection:addToggle("Auto Farm", false, function(Value)
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
end)

local SettingsPage = ChitogeX:addPage("Settings", 4483345737)

local SettingsSection = SettingsPage:addSection("Settings")
SettingsSection:addKeybind("Toggle Ui", Enum.KeyCode.RightShift, function()
    ChitogeX:toggle()
end)