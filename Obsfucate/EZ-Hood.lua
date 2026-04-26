local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

LocalPlayer:GetMouse()

local t1 = {
	Enabled = true,
	RandomizedDelays = true,
	LastActionTime = 0,
	ActionVariance = 0.15
}

local function u7(p1)
	-- upvalues: t1 (ref)
	if not t1.RandomizedDelays then
		return p1
	end

	return p1 + (math.random() * t1.ActionVariance * 2 - t1.ActionVariance)
end
local function u8()
	-- upvalues: t1 (ref), u7 (ref)
	local timestamp = tick()

	if not (timestamp - t1.LastActionTime < u7(0.05)) then
		t1.LastActionTime = timestamp

		return true
	end

	return false
end

local v9, v10 = (function()
	if not identifyexecutor then
		return "Unknown", false
	end

	local v175 = identifyexecutor():lower()

	for _, v in ipairs({
		"Volcano",
		"Velocity",
		"Swift",
		"Zenith",
		"Wave",
		"Bunni",
		"Hydrogen",
		"Delta",
		"KRNL",
		"Seliware",
		"Potassium",
		"MacSploit"
	}) do
		if v175:find(v:lower()) then
			return v, true
		end
	end

	return identifyexecutor(), false
end)()
local v11 = v10 and "Executor Supported ✓" or "Executor Not Supported ✗"

if not v10 and LocalPlayer then
	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.Name = "ExecutorNotification"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = game.CoreGui

	local Frame = Instance.new("Frame")

	Frame.Size = UDim2.new(0, 320, 0, 140)
	Frame.Position = UDim2.new(0.5, -160, 0.1, 0)
	Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Frame.BackgroundTransparency = 1
	Frame.BorderSizePixel = 0
	Frame.Parent = ScreenGui
	Frame.ClipsDescendants = true
	Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)

	local TextLabel = Instance.new("TextLabel", Frame)

	TextLabel.Text = "Executor Not Supported"
	TextLabel.Font = Enum.Font.GothamBold
	TextLabel.TextColor3 = Color3.fromRGB(255, 85, 85)
	TextLabel.TextSize = 20
	TextLabel.BackgroundTransparency = 1
	TextLabel.Position = UDim2.new(0, 0, 0, 10)
	TextLabel.Size = UDim2.new(1, 0, 0, 30)

	local TextLabel2 = Instance.new("TextLabel", Frame)

	TextLabel2.Text = "This executor may not support all functions."
	TextLabel2.Font = Enum.Font.Gotham
	TextLabel2.TextColor3 = Color3.fromRGB(230, 230, 230)
	TextLabel2.TextSize = 16
	TextLabel2.BackgroundTransparency = 1
	TextLabel2.Position = UDim2.new(0, 0, 0, 40)
	TextLabel2.Size = UDim2.new(1, 0, 0, 25)

	local TextLabel3 = Instance.new("TextLabel", Frame)

	TextLabel3.Text = "Recommended Paid: Zenith, Wave"
	TextLabel3.Font = Enum.Font.Gotham
	TextLabel3.TextColor3 = Color3.fromRGB(170, 170, 255)
	TextLabel3.TextSize = 15
	TextLabel3.BackgroundTransparency = 1
	TextLabel3.Position = UDim2.new(0, 0, 0, 70)
	TextLabel3.Size = UDim2.new(1, 0, 0, 20)

	local TextLabel4 = Instance.new("TextLabel", Frame)

	TextLabel4.Text = "Recommended Free (Key): Volcano, Velocity, Bunni"
	TextLabel4.Font = Enum.Font.Gotham
	TextLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel4.TextSize = 15
	TextLabel4.BackgroundTransparency = 1
	TextLabel4.Position = UDim2.new(0, 0, 0, 95)
	TextLabel4.Size = UDim2.new(1, 0, 0, 20)
	TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		BackgroundTransparency = 0.05
	}):Play()
	task.wait(5)

	local v18 = TweenService:Create(Frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		BackgroundTransparency = 1
	})

	v18:Play()
	v18.Completed:Connect(function()
		-- upvalues: ScreenGui (ref)
		ScreenGui:Destroy()
	end)
end

local u19 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/LinoriaLib/main/Library.lua"))()
local v20 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/LinoriaLib/main/addons/ThemeManager.lua"))()
local v21 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/LinoriaLib/main/addons/SaveManager.lua"))()
local v22 = u19:CreateWindow({
	Title = string.format("EZ-Hood | Author: s0ulz  |  %s", v11),
	AutoShow = true,
	Size = UDim2.fromOffset(600, 750)
})

u19:Notify(string.format("Executor: %s\n%s", v9, v11), 5)

local t2 = {
	Combat = v22:AddTab("Combat"),
	Visual = v22:AddTab("Visual"),
	Movement = v22:AddTab("Movement"),
	Teleport = v22:AddTab("Teleport"),
	Troll = v22:AddTab("Troll"),
	Misc = v22:AddTab("Misc"),
	Settings = v22:AddTab("Settings")
}

_G.SilentAimEnabled = false
_G.SilentAimActive = false
_G.AimSmoothness = 0.3
_G.TargetPart = "HumanoidRootPart"
_G.ToggleKey = "MouseButton2"
_G.FOVEnabled = true
_G.FOVRadius = 100
_G.FOVColor = Color3.fromRGB(255, 255, 255)
_G.ESPEnabled = false
_G.ESPColor = Color3.fromRGB(0, 255, 0)
_G.TracersEnabled = false
_G.TracerColor = Color3.fromRGB(255, 0, 0)
_G.TracerThickness = 1
_G.NameESPEnabled = false
_G.NameESPColor = Color3.fromRGB(255, 255, 255)
_G.DistanceESPEnabled = false
_G.DistanceESPColor = Color3.fromRGB(255, 255, 0)
_G.HealthESPEnabled = false
_G.HealthBarColor = Color3.fromRGB(0, 255, 0)
_G.SkeletonESPEnabled = false
_G.SkeletonColor = Color3.fromRGB(255, 255, 255)
_G.HeadESPEnabled = false
_G.HeadESPColor = Color3.fromRGB(255, 0, 255)
_G.ChamsEnabled = false
_G.ChamsColor = Color3.fromRGB(255, 0, 0)
_G.CashESPEnabled = false
_G.CashESPColor = Color3.fromRGB(0, 255, 0)
_G.AntiAFK = true
_G.FPSUnlocker = true
_G.FPSCap = 240
_G.TriggerbotEnabled = false
_G.TriggerbotDelay = 0.001
_G.TriggerbotWallCheck = true
_G.SpeedEnabled = false
_G.SpeedValue = 16
_G.JumpPowerEnabled = false
_G.JumpPowerValue = 50
_G.HitboxExpanded = false
_G.HitboxSize = 10
_G.HitboxTransparency = 0.5
_G.HitboxColor = Color3.fromRGB(255, 0, 0)
_G.TeleportTarget = ""
_G.InfiniteTeleport = false
_G.SafeTeleporting = false
_G.SelectedEmote = ""
_G.AutoSafeEnabled = false
_G.SafeHealthThreshold = 30
_G.PickUpVoidEnabled = false
_G.PickUpVoidToggleKey = "V"
_G.SavedPosition = nil
_G.SpinBotEnabled = false
_G.SpinBotSpeed = 20
_G.FakeLagEnabled = false
_G.FakeLagIntensity = 0.5
_G.InvisibilityEnabled = false

local drawing = Drawing.new("Circle")

drawing.Thickness = 1
drawing.Filled = false
drawing.Visible = _G.FOVEnabled
drawing.Transparency = 1
drawing.Radius = _G.FOVRadius
drawing.Color = _G.FOVColor

local v25 = t2.Combat:AddLeftGroupbox("Silent Aim")

