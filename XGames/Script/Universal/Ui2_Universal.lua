local Library = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/Ui2.lua'))()

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

WalkSpeedSettings = {
    NSpeed = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed
}

JumpPowerSettings = {
    NJump = game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower
}

local Main = Library:CreateWindow("Chitoge X | Main")

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
MiscFolder:AddToggle({text = ' Fly Jump', callback = function(Value)
local flyjump
if Value == true then
    if flyjump then flyjump:Disconnect() end
        flyjump = game:GetService("UserInputService").JumpRequest:Connect(function(Jump)
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
    end)
 else
    if flyjump then flyjump:Disconnect() end
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

local Settings = Library:CreateWindow("Settings")

local SettingsFolder = Settings:AddFolder("Settings")

SettingsFolder:AddBind({text = ' Toggle UI', key = "RightShift", callback = function()
    Library:Close()
end})

Library:Init()