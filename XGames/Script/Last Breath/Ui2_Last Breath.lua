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
window:AddSlider({text='Range',min=3,max=30,callback=function(a)Range=a;end})

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