v25:AddToggle("SilentAimToggle", {
	Text = "Enable Silent Aim",
	Default = false,
	Tooltip = "Enables silent aim with anti-detection"
})
Toggles.SilentAimToggle:OnChanged(function()
	_G.SilentAimEnabled = Toggles.SilentAimToggle.Value
end)
v25:AddDropdown("TargetPartDropdown", {
	Values = {
		"HumanoidRootPart",
		"Head"
	},
	Default = 1,
	Multi = false,
	Text = "Target Part",
	Tooltip = "Select body part to aim at"
})
Options.TargetPartDropdown:OnChanged(function()
	_G.TargetPart = Options.TargetPartDropdown.Value
end)
v25:AddSlider("AimSmoothnessSlider", {
	Text = "Aim Smoothness",
	Default = _G.AimSmoothness,
	Min = 0.1,
	Max = 1,
	Rounding = 1,
	Compact = false,
	Tooltip = "Lower = Smoother, Higher = Faster lock"
})
Options.AimSmoothnessSlider:OnChanged(function()
	_G.AimSmoothness = Options.AimSmoothnessSlider.Value
end)
v25:AddLabel("Toggle Key"):AddKeyPicker("SilentAimKey", {
	Default = _G.ToggleKey,
	SyncToggleState = false,
	Mode = "Toggle",
	Text = "Silent Aim Toggle Key",
	NoUI = false
})

local v26 = t2.Combat:AddLeftGroupbox("FOV Settings")

v26:AddToggle("ShowFOVToggle", {
	Text = "Show FOV Circle",
	Default = _G.FOVEnabled,
	Tooltip = "Shows FOV circle"
})
Toggles.ShowFOVToggle:OnChanged(function()
	-- upvalues: drawing (ref)
	_G.FOVEnabled = Toggles.ShowFOVToggle.Value
	drawing.Visible = Toggles.ShowFOVToggle.Value
end)
v26:AddSlider("FOVRadiusSlider", {
	Text = "FOV Radius",
	Default = _G.FOVRadius,
	Min = 50,
	Max = 125,
	Rounding = 0,
	Compact = false
})
Options.FOVRadiusSlider:OnChanged(function()
	-- upvalues: drawing (ref)
	_G.FOVRadius = Options.FOVRadiusSlider.Value
	drawing.Radius = Options.FOVRadiusSlider.Value
end)
v26:AddLabel("FOV Color"):AddColorPicker("FOVColorPicker", {
	Default = _G.FOVColor,
	Title = "FOV Color"
})
Options.FOVColorPicker:OnChanged(function()
	-- upvalues: drawing (ref)
	_G.FOVColor = Options.FOVColorPicker.Value
	drawing.Color = Options.FOVColorPicker.Value
end)

local v27 = t2.Combat:AddRightGroupbox("Hitbox Expander")

v27:AddToggle("HitboxToggle", {
	Text = "Expand Hitboxes",
	Default = false,
	Tooltip = "Makes player hitboxes larger"
})
Toggles.HitboxToggle:OnChanged(function()
	_G.HitboxExpanded = Toggles.HitboxToggle.Value
end)
v27:AddSlider("HitboxSizeSlider", {
	Text = "Hitbox Size",
	Default = _G.HitboxSize,
	Min = 5,
	Max = 30,
	Rounding = 0,
	Compact = false
})
Options.HitboxSizeSlider:OnChanged(function()
	_G.HitboxSize = Options.HitboxSizeSlider.Value
end)
v27:AddSlider("HitboxTransparencySlider", {
	Text = "Hitbox Transparency",
	Default = _G.HitboxTransparency,
	Min = 0,
	Max = 1,
	Rounding = 2,
	Compact = false,
	Tooltip = "0 = Invisible, 1 = Fully Visible"
})
Options.HitboxTransparencySlider:OnChanged(function()
	_G.HitboxTransparency = Options.HitboxTransparencySlider.Value
end)
v27:AddLabel("Hitbox Color"):AddColorPicker("HitboxColorPicker", {
	Default = _G.HitboxColor,
	Title = "Hitbox Color"
})
Options.HitboxColorPicker:OnChanged(function()
	_G.HitboxColor = Options.HitboxColorPicker.Value
end)

local v28 = t2.Combat:AddRightGroupbox("Triggerbot")

v28:AddToggle("TriggerbotToggle", {
	Text = "Enable Triggerbot",
	Default = false,
	Tooltip = "Automatically shoots when cursor is on enemy"
})
Toggles.TriggerbotToggle:OnChanged(function()
	_G.TriggerbotEnabled = Toggles.TriggerbotToggle.Value
end)
v28:AddSlider("TriggerbotDelaySlider", {
	Text = "Triggerbot Delay (ms)",
	Default = _G.TriggerbotDelay * 1000,
	Min = 1,
	Max = 100,
	Rounding = 0,
	Compact = false,
	Tooltip = "Delay before shooting"
})
Options.TriggerbotDelaySlider:OnChanged(function()
	_G.TriggerbotDelay = Options.TriggerbotDelaySlider.Value / 1000
end)
v28:AddToggle("TriggerbotWallCheckToggle", {
	Text = "Wall Check",
	Default = true,
	Tooltip = "Only shoot if target is visible (no walls)"
})
Toggles.TriggerbotWallCheckToggle:OnChanged(function()
	_G.TriggerbotWallCheck = Toggles.TriggerbotWallCheckToggle.Value
end)

local v29 = t2.Visual:AddLeftGroupbox("Player ESP")

v29:AddToggle("BoxESPToggle", {
	Text = "Box ESP",
	Default = false,
	Tooltip = "Shows boxes around players"
})
Toggles.BoxESPToggle:OnChanged(function()
	_G.ESPEnabled = Toggles.BoxESPToggle.Value
end)
v29:AddLabel("Box Color"):AddColorPicker("ESPColorPicker", {
	Default = _G.ESPColor,
	Title = "Box ESP Color"
})
Options.ESPColorPicker:OnChanged(function()
	_G.ESPColor = Options.ESPColorPicker.Value
end)
v29:AddToggle("HeadESPToggle", {
	Text = "Head ESP",
	Default = false,
	Tooltip = "Shows circle around head"
})
Toggles.HeadESPToggle:OnChanged(function()
	_G.HeadESPEnabled = Toggles.HeadESPToggle.Value
end)
v29:AddLabel("Head Color"):AddColorPicker("HeadESPColorPicker", {
	Default = _G.HeadESPColor,
	Title = "Head ESP Color"
})
Options.HeadESPColorPicker:OnChanged(function()
	_G.HeadESPColor = Options.HeadESPColorPicker.Value
end)
v29:AddToggle("NameESPToggle", {
	Text = "Name ESP",
	Default = false,
	Tooltip = "Shows player names"
})
Toggles.NameESPToggle:OnChanged(function()
	_G.NameESPEnabled = Toggles.NameESPToggle.Value
end)
v29:AddLabel("Name Color"):AddColorPicker("NameESPColorPicker", {
	Default = _G.NameESPColor,
	Title = "Name ESP Color"
})
Options.NameESPColorPicker:OnChanged(function()
	_G.NameESPColor = Options.NameESPColorPicker.Value
end)
v29:AddToggle("DistanceESPToggle", {
	Text = "Distance ESP",
	Default = false,
	Tooltip = "Shows distance to players"
})
Toggles.DistanceESPToggle:OnChanged(function()
	_G.DistanceESPEnabled = Toggles.DistanceESPToggle.Value
end)
v29:AddLabel("Distance Color"):AddColorPicker("DistanceESPColorPicker", {
	Default = _G.DistanceESPColor,
	Title = "Distance ESP Color"
})
Options.DistanceESPColorPicker:OnChanged(function()
	_G.DistanceESPColor = Options.DistanceESPColorPicker.Value
end)
v29:AddToggle("HealthESPToggle", {
	Text = "Health Bar ESP",
	Default = false,
	Tooltip = "Shows health bar"
})
Toggles.HealthESPToggle:OnChanged(function()
	_G.HealthESPEnabled = Toggles.HealthESPToggle.Value
end)
v29:AddLabel("Health Color"):AddColorPicker("HealthBarColorPicker", {
	Default = _G.HealthBarColor,
	Title = "Health Bar Color"
})
Options.HealthBarColorPicker:OnChanged(function()
	_G.HealthBarColor = Options.HealthBarColorPicker.Value
end)
v29:AddToggle("SkeletonESPToggle", {
	Text = "Skeleton ESP",
	Default = false,
	Tooltip = "Shows skeleton"
})
Toggles.SkeletonESPToggle:OnChanged(function()
	_G.SkeletonESPEnabled = Toggles.SkeletonESPToggle.Value
end)
v29:AddLabel("Skeleton Color"):AddColorPicker("SkeletonColorPicker", {
	Default = _G.SkeletonColor,
	Title = "Skeleton Color"
})
Options.SkeletonColorPicker:OnChanged(function()
	_G.SkeletonColor = Options.SkeletonColorPicker.Value
end)
v29:AddToggle("ChamsToggle", {
	Text = "Chams / Highlight",
	Default = false,
	Tooltip = "Makes players glow"
})
Toggles.ChamsToggle:OnChanged(function()
	_G.ChamsEnabled = Toggles.ChamsToggle.Value
end)
v29:AddLabel("Chams Color"):AddColorPicker("ChamsColorPicker", {
	Default = _G.ChamsColor,
	Title = "Chams Color"
})
Options.ChamsColorPicker:OnChanged(function()
	_G.ChamsColor = Options.ChamsColorPicker.Value
end)

