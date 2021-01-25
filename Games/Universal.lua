local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/Ui.lua"))()
local ChitogeX = Library.new("Chitoge X [Demo]")


local LocalPlayerPage = ChitogeX:addPage("LocalPlayer", 4384401919)
local WalkSpeedSection = LocalPlayerPage:addSection("WalkSpeed")
local JumpPowerSection = LocalPlayerPage:addSection("JumpPower")
local NoClipSection = LocalPlayerPage:addSection("No Clip")

local SettingsPage = ChitogeX:addPage("Settings", 4483345737)
local SettingsSection = SettingsPage:addSection("Settings")


WalkSpeedSettings = {
    NSpeed = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed
}

JumpPowerSettings = {
    NJump = game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower
}

WalkSpeedSection:addSlider("Value", WalkSpeedSettings.NSpeed, 0, 300, function(Value) -- WalkSpeed
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
JumpPowerSection:addSlider("Value", JumpPowerSettings.NJump, 0, 300, function(Value) -- JumpPower
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
NoClipSection:addToggle("No Clip", false, function(Value) -- NoClip
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

ChitogeX:SelectPage(NebuleX.pages[2], true)