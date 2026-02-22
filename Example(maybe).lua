local ClaudeUI = loadstring(https://raw.githubusercontent.com/ytfireua-boop/ClaudeUI/refs/heads/main/ClaudeUI.lua)()

local Win = ClaudeUI:CreateWindow({ Title = "MyHub", Subtitle = "v1.0", Theme = "Ocean" })
local Tab = Win:AddTab("Main", "⚡")

Tab:AddToggle("Fly", false, function(v) -- toggle logic end)
Tab:AddSlider("Speed", {Min=0, Max=500, Default=16}, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

ClaudeUI:Notify({ Title = "Loaded!", Type = "Success", Duration = 4 })
