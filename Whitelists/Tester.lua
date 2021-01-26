if getgenv().Key == "Tester" then
    if getgenv().Ui == 1 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/Games/Universal/Ui1_Universal.lua",true))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ChitogeKazuto/Chitoge-X/master/Games/Universal/Ui2_Universal.lua",true))()
     end
else
    game:GetService("Players").LocalPlayer:Kick("Invalid Whitelist")
end