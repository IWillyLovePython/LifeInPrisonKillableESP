tools = {"Keycard", "Baton", "Bat", "AK-74", "AK-47", "SPAS", "Taser", "Handcuffs", "M9", "MP5", "AWM", "Famas", "AR-15", "Riot Shield", "FAL", "Medkit", "Screwdriver", "Hammer", "TEC-9", "Luger", "Scissors"}
getgenv().spy = true

function createESP(victimESP)
    if not victimESP.Character.Head:FindFirstChild("ummESP") then
        local gui = Instance.new("BillboardGui");
        gui.Name = "ummESP";
        gui.AlwaysOnTop = true;
        gui.LightInfluence = 0;
        gui.Size = UDim2.new(1.75, 0, 1.75, 0);
        local frame = Instance.new("Frame", gui);
        frame.BackgroundColor3 = Color3.fromRGB(170, 0, 0);
        frame.Size = UDim2.new(1, 0, 1, 0);
        frame.BorderSizePixel = 0;
        frame.Transparency = 0.7;
        local gi = gui:Clone();
        local body = frame:Clone();
        body.Parent = gi;
        body.BackgroundColor3 = Color3.fromRGB(0, 170, 170);
        
        gui:Clone().Parent = victimESP.Character.Head;
    end
end

function deleteESP(victimESP)
    for _,v in pairs(victimESP.Character.Head:GetChildren()) do
        if tostring(v.Name) == "ummESP" then
            v:Destroy()
        end
    end
end

function checkTools(plr)
    if plr.Character:FindFirstChildWhichIsA("Tool") then
        if table.find(tools, tostring(plr.Character:FindFirstChildWhichIsA("Tool").Name)) and tostring(plr.Team) == "Prisoners" then
            return true
        end
    end
    
    for _, tool in pairs(plr.Backpack:GetChildren()) do
        if table.find(tools, tostring(tool)) and tostring(plr.Team) == "Prisoners" then
            return true
        end
    end
    
end

while getgenv().spy do
    for _, players in pairs(game.Players:GetChildren()) do
        if players ~= game.Players.LocalPlayer and tostring(players.Team) == "Prisoners" then
            if checkTools(players) then
                  createESP(players)
                else
                    deleteESP(players)
                end
            end
        end
    wait(2) --updates every 2 seconds
end
