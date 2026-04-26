local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel2 = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 254, 0, 107)
Frame.Active = true
Frame.Draggable = true
TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 254, 0, 41)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "KongerHub | Anti Afk"
TextLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel.TextSize = 23
TextLabel2.Parent = Frame
TextLabel2.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
TextLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel2.BorderSizePixel = 0
TextLabel2.Position = UDim2.new(0, 0, 0.487464696, 0)
TextLabel2.Size = UDim2.new(0, 254, 0, 41)
TextLabel2.Font = Enum.Font.Gotham
TextLabel2.Text = "Status: Active"
TextLabel2.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel2.TextSize = 23

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

Players.LocalPlayer.Idled:connect(function()
	-- upvalues: VirtualUser (ref), TextLabel2 (ref)
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
	TextLabel2.Text = "Status: Saved"
	wait(5)
	TextLabel2.Text = "Status: Active"
end)
