--[[
    ╔═══════════════════════════════════════════╗
    ║              ClaudeUI v1.0                ║
    ║    A Beautiful & Easy-to-Use UI Library   ║
    ║         for Roblox by 5hadowL3af          ║
    ╚═══════════════════════════════════════════╝

    QUICK START:
    ────────────
    local ClaudeUI = loadstring(game:HttpGet("..."))()

    local Window = ClaudeUI:CreateWindow({
        Title = "My Script",
        Subtitle = "by Me",
        Theme = "Dark",      -- "Dark", "Light", "Ocean", "Sunset"
    })

    local Tab = Window:AddTab("Main", "rbxassetid://...")

    Tab:AddButton("Click Me!", function()
        print("Clicked!")
    end)

    Tab:AddToggle("God Mode", false, function(value)
        print("Toggled:", value)
    end)

    Tab:AddSlider("Speed", { Min=0, Max=100, Default=16 }, function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end)

    Tab:AddDropdown("Team", {"Red","Blue","Green"}, function(option)
        print("Selected:", option)
    end)

    Tab:AddInput("Username", "Enter name...", function(text)
        print("Input:", text)
    end)

    Tab:AddLabel("Hello, World!")
    Tab:AddDivider()

    Tab:AddColorPicker("Color", Color3.fromRGB(255,0,0), function(color)
        print("Color:", color)
    end)

    Tab:AddKeybind("Sprint Key", Enum.KeyCode.LeftShift, function()
        print("Sprinting!")
    end)

    THEMES:
    ───────
    ClaudeUI:SetTheme("Ocean")
    ClaudeUI:GetTheme() => returns current theme name

    NOTIFICATIONS:
    ──────────────
    ClaudeUI:Notify({
        Title = "Success",
        Message = "Operation completed!",
        Type = "Success",   -- "Success", "Error", "Warning", "Info"
        Duration = 3,
    })

    WINDOW METHODS:
    ───────────────
    Window:SetTitle("New Title")
    Window:Minimize()
    Window:Destroy()
    Window:AddTab(name, icon)

    TAB ELEMENT METHODS:
    ────────────────────
    local btn = Tab:AddButton(...)
    btn:SetText("New Text")
    btn:SetVisible(false)
    btn:Destroy()

    local toggle = Tab:AddToggle(...)
    toggle:SetValue(true)

    local slider = Tab:AddSlider(...)
    slider:SetValue(50)

    local dropdown = Tab:AddDropdown(...)
    dropdown:SetOptions({"A","B","C"})
    dropdown:SetValue("A")

    local input = Tab:AddInput(...)
    input:SetValue("text")
    input:GetValue() => string

]]

-- ══════════════════════════════════════════════════════════════════
-- SERVICES & VARIABLES
-- ══════════════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- ══════════════════════════════════════════════════════════════════
-- THEMES
-- ══════════════════════════════════════════════════════════════════

local Themes = {
    Dark = {
        Background      = Color3.fromRGB(15, 15, 20),
        Surface         = Color3.fromRGB(22, 22, 30),
        SurfaceLight    = Color3.fromRGB(30, 30, 42),
        SurfaceLighter  = Color3.fromRGB(40, 40, 56),
        Accent          = Color3.fromRGB(120, 100, 255),
        AccentLight     = Color3.fromRGB(150, 130, 255),
        AccentDark      = Color3.fromRGB(90, 70, 200),
        Text            = Color3.fromRGB(240, 240, 255),
        TextMuted       = Color3.fromRGB(140, 140, 170),
        TextDim         = Color3.fromRGB(80, 80, 110),
        Success         = Color3.fromRGB(80, 220, 140),
        Error           = Color3.fromRGB(255, 80, 80),
        Warning         = Color3.fromRGB(255, 180, 60),
        Info            = Color3.fromRGB(80, 180, 255),
        Border          = Color3.fromRGB(45, 45, 65),
        Shadow          = Color3.fromRGB(0, 0, 0),
    },
    Light = {
        Background      = Color3.fromRGB(245, 245, 255),
        Surface         = Color3.fromRGB(255, 255, 255),
        SurfaceLight    = Color3.fromRGB(235, 235, 248),
        SurfaceLighter  = Color3.fromRGB(220, 220, 240),
        Accent          = Color3.fromRGB(100, 80, 220),
        AccentLight     = Color3.fromRGB(130, 110, 245),
        AccentDark      = Color3.fromRGB(75, 55, 185),
        Text            = Color3.fromRGB(20, 20, 40),
        TextMuted       = Color3.fromRGB(90, 90, 130),
        TextDim         = Color3.fromRGB(160, 160, 190),
        Success         = Color3.fromRGB(40, 180, 100),
        Error           = Color3.fromRGB(220, 50, 50),
        Warning         = Color3.fromRGB(220, 140, 20),
        Info            = Color3.fromRGB(40, 140, 220),
        Border          = Color3.fromRGB(210, 210, 230),
        Shadow          = Color3.fromRGB(180, 180, 210),
    },
    Ocean = {
        Background      = Color3.fromRGB(8, 18, 35),
        Surface         = Color3.fromRGB(12, 28, 52),
        SurfaceLight    = Color3.fromRGB(18, 40, 70),
        SurfaceLighter  = Color3.fromRGB(25, 55, 90),
        Accent          = Color3.fromRGB(0, 200, 220),
        AccentLight     = Color3.fromRGB(40, 225, 240),
        AccentDark      = Color3.fromRGB(0, 160, 180),
        Text            = Color3.fromRGB(220, 240, 255),
        TextMuted       = Color3.fromRGB(120, 160, 200),
        TextDim         = Color3.fromRGB(60, 100, 140),
        Success         = Color3.fromRGB(50, 220, 150),
        Error           = Color3.fromRGB(255, 80, 100),
        Warning         = Color3.fromRGB(255, 190, 60),
        Info            = Color3.fromRGB(60, 180, 255),
        Border          = Color3.fromRGB(25, 60, 100),
        Shadow          = Color3.fromRGB(0, 5, 15),
    },
    Sunset = {
        Background      = Color3.fromRGB(20, 10, 25),
        Surface         = Color3.fromRGB(30, 15, 38),
        SurfaceLight    = Color3.fromRGB(42, 22, 52),
        SurfaceLighter  = Color3.fromRGB(56, 30, 68),
        Accent          = Color3.fromRGB(255, 100, 150),
        AccentLight     = Color3.fromRGB(255, 130, 175),
        AccentDark      = Color3.fromRGB(210, 70, 115),
        Text            = Color3.fromRGB(255, 240, 245),
        TextMuted       = Color3.fromRGB(180, 140, 165),
        TextDim         = Color3.fromRGB(110, 70, 100),
        Success         = Color3.fromRGB(100, 220, 150),
        Error           = Color3.fromRGB(255, 80, 80),
        Warning         = Color3.fromRGB(255, 200, 80),
        Info            = Color3.fromRGB(150, 150, 255),
        Border          = Color3.fromRGB(65, 35, 80),
        Shadow          = Color3.fromRGB(5, 0, 8),
    },
}

-- ══════════════════════════════════════════════════════════════════
-- UTILITY FUNCTIONS
-- ══════════════════════════════════════════════════════════════════

local function Tween(obj, props, t, style, dir)
    t = t or 0.2
    style = style or Enum.EasingStyle.Quart
    dir = dir or Enum.EasingDirection.Out
    local i