local v30 = t2.Visual:AddLeftGroupbox("Object ESP")

v30:AddToggle("CashESPToggle", {
	Text = "Cash ESP",
	Default = false,
	Tooltip = "Highlights cash objects"
})
Toggles.CashESPToggle:OnChanged(function()
	_G.CashESPEnabled = Toggles.CashESPToggle.Value
end)
v30:AddLabel("Cash Color"):AddColorPicker("CashESPColorPicker", {
	Default = _G.CashESPColor,
	Title = "Cash ESP Color"
})
Options.CashESPColorPicker:OnChanged(function()
	_G.CashESPColor = Options.CashESPColorPicker.Value
end)

local v31 = t2.Visual:AddRightGroupbox("Tracers")

v31:AddToggle("TracersToggle", {
	Text = "Enable Tracers",
	Default = false,
	Tooltip = "Shows lines to players"
})
Toggles.TracersToggle:OnChanged(function()
	_G.TracersEnabled = Toggles.TracersToggle.Value
end)
v31:AddLabel("Tracers Color"):AddColorPicker("TracerColorPicker", {
	Default = _G.TracerColor,
	Title = "Tracer Color"
})
Options.TracerColorPicker:OnChanged(function()
	_G.TracerColor = Options.TracerColorPicker.Value
end)
v31:AddSlider("TracerThicknessSlider", {
	Text = "Tracer Thickness",
	Default = _G.TracerThickness,
	Min = 1,
	Max = 5,
	Rounding = 0,
	Compact = false
})
Options.TracerThicknessSlider:OnChanged(function()
	_G.TracerThickness = Options.TracerThicknessSlider.Value
end)

local v32 = t2.Movement:AddLeftGroupbox("Speed")

v32:AddToggle("SpeedToggle", {
	Text = "Enable Speed",
	Default = false,
	Tooltip = "Increases walk speed"
})
Toggles.SpeedToggle:OnChanged(function()
	_G.SpeedEnabled = Toggles.SpeedToggle.Value
end)
v32:AddSlider("SpeedSlider", {
	Text = "Speed Value",
	Default = _G.SpeedValue,
	Min = 16,
	Max = 200,
	Rounding = 0,
	Compact = false
})
Options.SpeedSlider:OnChanged(function()
	_G.SpeedValue = Options.SpeedSlider.Value
end)

local v33 = t2.Movement:AddLeftGroupbox("Jump Power")

v33:AddToggle("JumpPowerToggle", {
	Text = "Enable Jump Power",
	Default = false,
	Tooltip = "Increases jump height"
})
Toggles.JumpPowerToggle:OnChanged(function()
	_G.JumpPowerEnabled = Toggles.JumpPowerToggle.Value
end)
v33:AddSlider("JumpPowerSlider", {
	Text = "Jump Power Value",
	Default = _G.JumpPowerValue,
	Min = 50,
	Max = 200,
	Rounding = 0,
	Compact = false
})
Options.JumpPowerSlider:OnChanged(function()
	_G.JumpPowerValue = Options.JumpPowerSlider.Value
end)

local v34 = t2.Teleport:AddLeftGroupbox("Player Teleport")
local s1 = ""
local u36 = nil

local function u37(p2)
	-- upvalues: Players (ref), LocalPlayer (ref)
	if p2 ~= "" then
		local v172 = p2:lower()

		for _, v in pairs(Players:GetPlayers()) do
			if v ~= LocalPlayer and v172 == v.Name:lower():sub(1, #v172) then
				return v
			end
		end

		return nil
	end

	return nil
end

v34:AddInput("PlayerNameInput", {
	Default = "",
	Numeric = false,
	Finished = false,
	Text = "Player Username",
	Tooltip = "Enter player username (Tab to autocomplete)",
	Placeholder = "Type username..."
})

local u38 = v34:AddLabel("Suggestion: None")

v34:AddButton({
	Text = "Show Player List (Click to Copy)",
	Func = function()
		-- upvalues: Players (ref), LocalPlayer (ref), u19 (ref)
		v = nil

		local PlayerListGui = game.CoreGui:FindFirstChild("PlayerListGui")

		if not PlayerListGui then
			local ScreenGui = Instance.new("ScreenGui")

			ScreenGui.Name = "PlayerListGui"
			ScreenGui.Parent = game.CoreGui
			ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

			local Frame = Instance.new("Frame")

			Frame.Parent = ScreenGui
			Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.5, -200, 0.5, -250)
			Frame.Size = UDim2.new(0, 400, 0, 500)

			local UICorner = Instance.new("UICorner")

			UICorner.CornerRadius = UDim.new(0, 10)
			UICorner.Parent = Frame

			local TextLabel = Instance.new("TextLabel")

			TextLabel.Parent = Frame
			TextLabel.BackgroundTransparency = 1
			TextLabel.Position = UDim2.new(0, 0, 0, 10)
			TextLabel.Size = UDim2.new(1, 0, 0, 30)
			TextLabel.Font = Enum.Font.GothamBold
			TextLabel.Text = "Click Player to Copy Username"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 18

			local TextButton = Instance.new("TextButton")

			TextButton.Parent = Frame
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
			TextButton.BorderSizePixel = 0
			TextButton.Position = UDim2.new(1, -40, 0, 10)
			TextButton.Size = UDim2.new(0, 30, 0, 30)
			TextButton.Font = Enum.Font.GothamBold
			TextButton.Text = "X"
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 16

			local UICorner2 = Instance.new("UICorner")

			UICorner2.CornerRadius = UDim.new(0, 6)
			UICorner2.Parent = TextButton
			TextButton.MouseButton1Click:Connect(function()
				-- upvalues: ScreenGui (ref)
				ScreenGui:Destroy()
			end)

			local ScrollingFrame = Instance.new("ScrollingFrame")

			ScrollingFrame.Parent = Frame
			ScrollingFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.Position = UDim2.new(0, 10, 0, 50)
			ScrollingFrame.Size = UDim2.new(1, -20, 1, -60)
			ScrollingFrame.ScrollBarThickness = 8

			local UICorner3 = Instance.new("UICorner")

			UICorner3.CornerRadius = UDim.new(0, 8)
			UICorner3.Parent = ScrollingFrame

			local UIListLayout = Instance.new("UIListLayout")

			UIListLayout.Parent = ScrollingFrame
			UIListLayout.SortOrder = Enum.SortOrder.Name
			UIListLayout.Padding = UDim.new(0, 5)

			for _, v in pairs(Players:GetPlayers()) do
				if LocalPlayer ~= v then
					local TextButton2 = Instance.new("TextButton")

					TextButton2.Parent = ScrollingFrame
					TextButton2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
					TextButton2.BorderSizePixel = 0
					TextButton2.Size = UDim2.new(1, -10, 0, 40)
					TextButton2.Font = Enum.Font.Gotham
					TextButton2.Text = v.Name
					TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextButton2.TextSize = 16
					TextButton2.TextXAlignment = Enum.TextXAlignment.Left
					TextButton2.TextXAlignment = Enum.TextXAlignment.Center

					local UICorner4 = Instance.new("UICorner")

					UICorner4.CornerRadius = UDim.new(0, 6)
					UICorner4.Parent = TextButton2
					TextButton2.MouseButton1Click:Connect(function()
						-- upvalues: v (ref), u19 (ref), ScreenGui (ref)
						setclipboard(v.Name)
						Options.PlayerNameInput:SetValue(v.Name)
						_G.TeleportTarget = v.Name
						u19:Notify("Copied: " .. v.Name, 2)
						ScreenGui:Destroy()
					end)
					TextButton2.MouseEnter:Connect(function()
						-- upvalues: TextButton2 (ref)
						TextButton2.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
					end)
					TextButton2.MouseLeave:Connect(function()
						-- upvalues: TextButton2 (ref)
						TextButton2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
					end)
				end
			end

			ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)

			return
		end

		PlayerListGui:Destroy()
	end,
	Tooltip = "Opens a list of all players - click to copy username"
})
Options.PlayerNameInput:OnChanged(function()
	-- upvalues: s1 (ref), u36 (ref), u37 (ref), u38 (ref)
	s1 = Options.PlayerNameInput.Value
	u36 = u37(s1)
	_G.TeleportTarget = s1

	if not u36 then
		u38:SetText("Suggestion: None")
	else
		u38:SetText("Suggestion: " .. u36.Name)
	end
end)
v34:AddButton({
	Text = "Teleport to Player",
	Func = function()
		-- upvalues: Players (ref), u37 (ref), LocalPlayer (ref), u19 (ref)
		local v73 = Players:FindFirstChild(_G.TeleportTarget) or u37(_G.TeleportTarget)

		if not v73 or not v73.Character or not v73.Character:FindFirstChild("HumanoidRootPart") then
			u19:Notify("Player not found or invalid!", 3)
		elseif LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			LocalPlayer.Character.HumanoidRootPart.CFrame = v73.Character.HumanoidRootPart.CFrame
			u19:Notify(string.format("Teleported to %s!", v73.Name), 3)
		end
	end,
	Tooltip = "Teleport once to target player"
})
v34:AddToggle("InfiniteTeleportToggle", {
	Text = "Infinite Teleport",
	Default = false,
	Tooltip = "Continuously teleport to player"
})
Toggles.InfiniteTeleportToggle:OnChanged(function()
	-- upvalues: u19 (ref)
	_G.InfiniteTeleport = Toggles.InfiniteTeleportToggle.Value
	u19:Notify("Infinite Teleport: " .. (_G.InfiniteTeleport and "ENABLED" or "DISABLED"), 2)
end)

