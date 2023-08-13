


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/BigJoeyJoeyFunnies/Luck/main/CustomLib')))()
local Window = OrionLib:MakeWindow({Name = "Angel", HidePremium = false, SaveConfig = true, ConfigFolder = "Angel/MobileSword"})


local Tab = Window:MakeTab({
	Name = "PVP",
	Icon = "rbxassetid://66590365",
	PremiumOnly = false
})


Tab:AddButton({
	Name = "Trigger bot (KA)",
	Callback = function()
	
 local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
game:GetService("RunService").RenderStepped:Connect(function()
			if mouse.Target.Parent:FindFirstChild("Humanoid") and mouse.Target.Parent.Name ~= player.Name then
				mouse1press() wait() mouse1release()
			end
end)

  	end    
})



Tab:AddButton({
	Name = "Better Killaura",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/BigJoeyJoeyFunnies/roux/main/killaura.lua", true))()

  	end    
})

local Tab = Window:MakeTab({
	Name = "BYPASSES",
	Icon = "rbxassetid://66590365",
	PremiumOnly = false
})



Tab:AddButton({
    Name = "PlayerTP (click a few times)",
    Callback = function()

local function teleportToRandomPlayer()
    local players = game.Players:GetPlayers()
    local randomPlayer = players[math.random(1, #players)]
    
    if randomPlayer and randomPlayer ~= game.Players.LocalPlayer then
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = randomPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
end



teleportToRandomPlayer()

      end    
})


Tab:AddButton({
	Name = "Stick To Players",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/BigJoeyJoeyFunnies/roux/main/swordfighintg.lua", true))()
  	end    
})


local Tab = Window:MakeTab({
	Name = "MOVEMENT",
	Icon = "rbxassetid://66590365",
	PremiumOnly = false
})




local Players = game:GetService("Players")

local playerNames = {}
for _, player in ipairs(Players:GetPlayers()) do
    table.insert(playerNames, player.Name)
end

local selectedPlayerName = playerNames[1]  -- You can set a default value here initially

Tab:AddDropdown({
    Name = "Target",
    Default = selectedPlayerName,
    Options = playerNames,
    Callback = function(newValue)
        selectedPlayerName = newValue
    end
})

Tab:AddButton({
    Name = "Teleport To Target",
    Callback = function()
        local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
        if selectedPlayer then
            local selectedCharacter = selectedPlayer.Character
            if selectedCharacter then
                local humanoidRootPart = selectedCharacter:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position)
                else
                    warn("Selected player's character does not have HumanoidRootPart.")
                end
            else
                warn("Selected player does not have a character.")
            end
        else
            warn("Selected player not found.")
        end
    end
})

local isTPSpeedEnabled = false
local tpSpeed = 2 
local tpDelay = 1 
local lastPosition = nil 

local function teleportForward()
    local localPlayer = game.Players.LocalPlayer
    local character = localPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = character.HumanoidRootPart
        local forwardVector = humanoidRootPart.CFrame.lookVector
        humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position + forwardVector * tpSpeed)
    end
end

Tab:AddSlider({
    Name = "TP SPEED",
    Min = 0,
    Max = 10,
    Default = 2,
    ValueName = "Studs per Second",
    Callback = function(Value)
        tpSpeed = Value
        if isTPSpeedEnabled and lastPosition then
            teleportForward() 
        end
    end
})

Tab:AddSlider({
    Name = "Delay Between TP",
    Min = 0,
    Max = 5,
    Default = 1,
    ValueName = "Seconds",
    Callback = function(Value)
        tpDelay = Value
    end
})

Tab:AddToggle({
    Name = "TP SPEED",
    Default = false,
    Callback = function(Value)
        isTPSpeedEnabled = Value
        lastPosition = nil -- Reset the last position when enabling the toggle

        while isTPSpeedEnabled do
            local localPlayer = game.Players.LocalPlayer
            local character = localPlayer.Character

            if character and character:FindFirstChild("HumanoidRootPart") then
                local humanoidRootPart = character.HumanoidRootPart
                local currentPosition = humanoidRootPart.Position

                if lastPosition and (currentPosition - lastPosition).magnitude > 0.01 then
                    teleportForward()
                end

                lastPosition = currentPosition
            end

            wait(tpDelay) 
        end
    end
})


