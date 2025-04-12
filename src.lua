local ui = {}
local themeStyles = {
    DarkTheme = {
        SchemeColor = Color3.fromRGB(64, 64, 64),
        Background = Color3.fromRGB(0, 0, 0),
        Header = Color3.fromRGB(0, 0, 0),
        TextColor = Color3.fromRGB(255,255,255),
        ElementColor = Color3.fromRGB(20, 20, 20)
    },
    LightTheme = {
        SchemeColor = Color3.fromRGB(150, 150, 150),
        Background = Color3.fromRGB(255,255,255),
        Header = Color3.fromRGB(200, 200, 200),
        TextColor = Color3.fromRGB(0,0,0),
        ElementColor = Color3.fromRGB(224, 224, 224)
    },
    BloodTheme = {
        SchemeColor = Color3.fromRGB(227, 27, 27),
        Background = Color3.fromRGB(10, 10, 10),
        Header = Color3.fromRGB(5, 5, 5),
        TextColor = Color3.fromRGB(255,255,255),
        ElementColor = Color3.fromRGB(20, 20, 20)
    },
    GrapeTheme = {
        SchemeColor = Color3.fromRGB(166, 71, 214),
        Background = Color3.fromRGB(64, 50, 71),
        Header = Color3.fromRGB(36, 28, 41),
        TextColor = Color3.fromRGB(255,255,255),
        ElementColor = Color3.fromRGB(74, 58, 84)
    },
    Ocean = {
        SchemeColor = Color3.fromRGB(86, 76, 251),
        Background = Color3.fromRGB(26, 32, 58),
        Header = Color3.fromRGB(38, 45, 71),
        TextColor = Color3.fromRGB(200, 200, 200),
        ElementColor = Color3.fromRGB(38, 45, 71)
    },
    Midnight = {
        SchemeColor = Color3.fromRGB(26, 189, 158),
        Background = Color3.fromRGB(44, 62, 82),
        Header = Color3.fromRGB(57, 81, 105),
        TextColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(52, 74, 95)
    },
    Sentinel = {
        SchemeColor = Color3.fromRGB(230, 35, 69),
        Background = Color3.fromRGB(32, 32, 32),
        Header = Color3.fromRGB(24, 24, 24),
        TextColor = Color3.fromRGB(119, 209, 138),
        ElementColor = Color3.fromRGB(24, 24, 24)
    },
    Synapse = {
        SchemeColor = Color3.fromRGB(46, 48, 43),
        Background = Color3.fromRGB(13, 15, 12),
        Header = Color3.fromRGB(36, 38, 35),
        TextColor = Color3.fromRGB(152, 99, 53),
        ElementColor = Color3.fromRGB(24, 24, 24)
    },
    Serpent = {
        SchemeColor = Color3.fromRGB(0, 166, 58),
        Background = Color3.fromRGB(31, 41, 43),
        Header = Color3.fromRGB(22, 29, 31),
        TextColor = Color3.fromRGB(255,255,255),
        ElementColor = Color3.fromRGB(22, 29, 31)
    }
}

local componentStyles = {
    button = Color3.fromRGB(45, 45, 45),
    buttonHover = Color3.fromRGB(60, 60, 60),

    sliderTrack = Color3.fromRGB(50, 50, 50),
    sliderFill = Color3.fromRGB(100, 100, 255),
    sliderKnob = Color3.fromRGB(150, 150, 255),

    checkboxBackground = Color3.fromRGB(45, 45, 45),
    checkboxCheck = Color3.fromRGB(0, 200, 0),

    toggleOn = Color3.fromRGB(0, 200, 100),
    toggleOff = Color3.fromRGB(60, 60, 60)
}
function ui.Message(title, message, duration)
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local messageFrame = Instance.new("Frame")
    messageFrame.Size = UDim2.new(0, 300, 0, 100)
    messageFrame.Position = UDim2.new(0.5, -150, 0.5, -50)
    messageFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    messageFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    messageFrame.BorderSizePixel = 0
    messageFrame.BackgroundTransparency = 1 -- Start fully transparent
    messageFrame.Parent = playerGui

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 10)
    uiCorner.Parent = messageFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0.3, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 18
    titleLabel.Parent = messageFrame

    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, -20, 0.6, 0)
    messageLabel.Position = UDim2.new(0, 10, 0.4, 0)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    messageLabel.Font = Enum.Font.SourceSans
    messageLabel.TextSize = 16
    messageLabel.TextWrapped = true
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    messageLabel.Parent = messageFrame

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 20, 0, 20)
    closeButton.Position = UDim2.new(1, -25, 0, 5)
    closeButton.AnchorPoint = Vector2.new(0.5, 0.5)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.TextSize = 14
    closeButton.Parent = messageFrame

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 5)
    closeCorner.Parent = closeButton

    closeButton.MouseButton1Click:Connect(function()
        messageFrame:TweenSizeAndPosition(
            UDim2.new(0, 0, 0, 0),
            UDim2.new(0.5, 0, 0.5, 0),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.3,
            true,
            function()
                if messageFrame and messageFrame.Parent then
                    messageFrame:Destroy()
                end
                end
        )
    end)

    -- Fade-in animation
    messageFrame:TweenSizeAndPosition(
        UDim2.new(0, 300, 0, 100),
        UDim2.new(0.5, -150, 0.5, -50),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        0.3,
        true
    )
    game:GetService("TweenService"):Create(
        messageFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0}
    ):Play()

    if duration then
        task.delay(duration, function()
            if messageFrame and messageFrame.Parent then
                closeButton:MouseButton1Click()
            end
        end)
    end