local v39 = t2.Teleport:AddRightGroupbox("Info")

v39:AddLabel("Press Tab to autocomplete")
v39:AddLabel("Suggestions shown below input")
v39:AddLabel("Infinite TP follows player")

local v40 = t2.Teleport:AddLeftGroupbox("Location Teleport")
local t3 = {
	["Gun-Shop/Armor"] = CFrame.new(-554.3424682617188, 8, -735.86),
	Plaza = CFrame.new(-897.9401245117188, 21.253002166748047, -599.7673950195312),
	["Basketball-Court"] = CFrame.new(896.14306640625, 21.997821807861328, 518.1597290039006),
	["Da Casino"] = CFrame.new(-889.9207763671875, 21.25299835205078, -185.10830688476562),
	["Da Bank"] = CFrame.new(407.0549621582031, 21.748001098632812, -285.6971740722656),
	Arcade = CFrame.new(-290.5264892578125, 21.747997283935547, -329.16455078125),
	["Hood Fitness"] = CFrame.new(-76.13721466006446, 21.78511373901367, -587.7689208984375),
	["Hood Kicks"] = CFrame.new(-182.13609313964844, 21.252994537353516, -409.8181815234375),
	["Hood High"] = CFrame.new(-653.9518432617188, 21.747997283935547, 230.62849426262952),
	["Vehicle Spawner"] = CFrame.new(59.994384765625, 21.277897970581055, -1325.818603515625),
	Church = CFrame.new(203.565, 21.747, 91.04021),
	["Gas Station"] = CFrame.new(506.237676607099, 47.777, -201.3423),
	["Food Place"] = CFrame.new(532.795, 51.0594, 494.0897),
	Playground = CFrame.new(-209.8197021484, 22.147, -765.956),
	["Da Carnival"] = CFrame.new(-92.478, 21.878, -865.411),
	Boxing = CFrame.new(-202.2120361328125, 21.753, -1119.731)
}
local t4 = {}

for k, _ in pairs(t3) do
	table.insert(t4, k)
end

table.sort(t4)
v40:AddDropdown("LocationDropdown", {
	Values = t4,
	Default = 1,
	Multi = false,
	Text = "Select Location",
	Tooltip = "Choose a location to teleport to"
})
v40:AddButton({
	Text = "Teleport to Location",
	Func = function()
		-- upvalues: t3 (ref), LocalPlayer (ref), u19 (ref)
		local LocationDropdownValue = Options.LocationDropdown.Value

		if not LocationDropdownValue or not t3[LocationDropdownValue] then
			u19:Notify("Please select a location!", 3)
		elseif LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			LocalPlayer.Character.HumanoidRootPart.CFrame = t3[LocationDropdownValue]
			u19:Notify(string.format("Teleported to %s!", LocationDropdownValue), 3)
		end
	end,
	Tooltip = "Teleport to selected location"
})

local v45 = t2.Troll:AddLeftGroupbox("Pick Up Void")

v45:AddToggle("PickUpVoidToggle", {
	Text = "Enable Pick Up Void",
	Default = false,
	Tooltip = "Enables the Pick Up Void feature"
})
Toggles.PickUpVoidToggle:OnChanged(function()
	-- upvalues: u19 (ref)
	_G.PickUpVoidEnabled = Toggles.PickUpVoidToggle.Value
	u19:Notify("Pick Up Void: " .. (_G.PickUpVoidEnabled and "ENABLED" or "DISABLED"), 2)
end)
v45:AddLabel("Toggle Key"):AddKeyPicker("PickUpVoidKey", {
	Default = _G.PickUpVoidToggleKey,
	SyncToggleState = false,
	Mode = "Toggle",
	Text = "Pick Up Void Key",
	NoUI = false
})
v45:AddButton({
	Text = "Execute Pick Up Void",
	Func = function()
		-- upvalues: LocalPlayer (ref), u19 (ref), RunService (ref)
		if not _G.PickUpVoidEnabled then
			u19:Notify("Please enable Pick Up Void first!", 2)
		elseif LocalPlayer.Character then
			local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

			if HumanoidRootPart and Humanoid then
				_G.SavedPosition = HumanoidRootPart.CFrame

				local Health = Humanoid.Health
				local connection = Humanoid.HealthChanged:Connect(function(p3)
					-- upvalues: Health (ref), Humanoid (ref)
					if p3 < Health then
						Humanoid.Health = Health
					end
				end)

				u19:Notify("Pick Up Void Activated! Returning in 4 seconds...", 4)

				local timestamp = tick()
				local connection2 = nil

				connection2 = RunService.Heartbeat:Connect(function()
					-- upvalues: timestamp (ref), HumanoidRootPart (ref), connection2 (ref), connection (ref), u19 (ref)
					if not (tick() - timestamp < 4) then
						if connection2 then
							connection2:Disconnect()
						end

						if connection then
							connection:Disconnect()
						end

						if _G.SavedPosition and HumanoidRootPart then
							HumanoidRootPart.CFrame = _G.SavedPosition
							u19:Notify("Returned to original position!", 2)
						end
					elseif HumanoidRootPart then
						HumanoidRootPart.CFrame = CFrame.new(1000, 9999, 1000)
					end
				end)
			end
		end
	end,
	Tooltip = "Execute the Pick Up Void sequence"
})
v45:AddLabel("Info:")
v45:AddLabel("1. Saves your position")
v45:AddLabel("2. Pickup Player")
v45:AddLabel("3. Execute Pick Up Voice")
v45:AddLabel("4. Drop Player In Void")
v45:AddLabel("5. Returns to saved position")

local v46 = t2.Troll:AddRightGroupbox("SpinBot")

