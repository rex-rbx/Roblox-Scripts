local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Frame2 = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local ImageButton = Instance.new("ImageButton")
local UICorner2 = Instance.new("UICorner")
local ImageButton2 = Instance.new("ImageButton")
local TextBox = Instance.new("TextBox")
local UICorner3 = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local TextLabel = Instance.new("TextLabel")
local TextLabel2 = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
Frame.Parent = ScreenGui
Frame.Active = true
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 325, 0, 129)
UICorner.Parent = Frame
Frame2.Name = "DropShadowHolder"
Frame2.Parent = Frame
Frame2.BackgroundTransparency = 1
Frame2.BorderSizePixel = 0
Frame2.Size = UDim2.new(1, 0, 1, 0)
Frame2.ZIndex = 0
ImageLabel.Name = "DropShadow"
ImageLabel.Parent = Frame2
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel.Size = UDim2.new(1, 47, 1, 47)
ImageLabel.ZIndex = 0
ImageLabel.Image = "rbxassetid://6015897843"
ImageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.ImageTransparency = 0.5
ImageLabel.ScaleType = Enum.ScaleType.Slice
ImageLabel.SliceCenter = Rect.new(49, 49, 450, 450)
ImageButton.Parent = Frame
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 1
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.855384588, 0, 0.03164557, 0)
ImageButton.Size = UDim2.new(0, 38, 0, 39)
ImageButton.Image = "http://www.roblox.com/asset/?id=6031094678"
ImageButton.MouseButton1Down:Connect(function()
	-- upvalues: ScreenGui (ref)
	ScreenGui:Destroy()
end)
UICorner2.Parent = ImageButton
ImageButton2.Name = "SendButton"
ImageButton2.Parent = Frame
ImageButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton2.BackgroundTransparency = 1
ImageButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton2.BorderSizePixel = 0
ImageButton2.Position = UDim2.new(0.86153847, 0, 0.486704022, 0)
ImageButton2.Size = UDim2.new(0, 33, 0, 33)
ImageButton2.Image = "http://www.roblox.com/asset/?id=6035067832"
ImageButton2.MouseButton1Down:Connect(function()
	-- upvalues: TextBox (ref)
	game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("" .. TextBox.Text .. " - Cracking IP Address...")
	task.wait(1.5)
	game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("" .. TextBox.Text .. " Is from nil OS (IP: Successfully Logged)")
	task.wait(1.5)
	game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("" .. TextBox.Text .. "'s Data Has Successfully Been Stolen.")
end)
TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
TextBox.BackgroundTransparency = 1
TextBox.BorderColor3 = Color3.fromRGB(69, 181, 255)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.036923077, 0, 0.398734182, 0)
TextBox.Size = UDim2.new(0, 257, 0, 52)
TextBox.Font = Enum.Font.Gotham
TextBox.PlaceholderText = "Input Username"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 20
TextBox.TextStrokeColor3 = Color3.fromRGB(1, 166, 255)
TextBox.TextWrapped = true
UICorner3.Parent = TextBox
UIStroke.Parent = TextBox
UIStroke.Color = Color3.fromRGB(38, 190, 255)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(38, 190, 255)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.fromRGB(38, 190, 255)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-0.0246153846, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "Folix's Grabber"
TextLabel.TextColor3 = Color3.fromRGB(38, 190, 255)
TextLabel.TextSize = 25
TextLabel2.Parent = Frame
TextLabel2.BackgroundColor3 = Color3.fromRGB(38, 190, 255)
TextLabel2.BackgroundTransparency = 1
TextLabel2.BorderColor3 = Color3.fromRGB(38, 190, 255)
TextLabel2.BorderSizePixel = 0
TextLabel2.Position = UDim2.new(0.261538476, 0, 0, 0)
TextLabel2.Size = UDim2.new(0, 200, 0, 50)
TextLabel2.Font = Enum.Font.Gotham
TextLabel2.Text = "V1"
TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel2.TextSize = 25
coroutine.wrap(function()
	-- upvalues: Frame (ref)
	local LocalScript = Instance.new("LocalScript", Frame)
	local UserInputService = game:GetService("UserInputService")

	local function dragify(p1)
		-- upvalues: UserInputService (ref)
		local v18 = nil

		dragToggle = v18
		dragInput = nil
		dragStart = nil

		local function updateInput(p2)
			-- upvalues: p1 (ref)
			local v22 = p2.Position - dragStart
			local uDim2 = UDim2.new(startPos.X.Scale, startPos.X.Offset + v22.X, startPos.Y.Scale, startPos.Y.Offset + v22.Y)

			game:GetService("TweenService"):Create(p1, TweenInfo.new(0.25), {
				Position = uDim2
			}):Play()
		end

		p1.InputBegan:Connect(function(input)
			-- upvalues: UserInputService (ref), p1 (ref)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UserInputService:GetFocusedTextBox() == nil then
				dragToggle = true
				dragStart = input.Position
				startPos = p1.Position
				input.Changed:Connect(function()
					-- upvalues: input (ref)
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		p1.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input == dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end

	dragify(LocalScript.Parent)
end)()
coroutine.wrap(function()
	local LocalScript = Instance.new("LocalScript", find)

	LocalScript.Parent.MouseButton1Down:Connect(function()
		-- upvalues: LocalScript (ref)
		LocalScript.Parent.Parent.pos.Text = tostring(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position)
	end)
end)()