end
function ui.CreateFrame(Title, Theme)
    local Theme = themeStyles[Theme]
    if not Theme then
        ui.Message("Warning", "Theme not found: " .. tostring(Theme), nil, 3)
        return
    end

    -- Basic UI
    gui.MainFrame.BackgroundColor3 = Theme.Background
    gui.Header.BackgroundColor3 = Theme.Header
    gui.TextLabel.TextColor3 = Theme.TextColor
    gui.Button.BackgroundColor3 = componentStyles.button
    gui.Slider.BackgroundColor3 = componentStyles.sliderTrack
    gui.Checkbox.BackgroundColor3 = componentStyles.checkboxBackground
    gui.Toggle.BackgroundColor3 = componentStyles.toggleOff

    -- Apply text & color details
    gui.Button.TextColor3 = Theme.TextColor
    gui.Slider.SliderFill.BackgroundColor3 = componentStyles.sliderFill
    gui.Slider.Knob.BackgroundColor3 = componentStyles.sliderKnob
    gui.Checkbox.CheckMark.BackgroundColor3 = componentStyles.checkboxCheck
    gui.Toggle.ToggleIndicator.BackgroundColor3 = Theme.ToggleOn

    -- Gui to Lua
    -- Version: 3.2

    -- Instances:

    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TabFrame = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local TopFrame = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local X_btn = Instance.new("TextButton")
    local UICorner_4 = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local ContentFrame = Instance.new("Frame")
    local UICorner_5 = Instance.new("UICorner")
    local TabLayout = Instance.new("UIListLayout")
    TabLayout.Parent = TabFrame
    TabLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Parent = ContentFrame
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    -- Properties:

    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Theme.Background
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.134984031, 0, 0.22479564, 0)
    Frame.Size = UDim2.new(0, 500, 0, 300)
    Frame.Active = true
    Frame.Draggable = true

    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = Frame

    TabFrame.Name = "TabFrame"
    TabFrame.Parent = Frame
    TabFrame.BackgroundColor3 = Theme.ElementColor
    TabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabFrame.BorderSizePixel = 0
    TabFrame.Size = UDim2.new(0, 100, 1, 0)
    TabFrame.Position = UDim2.new(0, 0, 0, 0)

    UICorner_2.CornerRadius = UDim.new(0, 10)
    UICorner_2.Parent = TabFrame

    TopFrame.Name = "TopFrame"
    TopFrame.Parent = Frame
    TopFrame.BackgroundColor3 = Theme.Header
    TopFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TopFrame.BorderSizePixel = 0
    TopFrame.Size = UDim2.new(1, 0, 0, 50)

    UICorner_3.CornerRadius = UDim.new(0, 10)
    UICorner_3.Parent = TopFrame

    X_btn.Name = "X_btn"
    X_btn.Parent = TopFrame
    X_btn.BackgroundColor3 = Theme.SchemeColor
    X_btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    X_btn.BorderSizePixel = 0
    X_btn.Position = UDim2.new(0.92, 0, 0, 0)
    X_btn.Size = UDim2.new(0, 40, 0, 40)
    X_btn.Font = Enum.Font.Cartoon
    X_btn.Text = "X"
    X_btn.TextColor3 = Theme.TextColor
    X_btn.TextScaled = true
    X_btn.TextSize = 14.000
    X_btn.TextWrapped = true

    UICorner_4.CornerRadius = UDim.new(0, 10)
    UICorner_4.Parent = X_btn

    Title.Name = "Title"
    Title.Parent = TopFrame
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.Position = UDim2.new(0.05, 0, 0.25, 0)
    Title.Size = UDim2.new(0, 200, 0, 25)
    Title.Font = Enum.Font.SourceSansBold
    Title.Text = "Title"
    Title.TextColor3 = Theme.TextColor
    Title.TextScaled = true
    Title.TextSize = 18.000
    Title.TextWrapped = true

    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = Frame
    ContentFrame.BackgroundColor3 = Theme.ElementColor
    ContentFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ContentFrame.BorderSizePixel = 0
    ContentFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
    ContentFrame.Size = UDim2.new(0.75, 0, 0.7, 0)

    UICorner_5.CornerRadius = UDim.new(0, 10)
    UICorner_5.Parent = ContentFrame
