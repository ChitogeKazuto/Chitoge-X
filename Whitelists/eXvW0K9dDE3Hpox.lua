if _G.Key == "eXvW0K9dDE3Hpox" then
    if game:GetService("Players").LocalPlayer.Name == "poommegeggthai" then
        if game.PlaceId == 537413528 then
            if _G.Ui == 1 then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/XGames/Script/Build%20A%20Boat/Ui1_Build%20A%20Boat.lua",true))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/XGames/Script/Build%20A%20Boat/Ui2_Build%20A%20Boat.lua",true))()
            end
        elseif game:GetService("Workspace").AdminSounds.SmiteSound.Name == "SmiteSound" then
            if _G.Ui == 2 then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/XGames/Script/Last%20Breath/Ui2_Last%20Breath.lua",true))()
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