if _G.Key == "ZegR9tXUjUwPYzD" then
    if game:GetService("Players").LocalPlayer.Name == "ChitogeKazuto" then
        if game.PlaceId == 537413528 then
            if _G.Ui == 1 then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/XGames/Script/Build%20A%20Boat/Ui1.Build%20A%20Boat.lua",true))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/XGames/Script/Build%20A%20Boat/Ui2.Build%20A%20Boat.lua",true))()
            end
        elseif game:GetService("Workspace").AdminSounds.SmiteSound.Name == SmiteSound then
            if _G.Ui == 2 then
                
            end
        else
            if _G.Ui == 1 then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/XGames/Script/Universal/Ui1_Universal.lua",true))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/XGames/Script/Universal/Ui2_Universal.lua",true))()
            end
        end
    else
        game:GetService("Players").LocalPlayer:Kick("Invalid Username")
    end
else
    game:GetService("Players").LocalPlayer:Kick("Invalid Whitelist")
end