Title.TextSize = 14.000
Title.TextWrapped = true

    functon ui.CreateTabButton(Title, Text, Icon)

        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(0, 100, 0, 50)
        TabButton.BackgroundColor3 = Theme.ElementColor
        TabButton.Text = Title
        TabButton.TextColor3 = Theme.TextColor
        TabButton.Font = Enum.Font.SourceSansBold
        TabButton.TextSize = 14
        TabButton.Parent = TabFrame

        local iconImage = Instance.new("ImageLabel")
        iconImage.Size = UDim2.new(0, 20, 0, 20)
        iconImage.Position = UDim2.new(0.5, -10, 0.5, -10)
        iconImage.Image = Icon
        iconImage.Parent = TabButton

        function ui.CreateButton(Text, Callback)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(0, 100, 0, 30)
            Button.BackgroundColor3 = componentStyles.button
            Button.Text = Text
            Button.TextColor3 = Theme.TextColor
            Button.Font = Enum.Font.SourceSansBold
            Button.TextSize = 14
            Button.Parent = ContentFrame

            Button.MouseEnter:Connect(function()
            Button.BackgroundColor3 = componentStyles.buttonHover
            Button:TweenSize(
                UDim2.new(0, 110, 0, 35),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.2,
                true
            )
            end)

            Button.MouseLeave:Connect(function()
            Button.BackgroundColor3 = componentStyles.button
            Button:TweenSize(
                UDim2.new(0, 100, 0, 30),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.2,
                true
            )
            end)

            Button.MouseButton1Click:Connect(function()
            if Callback then
                Callback()
            end
            Button:TweenSize(
                UDim2.new(0, 95, 0, 25),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.1,
                true,
                function()
                    Button:TweenSize(
                        UDim2.new(0, 100, 0, 30),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quad,
                        0.1,
                        true
                    )
                end
            )
            end)

            return Button
        end

        function ui.CreateSlider(Min, Max, Default, Callback)
            local SliderFrame = Instance.new("Frame")
            SliderFrame.Size = UDim2.new(0, 200, 0, 30)
            SliderFrame.BackgroundColor3 = componentStyles.sliderTrack
            SliderFrame.Parent = ContentFrame

            local SliderFill = Instance.new("Frame")
            SliderFill.Size = UDim2.new((Default - Min) / (Max - Min), 0, 1, 0)
            SliderFill.BackgroundColor3 = componentStyles.sliderFill
            SliderFill.Parent = SliderFrame

            local SliderKnob = Instance.new("Frame")
            SliderKnob.Size = UDim2.new(0, 10, 1, 0)
            SliderKnob.Position = UDim2.new((Default - Min) / (Max - Min), -5, 0, 0)
            SliderKnob.BackgroundColor3 = componentStyles.sliderKnob
            SliderKnob.Parent = SliderFrame

            local function UpdateSlider(input)
            local position = math.clamp(input.Position.X - SliderFrame.AbsolutePosition.X, 0, SliderFrame.AbsoluteSize.X)
            local value = Min + (position / SliderFrame.AbsoluteSize.X) * (Max - Min)
            SliderFill:TweenSize(
                UDim2.new(position / SliderFrame.AbsoluteSize.X, 0, 1, 0),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.1,
                true
            )
            SliderKnob:TweenPosition(
                UDim2.new(position / SliderFrame.AbsoluteSize.X, -5, 0, 0),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.1,
                true
            )
            if Callback then
                Callback(value)
            end
            end

            SliderKnob.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local connection
                connection = game:GetService("UserInputService").InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    UpdateSlider(input)
                end
                end)
                input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    connection:Disconnect()
                end
                end)
            end
            end)

            return SliderFrame
        end
        return TabButton
    end
end