v46:AddToggle("SpinBotToggle", {
	Text = "Enable SpinBot",
	Default = false,
	Tooltip = "Makes your character spin rapidly"
})
Toggles.SpinBotToggle:OnChanged(function()
	-- upvalues: u19 (ref)
	_G.SpinBotEnabled = Toggles.SpinBotToggle.Value
	u19:Notify("SpinBot: " .. (_G.SpinBotEnabled and "ENABLED" or "DISABLED"), 2)
end)
v46:AddSlider("SpinBotSpeedSlider", {
	Text = "Spin Speed",
	Default = _G.SpinBotSpeed,
	Min = 1,
	Max = 100,
	Rounding = 0,
	Compact = false,
	Tooltip = "How fast to spin"
})
Options.SpinBotSpeedSlider:OnChanged(function()
	_G.SpinBotSpeed = Options.SpinBotSpeedSlider.Value
end)

local v47 = t2.Troll:AddLeftGroupbox("Fake Lag")

v47:AddToggle("FakeLagToggle", {
	Text = "Enable Fake Lag",
	Default = false,
	Tooltip = "Makes you appear to lag to other players"
})
Toggles.FakeLagToggle:OnChanged(function()
	-- upvalues: u19 (ref)
	_G.FakeLagEnabled = Toggles.FakeLagToggle.Value
	u19:Notify("Fake Lag: " .. (_G.FakeLagEnabled and "ENABLED" or "DISABLED"), 2)
end)
v47:AddSlider("FakeLagIntensitySlider", {
	Text = "Lag Intensity",
	Default = _G.FakeLagIntensity,
	Min = 0.1,
	Max = 2,
	Rounding = 1,
	Compact = false,
	Tooltip = "How intense the fake lag appears"
})
Options.FakeLagIntensitySlider:OnChanged(function()
	_G.FakeLagIntensity = Options.FakeLagIntensitySlider.Value
end)
v47:AddLabel("Randomly freezes your position")
v47:AddLabel("to appear like you're lagging")
t2.Misc:AddLeftGroupbox("Invisibility"):AddToggle("InvisibilityToggle", {
	Text = "Enable Invisibility",
	Default = false,
	Tooltip = "Makes you invisible to other players"
})
Toggles.InvisibilityToggle:OnChanged(function()
	-- upvalues: LocalPlayer (ref), u19 (ref)
	_G.InvisibilityEnabled = Toggles.InvisibilityToggle.Value

	if LocalPlayer.Character then
		if not _G.InvisibilityEnabled then
			local invischair = workspace:FindFirstChild("invischair")

			if invischair then
				invischair:Destroy()
			end

			for _, v in ipairs(LocalPlayer.Character:GetDescendants()) do
				if not v:IsA("BasePart") or v.Name == "HumanoidRootPart" then
					if v:IsA("Decal") then
						v.Transparency = 0
					end
				else
					v.Transparency = 0
				end
			end

			u19:Notify("Invisibility: DISABLED", 2)
		else
			local CFrame2 = LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame

			LocalPlayer.Character:MoveTo(Vector3.new(-25.95, 1000, 3537.55))
			task.wait(0.15)

			local Seat = Instance.new("Seat")

			Seat.Anchored = false
			Seat.CanCollide = false
			Seat.Name = "invischair"
			Seat.Transparency = 1
			Seat.Position = Vector3.new(-25.95, 1084, 3537.55)
			Seat.Parent = workspace

			local Weld = Instance.new("Weld")

			Weld.Part0 = Seat
			Weld.Part1 = LocalPlayer.Character:FindFirstChild("Torso") or LocalPlayer.Character:FindFirstChild("UpperTorso")
			Weld.Parent = Seat
			Seat.CFrame = CFrame2

			for _, v in ipairs(LocalPlayer.Character:GetDescendants()) do
				if not v:IsA("BasePart") or v.Name == "HumanoidRootPart" then
					if v:IsA("Decal") then
						v.Transparency = 0.6
					end
				else
					v.Transparency = 0.6
					v.CanCollide = false
				end
			end

			u19:Notify("Invisibility: ENABLED", 2)
		end
	end
end)

local v48 = t2.Misc:AddLeftGroupbox("Emote Player")
local t5 = {
	Dance = "http://www.roblox.com/asset/?id=507771019",
	Wave = "https://www.roblox.com/asset/?id=18537387180",
	Cheer = "https://www.roblox.com/asset/?id=507777451"
}

v48:AddDropdown("EmoteDropdown", {
	Values = {
		"Dance",
		"Wave",
		"Cheer"
	},
	Default = 1,
	Multi = false,
	Text = "Select Emote",
	Tooltip = "Choose an emote to play"
})
Options.EmoteDropdown:OnChanged(function()
	_G.SelectedEmote = Options.EmoteDropdown.Value
end)
v48:AddButton({
	Text = "Play Emote",
	Func = function()
		-- upvalues: t5 (ref), LocalPlayer (ref), u19 (ref)
		if not _G.SelectedEmote or not t5[_G.SelectedEmote] then
			u19:Notify("Please select an emote!", 2)
		elseif LocalPlayer.Character then
			local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

			if Humanoid then
				local v70 = t5[_G.SelectedEmote]
				local Animation = Instance.new("Animation")

				Animation.AnimationId = v70

				local v72 = Humanoid:LoadAnimation(Animation)

				v72:Play()
				u19:Notify(string.format("Playing %s!", _G.SelectedEmote), 2)
				_G.CurrentEmoteTrack = v72
				Animation:Destroy()
			end
		end
	end,
	Tooltip = "Play selected emote"
})
v48:AddLabel("Emote stops when you move")

local v50 = t2.Misc:AddRightGroupbox("Auto Safe")

v50:AddToggle("AutoSafeToggle", {
	Text = "Enable Auto Safe",
	Default = false,
	Tooltip = "Teleports through 100 locations when health is low"
})
Toggles.AutoSafeToggle:OnChanged(function()
	-- upvalues: u19 (ref)
	_G.AutoSafeEnabled = Toggles.AutoSafeToggle.Value
	u19:Notify("Auto Safe: " .. (_G.AutoSafeEnabled and "ENABLED" or "DISABLED"), 2)
end)
v50:AddSlider("SafeHealthSlider", {
	Text = "Health Threshold",
	Default = _G.SafeHealthThreshold,
	Min = 10,
	Max = 50,
	Rounding = 0,
	Compact = false,
	Tooltip = "Activate when health drops below this value"
})
Options.SafeHealthSlider:OnChanged(function()
	_G.SafeHealthThreshold = Options.SafeHealthSlider.Value
end)
v50:AddLabel("Teleports through 100 random")
v50:AddLabel("locations over 5 seconds")
v50:AddLabel("Returns to Gun Shop after")
v50:AddLabel("Final Location:")
v50:AddLabel("Gunshop/Armor Place")

local v51 = t2.Settings:AddLeftGroupbox("Executor Info")

v51:AddLabel("Executor: " .. v9)
v51:AddLabel(v11)

local v52 = t2.Settings:AddLeftGroupbox("Anti-Detection")

v52:AddToggle("AntiDetectionToggle", {
	Text = "Enable Anti-Detection",
	Default = true,
	Tooltip = "Randomizes timing to avoid detection"
})
Toggles.AntiDetectionToggle:OnChanged(function()
	-- upvalues: t1 (ref)
	t1.Enabled = Toggles.AntiDetectionToggle.Value
end)
v52:AddToggle("RandomDelaysToggle", {
	Text = "Randomized Delays",
	Default = true,
	Tooltip = "Adds random delays to actions"
})
Toggles.RandomDelaysToggle:OnChanged(function()
	-- upvalues: t1 (ref)
	t1.RandomizedDelays = Toggles.RandomDelaysToggle.Value
end)
v52:AddLabel("Anti-detection reduces")
v52:AddLabel("predictable patterns")

local v53 = t2.Settings:AddRightGroupbox("Performance")

