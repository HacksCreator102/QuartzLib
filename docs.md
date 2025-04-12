# QuartzLib Library

Modded by usr_55526272_
## Features
- Pre-built customizable UI components
- Lightweight and optimized for performance
- Easy integration with existing projects
- Fully documented and beginner-friendly

Get started today and elevate your Roblox game with QuartzLib!

# Load UI
```lua
local QuartzLib = loadstring(game:Httpget(""))()
```
# Create UI
```lua

local myWindow = QuartzLib:CreateWindow({
    Name = "My Cool UI",
    Theme = {
        Background = Color3.fromRGB(25, 25, 25),
        TabBackground = Color3.fromRGB(35, 35, 35),
        ContentBackground = Color3.fromRGB(45, 45, 45),
        TabButton = Color3.fromRGB(60, 60, 60),
        TextColor = Color3.fromRGB(255, 255, 255),
        SectionBackground = Color3.fromRGB(55, 55, 55),
        Button = Color3.fromRGB(90, 90, 90),
        SliderBar = Color3.fromRGB(100, 100, 100),
        SliderKnob = Color3.fromRGB(150, 150, 150),
    }
})
```

# Create Tab
```lua
local mainTab = myWindow:AddTab("Main")
```

## Create Section
```lua
local controlSection = mainTab:AddSection("Controls")
```

# Create Button
```lua
controlSection:AddButton("Click Me!", function()
    print("Button clicked!")
end)
```

# Create Slider
```lua
controlSection:AddSlider("Volume", 0, 100, 50, function(value)
    print("Slider value:", value)
end)
```
