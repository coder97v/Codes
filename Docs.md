# Ui Lib: NexVo
## load library
```lua
local nexvo = loadstring(game:Httpget("https://raw.githubusercontent.com/coder97v/Codes/refs/heads/main/source.lua"))()
```
## Create Window
```lua
nexvo.CreateWindow("Title", "Description", icons.play)
```
## Create Tab
```lua
nexvo.CreateTab("Tab button", icons.dialog)
```

## Create Button
```lua
nexvo.CreateBtn("ButtonTitle", "info", function()
    print("Button clicked!")
end)
```

## Create Slider
```lua 
nexvo.CreateSlider("Slider", 0, 100, function(value)
    print("Slider value: " .. value)
end)
```

here are the list for the icons

<p>dialog</p>
![dialog](https://raw.githubusercontent.com/your-username/your-repo-name/branch-name/path-to-image/image-name.png)