v53:AddToggle("AntiAFKToggle", {
	Text = "Anti AFK",
	Default = false,
	Tooltip = "Prevents being kicked for inactivity"
})
Toggles.AntiAFKToggle:OnChanged(function()
	_G.AntiAFK = Toggles.AntiAFKToggle.Value
end)
v53:AddToggle("FPSUnlockerToggle", {
	Text = "FPS Unlocker",
	Default = false,
	Tooltip = "Unlocks FPS cap"
})
Toggles.FPSUnlockerToggle:OnChanged(function()
	_G.FPSUnlocker = Toggles.FPSUnlockerToggle.Value

	if not _G.FPSUnlocker then
		setfpscap(999)
	else
		setfpscap(_G.FPSCap)
	end
end)
v53:AddSlider("FPSCapSlider", {
	Text = "FPS Cap",
	Default = _G.FPSCap,
	Min = 1,
	Max = 999,
	Rounding = 0,
	Compact = false
})
Options.FPSCapSlider:OnChanged(function()
	_G.FPSCap = Options.FPSCapSlider.Value

	if _G.FPSUnlocker then
		setfpscap(_G.FPSCap)
	end
end)
v20:SetLibrary(u19)
v20:SetFolder("EZHoodThemes")
v20:ApplyToTab(t2.Settings)
v21:SetLibrary(u19)
v21:SetFolder("EZHood")
v21:BuildConfigSection(t2.Settings)

local function u54()
	-- upvalues: Players (ref), LocalPlayer (ref)
	local t6 = {}

	for _, v in pairs(Players:GetPlayers()) do
		if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
			table.insert(t6, v)
		end
	end

	return t6
end

local t7 = {}
local t8 = {}
local t9 = {}
local t10 = {}
local t11 = {}
local t12 = {}
local t13 = {}
local t14 = {}
local t15 = {}
local t16 = {}
local drawing2 = Drawing.new("Text")

drawing2.Size = 20
drawing2.Center = false
drawing2.Outline = true
drawing2.Position = Vector2.new(10, 10)
drawing2.Color = Color3.fromRGB(255, 255, 255)
drawing2.Visible = false
drawing2.Text = ""

local function u66(p4, p5)
	-- upvalues: drawing2 (ref)
	drawing2.Text = p4
	drawing2.Visible = true
	task.delay(p5 or 3, function()
		-- upvalues: drawing2 (ref)
		drawing2.Visible = false
	end)
end

