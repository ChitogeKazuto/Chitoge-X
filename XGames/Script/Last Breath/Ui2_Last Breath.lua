Enabled = false
TP = false
Smoke = false
Range = 3

local player, code = game.Players.LocalPlayer
local getCode,getBypass = true,true
local trashh = {"Smoke","Script","BloodTexture"}

for i,v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v,"Code") then
        code = v.Code
        getCode = false
    end
end

for i,v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v,"MaybeHacker") then
        v.MaybeHacker = -math.huge
        getBypass = false
    end
end

if getCode or getBypass then
    player:Kick("Bypass didn't work :(")
    return
end

local library = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/Ui2.lua'))()

WalkSpeedSettings = {
    NSpeed = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed
}

JumpPowerSettings = {
    NJump = game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower
}

local Main = library:CreateWindow("Player")

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

MiscFolder:AddLabel({text = "               Telepots"})
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

local window = library:CreateWindow("Last Breath")

window:AddToggle({text=' Enabled',callback=function(a)Enabled=a;end})
window:AddToggle({text=' Teleport',callback=function(a)TP=a;end})
window:AddToggle({text=' Hide Smoke & Blood',callback=function(a)
    Smoke=a;
    if not Smoke then return end
    local shit = player.Character:GetDescendants()
    for i = 1, #shit do local v = shit[i]
        if table.find(trashh,v.Name) then
            v:Destroy()
        end
    end
end})
window:AddSlider({text=' Range',min=3,max=30,callback=function(a)Range=a;end})

local Settings = library:CreateWindow("Settings")

local SettingsFolder = Settings:AddFolder("Settings")

SettingsFolder:AddBind({text = ' Toggle UI', key = "RightShift", callback = function()
    library:Close()
end})
library:Init()

game:GetService("RunService").RenderStepped:Connect(function()
    if Enabled and TP then
        player.Character.Humanoid:ChangeState(11)
    end
end)

player.Character.DescendantAdded:Connect(function(v)
    wait()
    if Enabled and Smoke and table.find(trashh,v.Name) then
        v:Destroy()
    end
end)

while true do
    if Enabled then
        local titans = workspace.Titans:GetChildren()
        for i = 1, #titans do local v = titans[i]
            if pcall(function() return v.Main.Died,v.Nape end) and not v.Main.Died.Value then
                if TP then
                    repeat
                        pcall(function()
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(v.Nape.Position) + Vector3.new(0,100,0)
                        end)
                        wait()
                        workspace.Settings.Input:FireServer(code, v.Nape)
                    until v.Main.Died.Value or not Enabled or not TP
                elseif player:DistanceFromCharacter(v.Nape.Position) < Range * 10 then
                    workspace.Settings.Input:FireServer(code, v.Nape)
                    wait()
                end
            end
        end
    end
    wait(.2)
end