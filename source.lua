local nexvo = {}

-- ~ Icons ~ --
local icons = {
  error = "https://raw.githubusercontent.com/coder97v/Codes/refs/heads/main/Icons/error.png",
  dialog = "https://raw.githubusercontent.com/coder97v/Codes/refs/heads/main/Icons/dialog.png",
  pause = "https://raw.githubusercontent.com/coder97v/Codes/refs/heads/main/Icons/pause.png",
  play = "https://raw.githubusercontent.com/coder97v/Codes/refs/heads/main/Icons/play.png"
}

local TweenService = game:GetService("TweenService")

-- Create a basic window
function nexvo.CreateWindow(Title, Desc, Icon)
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player.PlayerGui

    -- Create the window frame
    local window = Instance.new("Frame")
    window.Size = UDim2.new(0, 400, 0, 300)
    window.Position = UDim2.new(0.5, -200, 0.5, -150)
    window.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    window.BorderSizePixel = 2
    window.BorderColor3 = Color3.fromRGB(255, 255, 255)
    window.Parent = screenGui
    window.BackgroundTransparency = 1

    -- Create title bar
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    titleBar.Parent = window

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = Title
    titleLabel.Size = UDim2.new(1, 0, 1, 0)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Parent = titleBar

    -- Create description label
    local descLabel = Instance.new("TextLabel")
    descLabel.Text = Desc
    descLabel.Size = UDim2.new(1, -20, 0, 50)
    descLabel.Position = UDim2.new(0, 10, 0, 40)
    descLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    descLabel.BackgroundTransparency = 1
    descLabel.Parent = window

    -- Create icon (ImageLabel)
    if Icon then
        local iconImage = Instance.new("ImageLabel")
        iconImage.Image = Icon
        iconImage.Size = UDim2.new(0, 40, 0, 40)
        iconImage.Position = UDim2.new(0, 10, 0, 10)
        iconImage.BackgroundTransparency = 1
        iconImage.Parent = window

        -- Animation for icon fade-in
        local iconTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local iconTween = TweenService:Create(iconImage, iconTweenInfo, {BackgroundTransparency = 0, ImageTransparency = 0})
        iconTween:Play()
    end

    -- Window animation
    local windowTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
    local windowTween = TweenService:Create(window, windowTweenInfo, {BackgroundTransparency = 0})
    windowTween:Play()
end

-- Create a tab inside the window
function nexvo.CreateTab(TabTitle, TabIcon)
    local player = game.Players.LocalPlayer
    local screenGui = player.PlayerGui:FindFirstChildOfClass("ScreenGui")

    -- Create the tab frame
    local tabFrame = Instance.new("Frame")
    tabFrame.Size = UDim2.new(0, 380, 0, 50)
    tabFrame.Position = UDim2.new(0.5, -190, 0.5, -125)
    tabFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabFrame.Parent = screenGui
    tabFrame.BackgroundTransparency = 1

    -- Tab title
    local tabLabel = Instance.new("TextLabel")
    tabLabel.Text = TabTitle
    tabLabel.Size = UDim2.new(1, 0, 1, 0)
    tabLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabLabel.BackgroundTransparency = 1
    tabLabel.Parent = tabFrame

    -- Optional tab icon from icons table
    if TabIcon then
        local image = Instance.new("ImageLabel")
        image.Image = TabIcon
        image.Size = UDim2.new(0, 24, 0, 24)
        image.Position = UDim2.new(0, 5, 0.5, -12)
        image.BackgroundTransparency = 1
        image.Parent = tabFrame

        -- Animation for tab icon fade-in
        local imageTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local imageTween = TweenService:Create(image, imageTweenInfo, {ImageTransparency = 0})
        imageTween:Play()
    end

    -- Tab animation
    local tabTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
    local tabTween = TweenService:Create(tabFrame, tabTweenInfo, {BackgroundTransparency = 0})
    tabTween:Play()
end

-- Create a button with animation
function nexvo.CreateBtn(ButtonTitle, ButtonDesc, ButtonFunction)
    local player = game.Players.LocalPlayer
    local screenGui = player.PlayerGui:FindFirstChildOfClass("ScreenGui")

    -- Create button
    local button = Instance.new("TextButton")
    button.Text = ButtonTitle
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0.5, -50)
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = screenGui
    button.BackgroundTransparency = 1

    -- Button fade-in animation
    local buttonTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local buttonTween = TweenService:Create(button, buttonTweenInfo, {BackgroundTransparency = 0})
    buttonTween:Play()

    -- Button click effect
    button.MouseButton1Click:Connect(function()
        -- Button animation (scale up effect)
        local clickTweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local clickTween = TweenService:Create(button, clickTweenInfo, {Size = UDim2.new(0, 210, 0, 55)})
        clickTween:Play()

        wait(0.1)

        local resetTween = TweenService:Create(button, clickTweenInfo, {Size = UDim2.new(0, 200, 0, 50)})
        resetTween:Play()

        -- Call the provided function
        ButtonFunction()
    end)
end

-- Create a slider with animation
function nexvo.CreateSlider(SliderTitle, Min, Max, SliderFunction)
    local player = game.Players.LocalPlayer
    local screenGui = player.PlayerGui:FindFirstChildOfClass("ScreenGui")

    -- Create slider frame
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(0, 200, 0, 20)
    sliderFrame.Position = UDim2.new(0.5, -100, 0.5, 50)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    sliderFrame.Parent = screenGui

    -- Create slider bar
    local sliderBar = Instance.new("Frame")
    sliderBar.Size = UDim2.new(1, 0, 0, 4)
    sliderBar.Position = UDim2.new(0, 0, 0.5, -2)
    sliderBar.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    sliderBar.Parent = sliderFrame

    -- Create slider knob
    local sliderKnob = Instance.new("Frame")
    sliderKnob.Size = UDim2.new(0, 10, 1, 0)
    sliderKnob.Position = UDim2.new(0, 0, 0, 0)
    sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    sliderKnob.Parent = sliderBar

    -- Animation for slider fade-in
    local sliderTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local sliderTween = TweenService:Create(sliderFrame, sliderTweenInfo, {BackgroundTransparency = 0})
    sliderTween:Play()

    -- Create slider functionality
    local dragging = false
    local function updateSlider(input)
        local newPosition = math.clamp(input.Position.X - sliderFrame.AbsolutePosition.X, 0, sliderFrame.AbsoluteSize.X)
        sliderKnob.Position = UDim2.new(0, newPosition, 0, 0)
        local sliderValue = Min + (newPosition / sliderFrame.AbsoluteSize.X) * (Max - Min)
        SliderFunction(sliderValue)
    end

    sliderKnob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    sliderKnob.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging then
            updateSlider(input)
        end
    end)
end