UserInputService.InputBegan:Connect(function(input, p6)
	-- upvalues: u36 (ref), s1 (ref)
	if not p6 and input.KeyCode == Enum.KeyCode.Tab and u36 and s1 ~= "" then
		Options.PlayerNameInput:SetValue(u36.Name)
		_G.TeleportTarget = u36.Name
	end
end)
task.spawn(function()
	-- upvalues: RunService (ref), LocalPlayer (ref)
	local HumanoidRootPartPosition = nil

	RunService.Heartbeat:Connect(function()
		-- upvalues: LocalPlayer (ref), HumanoidRootPartPosition (ref)
		if LocalPlayer.Character then
			local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				if HumanoidRootPartPosition and (HumanoidRootPart.Position - HumanoidRootPartPosition).Magnitude > 0.1 and _G.CurrentEmoteTrack then
					_G.CurrentEmoteTrack:Stop()
					_G.CurrentEmoteTrack = nil
				end

				HumanoidRootPartPosition = HumanoidRootPart.Position
			end
		end
	end)
end)
task.spawn(function()
	-- upvalues: RunService (ref), LocalPlayer (ref), u19 (ref)
	local n1 = 0
	local n2 = 10
	local u96 = false

	local function u97()
		local ScreenGui = Instance.new("ScreenGui")
		local Frame = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")
		local UICorner = Instance.new("UICorner")

		ScreenGui.Parent = game.CoreGui
		ScreenGui.Name = "AutoSafeWarning"
		ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		Frame.Parent = ScreenGui
		Frame.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
		Frame.BorderSizePixel = 0
		Frame.Size = UDim2.new(0, 600, 0, 80)
		Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		UICorner.Parent = Frame
		UICorner.CornerRadius = UDim.new(0, 10)
		TextLabel.Parent = Frame
		TextLabel.BackgroundTransparency = 1
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.Font = Enum.Font.GothamBold
		TextLabel.Text = "⚠\239\184\143 AUTO SAFE ACTIVATED ⚠\239\184\143\nYou will teleport rapidly - this is normal!\nYou'll be stuck for 5 seconds at the end - just wait!"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 18
		TextLabel.TextWrapped = true
		TextLabel.TextYAlignment = Enum.TextYAlignment.Center
		Frame:TweenPosition(Frame.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.5, true)

		return ScreenGui
	end
	local function u98(p7)
		-- upvalues: u96 (ref)
		if p7 and p7.Parent then
			p7:Destroy()
			u96 = false
		end
	end

	RunService.Heartbeat:Connect(function()
		-- upvalues: LocalPlayer (ref), u96 (ref), n1 (ref), n2 (ref), u97 (ref), u98 (ref), u19 (ref)
		if _G.AutoSafeEnabled and LocalPlayer.Character and not _G.SafeTeleporting and not u96 then
			local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

			if Humanoid and HumanoidRootPart then
				local timestamp = tick()

				if Humanoid.Health <= _G.SafeHealthThreshold and Humanoid.Health > 0 and timestamp - n1 >= n2 then
					_G.SafeTeleporting = true
					n1 = timestamp
					u96 = true

					local u195 = u97()

					task.spawn(function()
						-- upvalues: u98 (ref), u195 (ref)
						task.wait(7)
						u98(u195)
					end)
					task.spawn(function()
						-- upvalues: HumanoidRootPart (ref), u19 (ref)
						local t17 = {
							2304,
							1000,
							1503,
							3421,
							2198,
							1876,
							4532,
							1987,
							3210,
							5432
						}

						for i = 1, 100 do
							if not _G.AutoSafeEnabled then
								break
							end

							local v218 = t17[(i * 3 - 2) % #t17 + 1]
							local v219 = t17[(i * 3 - 1) % #t17 + 1]
							local v220 = t17[i * 3 % #t17 + 1]

							if HumanoidRootPart and HumanoidRootPart.Parent then
								HumanoidRootPart.CFrame = CFrame.new(v218, v219, v220)
							end

							task.wait(0.05)
						end

						if HumanoidRootPart and HumanoidRootPart.Parent then
							local cFrame = CFrame.new(-554.3424682617188, 8, -735.86)
							local timestamp2 = tick()

							u19:Notify("Auto Safe Complete! Locked at Gun Shop for 5 seconds", 3)

							while tick() - timestamp2 < 5 and HumanoidRootPart and HumanoidRootPart.Parent and _G.AutoSafeEnabled do
								HumanoidRootPart.CFrame = cFrame
								task.wait()
							end

							u19:Notify("Safe lock released!", 2)
						end

						_G.SafeTeleporting = false
					end)
				end
			end
		end
	end)
end)
task.spawn(function()
	-- upvalues: Players (ref), u37 (ref), LocalPlayer (ref)
	while task.wait(0.1) do
		if _G.InfiniteTeleport and _G.TeleportTarget ~= "" then
			local v168 = Players:FindFirstChild(_G.TeleportTarget) or u37(_G.TeleportTarget)

			if v168 and v168.Character and v168.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				LocalPlayer.Character.HumanoidRootPart.CFrame = v168.Character.HumanoidRootPart.CFrame
			end
		end
	end
end)
task.spawn(function()
	while task.wait(120) do
		if _G.AntiAFK then
			local VirtualUser = game:GetService("VirtualUser")

			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end
	end
end)
task.spawn(function()
	-- upvalues: RunService (ref), LocalPlayer (ref)
	RunService.Heartbeat:Connect(function()
		-- upvalues: LocalPlayer (ref)
		if LocalPlayer.Character then
			local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

			if Humanoid then
				Humanoid.WalkSpeed = _G.SpeedEnabled and _G.SpeedValue or 16
				Humanoid.JumpPower = _G.JumpPowerEnabled and _G.JumpPowerValue or 50
			end
		end
	end)
end)
task.spawn(function()
	-- upvalues: RunService (ref), u54 (ref)
	RunService.Heartbeat:Connect(function()
		-- upvalues: u54 (ref)
		if _G.HitboxExpanded then
			for _, v in pairs(u54()) do
				if v.Character then
					local HumanoidRootPart = v.Character:FindFirstChild("HumanoidRootPart")

					if HumanoidRootPart then
						HumanoidRootPart.Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
						HumanoidRootPart.Transparency = _G.HitboxTransparency
						HumanoidRootPart.Color = _G.HitboxColor
						HumanoidRootPart.Material = Enum.Material.Neon
						HumanoidRootPart.CanCollide = false
					end
				end
			end
		end
	end)
end)
task.spawn(function()
	-- upvalues: RunService (ref), LocalPlayer (ref)
	RunService.RenderStepped:Connect(function()
		-- upvalues: LocalPlayer (ref)
		if _G.SpinBotEnabled and LocalPlayer.Character then
			local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(_G.SpinBotSpeed), 0)
			end
		end
	end)
end)
task.spawn(function()
	-- upvalues: RunService (ref), LocalPlayer (ref)
	local n3 = 0
	local u77 = false
	local HumanoidRootPartCFrame = nil

	RunService.Heartbeat:Connect(function(dt)
		-- upvalues: LocalPlayer (ref), n3 (ref), u77 (ref), HumanoidRootPartCFrame (ref)
		if _G.FakeLagEnabled and LocalPlayer.Character then
			local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				n3 = n3 + dt

				if u77 or not (n3 >= _G.FakeLagIntensity) then
					if u77 and n3 >= 0.1 then
						if HumanoidRootPartCFrame then
							HumanoidRootPart.CFrame = HumanoidRootPartCFrame
						end

						u77 = false
						n3 = 0
					end
				else
					u77 = true
					HumanoidRootPartCFrame = HumanoidRootPart.CFrame
					n3 = 0
				end
			end
		end
	end)
end)

local n4 = 0

task.spawn(function()
	-- upvalues: RunService (ref), u8 (ref), u7 (ref), n4 (ref), UserInputService (ref), u54 (ref), LocalPlayer (ref)
	RunService.RenderStepped:Connect(function()
		-- upvalues: u8 (ref), u7 (ref), n4 (ref), UserInputService (ref), u54 (ref), LocalPlayer (ref)
		if _G.TriggerbotEnabled then
			if u8() then
				local timestamp = tick()

				if not (u7(_G.TriggerbotDelay) > timestamp - n4) then
					local CurrentCamera = workspace.CurrentCamera
					local MouseLocation = UserInputService:GetMouseLocation()

					for _, v in pairs(u54()) do
						if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
							local t18 = {
								v.Character.HumanoidRootPart,
								(v.Character:FindFirstChild("Head"))
							}

							for _, v2 in pairs(t18) do
								if v2 then
									local v209, v210 = CurrentCamera:WorldToViewportPoint(v2.Position)

									if v210 and (Vector2.new(v209.X, v209.Y) - MouseLocation).Magnitude < 20 then
										if not _G.TriggerbotWallCheck then
											mouse1click()
											n4 = timestamp

											return
										end

										local ray = Ray.new(CurrentCamera.CFrame.Position, (v2.Position - CurrentCamera.CFrame.Position).Unit * 1000)
										local PartOnRayWithIgnoreList = workspace:FindPartOnRayWithIgnoreList(ray, {
											LocalPlayer.Character,
											CurrentCamera
										})

										if PartOnRayWithIgnoreList and PartOnRayWithIgnoreList:IsDescendantOf(v.Character) then
											mouse1click()
											n4 = timestamp

											return
										end
									end
								end
							end
						end
					end

					return
				end

				return
			end

			return
		end
	end)
end)
Options.SilentAimKey:OnClick(function()
	-- upvalues: u66 (ref)
	if _G.SilentAimEnabled then
		_G.SilentAimActive = not _G.SilentAimActive
		u66("Silent Aim: " .. (_G.SilentAimActive and "ENABLED" or "DISABLED"), 2)
	end
end)
Options.PickUpVoidKey:OnClick(function()
	-- upvalues: LocalPlayer (ref), u19 (ref), RunService (ref)
	if not _G.PickUpVoidEnabled or not LocalPlayer.Character then
		u19:Notify("Pick Up Void is not enabled!", 2)
	else
		local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

		if HumanoidRootPart and Humanoid then
			_G.SavedPosition = HumanoidRootPart.CFrame

			local Health = Humanoid.Health
			local connection = Humanoid.HealthChanged:Connect(function(p8)
				-- upvalues: Health (ref), Humanoid (ref)
				if p8 < Health then
					Humanoid.Health = Health
				end
			end)

			u19:Notify("Pick Up Void Activated! Returning in 4 seconds...", 4)

			local timestamp = tick()
			local connection3 = nil

			connection3 = RunService.Heartbeat:Connect(function()
				-- upvalues: timestamp (ref), HumanoidRootPart (ref), connection3 (ref), connection (ref), u19 (ref)
				if not (tick() - timestamp < 4) then
					if connection3 then
						connection3:Disconnect()
					end

					if connection then
						connection:Disconnect()
					end

					if _G.SavedPosition and HumanoidRootPart then
						HumanoidRootPart.CFrame = _G.SavedPosition
						u19:Notify("Returned to original position!", 2)
					end
				elseif HumanoidRootPart then
					HumanoidRootPart.CFrame = CFrame.new(1000, 9999, 1000)
				end
			end)
		end
	end
end)
task.spawn(function()
	-- upvalues: RunService (ref), t16 (ref)
	RunService.Heartbeat:Connect(function()
		-- upvalues: t16 (ref)
		if not _G.CashESPEnabled then
			for _, v in pairs(t16) do
				if v then
					v.Enabled = false
				end
			end
		else
			for _, v in pairs(workspace:GetDescendants()) do
				if v:IsA("Model") and v.Name == "Cash" then
					if t16[v] then
						t16[v].FillColor = _G.CashESPColor
						t16[v].OutlineColor = _G.CashESPColor
						t16[v].Enabled = true
					else
						local Highlight = Instance.new("Highlight")

						Highlight.Parent = v
						Highlight.Adornee = v
						Highlight.FillTransparency = 0.5
						Highlight.OutlineTransparency = 0
						Highlight.FillColor = _G.CashESPColor
						Highlight.OutlineColor = _G.CashESPColor
						t16[v] = Highlight
					end
				end
			end

			for k, v in pairs(t16) do
				if not k.Parent then
					v:Destroy()
					t16[k] = nil
				end
			end
		end
	end)
end)

local t19 = {
	{
		"Head",
		"UpperTorso"
	},
	{
		"UpperTorso",
		"LowerTorso"
	},
	{
		"UpperTorso",
		"LeftUpperArm"
	},
	{
		"LeftUpperArm",
		"LeftLowerArm"
	},
	{
		"LeftLowerArm",
		"LeftHand"
	},
	{
		"UpperTorso",
		"RightUpperArm"
	},
	{
		"RightUpperArm",
		"RightLowerArm"
	},
	{
		"RightLowerArm",
		"RightHand"
	},
	{
		"LowerTorso",
		"LeftUpperLeg"
	},
	{
		"LeftUpperLeg",
		"LeftLowerLeg"
	},
	{
		"LeftLowerLeg",
		"LeftFoot"
	},
	{
		"LowerTorso",
		"RightUpperLeg"
	},
	{
		"RightUpperLeg",
		"RightLowerLeg"
	},
	{
		"RightLowerLeg",
		"RightFoot"
	}
}

RunService.RenderStepped:Connect(function()
	-- upvalues: UserInputService (ref), drawing (ref), u8 (ref), u54 (ref), LocalPlayer (ref), t7 (ref), t13 (ref), t9 (ref), t10 (ref), t11 (ref), t12 (ref), t14 (ref), t19 (ref), t8 (ref), t15 (ref)
	local CurrentCamera = workspace.CurrentCamera
	local MouseLocation = UserInputService:GetMouseLocation()

	if not _G.FOVEnabled then
		drawing.Visible = false
	else
		drawing.Position = MouseLocation
		drawing.Visible = true
	end

	if _G.SilentAimEnabled and _G.SilentAimActive and u8() then
		local v101 = nil
		local v102 = _G.FOVEnabled and drawing.Radius or math.huge

		for _, v in pairs(u54()) do
			if v.Character:FindFirstChild(_G.TargetPart) then
				local v105, v106 = CurrentCamera:WorldToViewportPoint(v.Character[_G.TargetPart].Position)

				if v106 then
					local Magnitude = (Vector2.new(v105.X, v105.Y) - MouseLocation).Magnitude

					if Magnitude < v102 then
						v102 = Magnitude
						v101 = v
					end
				end
			end
		end

		if v101 and v101.Character:FindFirstChild(_G.TargetPart) then
			local v108 = CurrentCamera:WorldToViewportPoint(v101.Character[_G.TargetPart].Position)
			local v109 = MouseLocation.X + (v108.X - MouseLocation.X) * _G.AimSmoothness
			local v110 = MouseLocation.Y + (v108.Y - MouseLocation.Y) * _G.AimSmoothness

			mousemoverel(v109 - MouseLocation.X, v110 - MouseLocation.Y)
		end
	end

	local t20 = {}

	for _, v in pairs(u54()) do
		t20[v] = true

		local Character = v.Character
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
		local Head = Character:FindFirstChild("Head")
		local Humanoid = Character:FindFirstChild("Humanoid")

		if HumanoidRootPart then
			local v118, v119 = CurrentCamera:WorldToViewportPoint(HumanoidRootPart.Position)

			if not v119 then
				if t7[v] then
					t7[v].Visible = false
				end

				if t8[v] then
					t8[v].Visible = false
				end

				if t9[v] then
					t9[v].Visible = false
				end

				if t10[v] then
					t10[v].Visible = false
				end

				if t11[v] then
					t11[v].Visible = false
				end

				if t12[v] then
					t12[v].Visible = false
				end

				if t13[v] then
					t13[v].Visible = false
				end

				if t14[v] then
					for _, v3 in pairs(t14[v]) do
						v3.Visible = false
					end
				end

				if t15[v] then
					t15[v].Enabled = false
				end
			else
				local Magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude

				if not _G.ESPEnabled then
					if t7[v] then
						t7[v].Visible = false
					end
				else
					if not t7[v] then
						t7[v] = Drawing.new("Square")
						t7[v].Thickness = 2
						t7[v].Filled = false
					end

					t7[v].Visible = true
					t7[v].Size = Vector2.new(2500 / v118.Z, 3500 / v118.Z)
					t7[v].Position = Vector2.new(v118.X - 2500 / v118.Z / 2, v118.Y - 3500 / v118.Z / 2)
					t7[v].Color = _G.ESPColor
				end

				if not _G.HeadESPEnabled or not Head then
					if t13[v] then
						t13[v].Visible = false
					end
				else
					local v123, v124 = CurrentCamera:WorldToViewportPoint(Head.Position)

					if v124 then
						if not t13[v] then
							t13[v] = Drawing.new("Circle")
							t13[v].Thickness = 2
							t13[v].Filled = false
							t13[v].NumSides = 32
						end

						t13[v].Visible = true
						t13[v].Position = Vector2.new(v123.X, v123.Y)
						t13[v].Radius = 600 / v123.Z
						t13[v].Color = _G.HeadESPColor
					end
				end

				if not _G.NameESPEnabled then
					if t9[v] then
						t9[v].Visible = false
					end
				else
					if not t9[v] then
						t9[v] = Drawing.new("Text")
						t9[v].Center = true
						t9[v].Outline = true
						t9[v].Size = 16
					end

					t9[v].Visible = true
					t9[v].Position = Vector2.new(v118.X, v118.Y - 3500 / v118.Z / 2 - 25)
					t9[v].Text = v.Name
					t9[v].Color = _G.NameESPColor
				end

				if not _G.DistanceESPEnabled then
					if t10[v] then
						t10[v].Visible = false
					end
				else
					if not t10[v] then
						t10[v] = Drawing.new("Text")
						t10[v].Center = true
						t10[v].Outline = true
						t10[v].Size = 14
					end

					t10[v].Visible = true
					t10[v].Position = Vector2.new(v118.X, v118.Y + 3500 / v118.Z / 2 + 5)
					t10[v].Text = string.format("%.1f studs", Magnitude)
					t10[v].Color = _G.DistanceESPColor
				end

				if not _G.HealthESPEnabled or not Humanoid then
					if t11[v] then
						t11[v].Visible = false
						t12[v].Visible = false
					end
				else
					local v125 = Humanoid.Health / Humanoid.MaxHealth

					if not t11[v] then
						t11[v] = Drawing.new("Square")
						t11[v].Thickness = 1
						t11[v].Filled = true
						t12[v] = Drawing.new("Square")
						t12[v].Thickness = 1
						t12[v].Filled = false
						t12[v].Color = Color3.fromRGB(0, 0, 0)
					end

					t11[v].Visible = true
					t12[v].Visible = true

					local v126 = 3500 / v118.Z * v125

					t11[v].Size = Vector2.new(5, v126)
					t11[v].Position = Vector2.new(v118.X - 2500 / v118.Z / 2 - 9, v118.Y + 3500 / v118.Z / 2 - v126)
					t11[v].Color = _G.HealthBarColor
					t12[v].Size = Vector2.new(5, 3500 / v118.Z)
					t12[v].Position = Vector2.new(v118.X - 2500 / v118.Z / 2 - 9, v118.Y - 3500 / v118.Z / 2)
				end

				if not _G.SkeletonESPEnabled then
					if t14[v] then
						for _, v4 in pairs(t14[v]) do
							v4.Visible = false
						end
					end
				else
					if not t14[v] then
						t14[v] = {}
					end

					for k, v5 in pairs(t19) do
						local v131 = Character:FindFirstChild(v5[1])
						local v132 = Character:FindFirstChild(v5[2])

						if v131 and v132 then
							local v133, v134 = CurrentCamera:WorldToViewportPoint(v131.Position)
							local v135, v136 = CurrentCamera:WorldToViewportPoint(v132.Position)

							if not v134 or not v136 then
								if t14[v][k] then
									t14[v][k].Visible = false
								end
							else
								if not t14[v][k] then
									t14[v][k] = Drawing.new("Line")
									t14[v][k].Thickness = 2
								end

								t14[v][k].Visible = true
								t14[v][k].From = Vector2.new(v133.X, v133.Y)
								t14[v][k].To = Vector2.new(v135.X, v135.Y)
								t14[v][k].Color = _G.SkeletonColor
							end
						end
					end
				end

				if not _G.TracersEnabled then
					if t8[v] then
						t8[v].Visible = false
					end
				else
					if not t8[v] then
						t8[v] = Drawing.new("Line")
					end

					t8[v].Visible = true
					t8[v].Thickness = _G.TracerThickness
					t8[v].From = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y)
					t8[v].To = Vector2.new(v118.X, v118.Y)
					t8[v].Color = _G.TracerColor
				end

				if not _G.ChamsEnabled then
					if t15[v] then
						t15[v].Enabled = false
					end
				else
					if not t15[v] then
						t15[v] = Instance.new("Highlight")
						t15[v].Parent = Character
						t15[v].Adornee = Character
						t15[v].FillTransparency = 0.5
						t15[v].OutlineTransparency = 0
					end

					t15[v].FillColor = _G.ChamsColor
					t15[v].OutlineColor = _G.ChamsColor
					t15[v].Enabled = true
				end
			end
		end
	end

	for k, _ in pairs(t7) do
		if not t20[k] then
			if t7[k] then
				t7[k]:Remove()
				t7[k] = nil
			end

			if t8[k] then
				t8[k]:Remove()
				t8[k] = nil
			end

			if t9[k] then
				t9[k]:Remove()
				t9[k] = nil
			end

			if t10[k] then
				t10[k]:Remove()
				t10[k] = nil
			end

			if t11[k] then
				t11[k]:Remove()
				t11[k] = nil
			end

			if t12[k] then
				t12[k]:Remove()
				t12[k] = nil
			end

			if t13[k] then
				t13[k]:Remove()
				t13[k] = nil
			end

			if t14[k] then
				for _, v in pairs(t14[k]) do
					v:Remove()
				end

				t14[k] = nil
			end

			if t15[k] then
				t15[k]:Destroy()
				t15[k] = nil
			end
		end
	end
end)
u19:SetWatermarkVisibility(true)
u19:SetWatermark("EZ-Hood | " .. tostring(os.date("%H:%M:%S")))
u19:OnUnload(function()
	-- upvalues: u19 (ref)
	print("Unloaded!")
	u19.Unloaded = true
end)
u19:Notify("EZ-Hood loaded successfully!", 5)
u66("EZ-Hood | Ready | Anti-Detection Active", 3)