Tab:AddSlider({
	Name = "Speed",
	Min = 0,
	Max = 200,
	Default = 16,
	ValueName = "Speed",
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		if player.Character and player.Character:FindFirstChild("Humanoid") then
			player.Character.Humanoid.WalkSpeed = Value
		end
	end    
})

Tab:AddSlider({
	Name = "Jump Power (no anticheat xd)",
	Min = 0,
	Max = 100,
	Default = 50,
	ValueName = "Jump Power",
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		if player.Character and player.Character:FindFirstChild("Humanoid") then
			player.Character.Humanoid.JumpPower = Value
		end
	end    
})

Tab:AddButton({
    Name = "Inf Jump",
    Save = true,
    Callback = function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
    if InfiniteJumpEnabled then
        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
    end
end)
      end    
})


local Tab = Window:MakeTab({
	Name = "OTHER",
	Icon = "rbxassetid://66590365",
	PremiumOnly = false
})

local ToggleEnabled = false
local Messages = {
    "StarFunnies YT",
    "Sub to StarFunnies",
    ".gg/pfveBg3UM9!",
    ".gg/pfveBg3UM9!"
}  -- Change this to the messages you want to send
local CurrentMessageIndex = 1
local DelayBetweenMessages = 2  

local function SendMessage()
    while ToggleEnabled do
        local message = Messages[CurrentMessageIndex]
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
        wait(DelayBetweenMessages)
        
        CurrentMessageIndex = CurrentMessageIndex % #Messages + 1  
    end
end

Tab:AddToggle({
    Name = "Chat Spammer",
    Default = false,
    Callback = function(Value)
        ToggleEnabled = Value
        if ToggleEnabled then
            SendMessage()  
        end
    end
})


local isAntivoidEnabled = false
local yOffset = -50
local gridSize = 5
local partSize = 10

local function createGroundCover()
    local character = game.Players.LocalPlayer.Character
    if not character then
        return
    end

    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then
        return
    end

    local position = rootPart.Position

    local groundCover = Instance.new("Part")
    groundCover.Name = "GroundCover"
    groundCover.Size = Vector3.new((gridSize * 2 + 1000000000) * partSize, 1, (gridSize * 2 + 1000000000) * partSize)
    groundCover.Anchored = true
    groundCover.CanCollide = true
    groundCover.BrickColor = BrickColor.new("Bright red")
    groundCover.Transparency = 0.5
    groundCover.Position = Vector3.new(position.X, position.Y + yOffset, position.Z)
    groundCover.Parent = workspace
end

local function removeGroundCover()
    local existingGroundCover = workspace:FindFirstChild("GroundCover")
    if existingGroundCover then
        existingGroundCover:Destroy()
    end
end

Tab:AddToggle({
    Name = "Antivoid",
    Default = false,
    Callback = function(Value)
        isAntivoidEnabled = Value
        if isAntivoidEnabled then
            createGroundCover()
        else
            removeGroundCover()
        end
    end
})



local isAutoWinEnabled = false

local function isPlayerKillable(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        return not player.Character:FindFirstChild("ForceField")
    end
    return false
end

local function teleportToNextAlivePlayer()
    local players = game.Players:GetPlayers()
    local localPlayer = game.Players.LocalPlayer
    local currentIndex = math.random(1, #players)
    local nextIndex = currentIndex

    repeat
        nextIndex = nextIndex + 1
        if nextIndex > #players then
            nextIndex = 1
        end

        local targetPlayer = players[nextIndex]

        if targetPlayer ~= localPlayer and isPlayerKillable(targetPlayer) then
            local humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            end
        end

        wait(1) 

    until not isAutoWinEnabled
end

Tab:AddToggle({
    Name = "Auto Win",
    Default = false,
    Callback = function(Value)
        isAutoWinEnabled = Value
        if isAutoWinEnabled then
            teleportToNextAlivePlayer()
        end
    end
})



local Tab = Window:MakeTab({
	Name = "VISUAL",
	Icon = "rbxassetid://66590365",
	PremiumOnly = false
})






Tab:AddToggle({
    Name = "Sky",
    Default = false,
    Callback = function(Value)
        if Value then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=14390854426"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=14390896988"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=14390861661"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=14390864920"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=14390857794"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=14390867940"
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=6444884337"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6444884785"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=6444884337"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=6444884337"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=6444884337"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=6444884337"
        end
    end
})





