local Library = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/Ui2.lua'))()
local ChitogeX = Library:CreateWindow("Main")

local LocalPlayerFolder = ChitogeX:AddFolder("LocalPlayer")

LocalPlayerFolder:AddSlider({text=' Value', min = 0,max = 300, callback = function(Value)
    _G.Speed = Value
end})
LocalPlayerFolder:AddToggle({text = ' WalkSpeed', callback = function(Value)
    while Value do wait()
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = _G.Speed
    end
    if Value == false then
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end})

Library:Init()