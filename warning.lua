
local function createWarningNotification(message)
    local warningScreenGui = Instance.new("ScreenGui")
    warningScreenGui.Name = "WarningScreenGui"
    warningScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

    local notificationLabel = Instance.new("TextLabel")
    notificationLabel.Size = UDim2.new(0, 500, 0, 40)
    notificationLabel.Position = UDim2.new(1, -220, 1, -60)
    notificationLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    notificationLabel.BorderColor3 = Color3.fromRGB(255, 0, 0)
    notificationLabel.BorderSizePixel = 2
    notificationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    notificationLabel.Font = Enum.Font.SourceSansBold
    notificationLabel.FontSize = Enum.FontSize.Size18
    notificationLabel.Text = message
    notificationLabel.Parent = warningScreenGui


    local function animateNotification()
        for i = 1, 20 do
            notificationLabel.Position = notificationLabel.Position - UDim2.new(0, 0, 0, 4)
            notificationLabel.BackgroundTransparency = i / 20
            notificationLabel.TextTransparency = i / 20
            wait(2)
        end
        warningScreenGui:Destroy()
    end


    animateNotification()
end


local message = "SCRIPT IS NOT SUPPORTED IN THIS GAME"

createWarningNotification(message)
