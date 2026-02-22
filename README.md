# ClaudeUI

A beautiful, lightweight UI library for Roblox. Clean API, smooth animations, zero setup.

---

## Installation

Load the library directly in your LocalScript:

```lua
local ClaudeUI = loadstring(game:HttpGet("YOUR_RAW_URL_HERE"))()
```

> Requires `HttpService` to be enabled in your game settings.

---

## Quick Start

```lua
local ClaudeUI = loadstring(game:HttpGet("..."))()

local Window = ClaudeUI:CreateWindow({
    Title    = "My Script",
    Subtitle = "by Me",
    Theme    = "Dark",
})

local Tab = Window:AddTab("Main", "⚡")

Tab:AddButton("Say Hello", function()
    print("Hello!")
end)

Tab:AddToggle("God Mode", false, function(enabled)
    -- your logic here
end)
```

---

## Themes

| Name | Description |
|------|-------------|
| `Dark` | Deep navy with purple accents *(default)* |
| `Light` | Clean white with soft violet |
| `Ocean` | Dark blue with cyan highlights |
| `Sunset` | Deep purple with pink accents |

```lua
ClaudeUI:SetTheme("Ocean")  -- set globally
-- or per window:
ClaudeUI:CreateWindow({ Theme = "Sunset" })
```

---

## Window

```lua
local Window = ClaudeUI:CreateWindow({
    Title    = "My Script",   -- window title
    Subtitle = "v1.0",        -- shown below title
    Theme    = "Dark",        -- optional, defaults to "Dark"
})

Window:SetTitle("New Title")
Window:Minimize()             -- toggle minimize
Window:Destroy()
```

---

## Elements

### Button

```lua
local btn = Tab:AddButton("Click Me", function()
    print("clicked!")
end)

btn:SetText("New Label")
btn:SetVisible(false)
btn:Destroy()
```

### Toggle

```lua
local toggle = Tab:AddToggle("Fly", false, function(value)
    print("Fly:", value)
end)

toggle:SetValue(true)
toggle:GetValue()  -- returns bool
```

### Slider

```lua
local slider = Tab:AddSlider("Walk Speed", {
    Min     = 0,
    Max     = 100,
    Default = 16,
    Decimals = 0,   -- optional
}, function(value)
    humanoid.WalkSpeed = value
end)

slider:SetValue(50)
slider:GetValue()  -- returns number
```

### Dropdown

```lua
local dropdown = Tab:AddDropdown("Team", {"Red", "Blue", "Green"}, function(option)
    print("Selected:", option)
end)

dropdown:SetOptions({"A", "B", "C"})
dropdown:SetValue("B")
dropdown:GetValue()  -- returns string
```

### Input

```lua
local input = Tab:AddInput("Username", "Enter name...", function(text, pressedEnter)
    print("Input:", text)
end)

input:SetValue("Roblox")
input:GetValue()  -- returns string
```

### Color Picker

```lua
local picker = Tab:AddColorPicker("Beam Color", Color3.fromRGB(255, 0, 0), function(color)
    part.Color = color
end)

picker:SetValue(Color3.fromRGB(0, 255, 128))
picker:GetValue()  -- returns Color3
```

### Keybind

```lua
local keybind = Tab:AddKeybind("Sprint", Enum.KeyCode.LeftShift, function()
    print("Sprinting!")
end)

keybind:SetKey(Enum.KeyCode.E)
keybind:GetKey()  -- returns Enum.KeyCode
```

### Label

```lua
local label = Tab:AddLabel("Some information text.")

label:SetText("Updated text")
label:SetColor(Color3.fromRGB(255, 80, 80))
```

### Layout Helpers

```lua
Tab:AddSection("Combat")     -- bold uppercase section header
Tab:AddDivider()             -- horizontal rule
Tab:AddDivider("Settings")   -- horizontal rule with centered label
```

---

## Notifications

```lua
ClaudeUI:Notify({
    Title    = "Success",
    Message  = "Operation completed.",
    Type     = "Success",   -- "Success" | "Error" | "Warning" | "Info"
    Duration = 3,           -- seconds
})
```

---

## All Elements share these common methods

| Method | Description |
|--------|-------------|
| `:SetVisible(bool)` | Show or hide the element |
| `:Destroy()` | Remove the element entirely |

---

## Contributing

Contributions are welcome. Please open an issue before submitting a pull request for large changes.

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m "add my feature"`
4. Push and open a Pull Request

---

## License

MIT — free to use, modify, and distribute.
