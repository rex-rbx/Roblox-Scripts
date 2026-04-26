if AimLock and AimLock.Connection then
	AimLock.Connection:Disconnect()
end

if CamLock and CamLock.Connection then
	CamLock.Connection:Disconnect()
end

local u1 = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local _ = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local LocalPlayer2 = Players.LocalPlayer

workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
LocalPlayer2.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
LocalPlayer2.CameraMaxZoomDistance = math.huge
LocalPlayer2.CameraMinZoomDistance = 0.5
game:GetService("RunService").RenderStepped:Connect(function()
	-- upvalues: LocalPlayer2 (ref)
	LocalPlayer2.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
	LocalPlayer2.CameraMaxZoomDistance = math.huge
	LocalPlayer2.CameraMinZoomDistance = 0.5
end)

local LocalPlayer3 = game:GetService("Players").LocalPlayer

local function v11(p1)
	local Humanoid = p1:WaitForChild("Humanoid")

	Humanoid.HealthChanged:Connect(function(p2)
		-- upvalues: Humanoid (ref)
		if p2 <= 0 then
			Humanoid.Health = Humanoid.MaxHealth
		end
	end)
	game:GetService("RunService").Heartbeat:Connect(function()
		-- upvalues: p1 (ref)
		if p1.PrimaryPart and p1.PrimaryPart.Position.Y < -50 then
			p1:SetPrimaryPartCFrame(CFrame.new(0, 50, 0))
		end
	end)
end

LocalPlayer3.CharacterAdded:Connect(v11)

if LocalPlayer3.Character then
	v11(LocalPlayer3.Character)
end

local function v12(p3)
	local Humanoid = p3:WaitForChild("Humanoid")

	Humanoid.HealthChanged:Connect(function(p4)
		-- upvalues: Humanoid (ref)
		if p4 <= 0 then
			Humanoid.Health = Humanoid.MaxHealth
		end
	end)
	game:GetService("RunService").Heartbeat:Connect(function()
		-- upvalues: p3 (ref)
		if p3.PrimaryPart and p3.PrimaryPart.Position.Y < -50 then
			p3:SetPrimaryPartCFrame(CFrame.new(0, 50, 0))
		end
	end)
end

LocalPlayer2.CharacterAdded:Connect(v12)

if LocalPlayer2.Character then
	v12(LocalPlayer2.Character)
end

local u13 = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local v14 = u1:CreateWindow({
	Name = "EZ-Battle | Author: s0ulz :D",
	LoadingTitle = "W script?",
	LoadingSubtitle = "Ez-Battle | V2",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "EZBattle"
	},
	Discord = {
		Enabled = false
	}
})
local t1 = {
	Enabled = false,
	Size = 20,
	Connection = nil,
	Color = Color3.fromRGB(0, 170, 255),
	Transparency = 0.7
}
local t2 = {
	RobinStaff = false,
	StaffConnection = nil
}
local u17 = false
local n1 = 70
local connection = nil
local BodyGyro = nil
local BodyVelocity = nil
local s1 = "Robin"
local u23 = false
local t3 = {
	Enabled = false,
	Connection = nil
}
local t4 = {
	Enabled = false,
	Connection = nil,
	TargetYOffset = -5.5,
	ClickDelay = 0.1
}
local t5 = {
	Enabled = false,
	Connection = nil
}
local t6 = {
	Enabled = false,
	Target = nil,
	Connection = nil,
	MouseConnection = nil
}
local t7 = {
	Enabled = false,
	Target = nil,
	Connection = nil,
	MouseConnection = nil
}
local t8 = {
	Enabled = false,
	Drawings = {},
	BoxColor = Color3.fromRGB(255, 0, 0),
	TextColor = Color3.fromRGB(255, 255, 255)
}
local t9 = {
	Enabled = false,
	Drawings = {},
	Color = Color3.fromRGB(255, 0, 0),
	Thickness = 2
}
local t10 = {
	Enabled = false
}
local t11 = {
	Enabled = false
}
local t12 = {
	forward = false,
	backward = false,
	left = false,
	right = false,
	up = false,
	down = false
}

local function u34(p5, p6, p7)
	-- upvalues: u1 (ref)
	u1:Notify({
		Title = p5,
		Content = p6,
		Duration = p7 or 5,
		Image = "rbxassetid://4483345998"
	})
end
local function u35()
	-- upvalues: Workspace (ref), VirtualInputManager (ref)
	pcall(function()
		-- upvalues: Workspace (ref), VirtualInputManager (ref)
		local ViewportSize = Workspace.CurrentCamera.ViewportSize
		local v200 = ViewportSize.X / 2
		local v201 = ViewportSize.Y / 2

		VirtualInputManager:SendMouseButtonEvent(v200, v201, 0, true, game, 0)
		task.wait(0.01)
		VirtualInputManager:SendMouseButtonEvent(v200, v201, 0, false, game, 0)
	end)
end
local function u36()
	return {
		Robin = "001",
		Cyborg = "002",
		["Beast Boy"] = "003",
		Starfire = "004",
		Raven = "005"
	}
end
local function u37(p8)
	-- upvalues: u36 (ref), u34 (ref)
	local u184 = u36()[p8]

	if u184 then
		local ok, result = pcall(function()
			-- upvalues: u184 (ref)
			return game:GetService("ReplicatedStorage").Remotes.OnCharacterSelectTouchedRF:InvokeServer(u184)
		end)

		if not ok then
			u34("Character Error", "Failed to select " .. p8 .. ": " .. tostring(result), 6)

			return false
		end

		u34("Character Selection", "Character " .. p8 .. " (" .. u184 .. ") selected!", 5)

		return true
	end

	u34("Character Error", "Unknown character: " .. tostring(p8), 6)

	return false
end
local function u38()
	-- upvalues: u23 (ref), LocalPlayer (ref), u37 (ref), s1 (ref), u34 (ref)
	if u23 then
		task.wait(1)

		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and u37(s1) then
			u34("Auto-Select", "Auto-selected " .. s1, 5)
		end

		return
	end
end

LocalPlayer.CharacterAdded:Connect(function(character)
	-- upvalues: u38 (ref)
	character:WaitForChild("HumanoidRootPart", 5)
	u38()
end)

local function u39()
	-- upvalues: u17 (ref), LocalPlayer (ref), u34 (ref), BodyGyro (ref), BodyVelocity (ref), connection (ref), RunService (ref), Workspace (ref), UserInputService (ref), t12 (ref), n1 (ref)
	if not u17 then
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			u17 = true

			local HumanoidRootPart = LocalPlayer.Character.HumanoidRootPart
			local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

			if Humanoid then
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
			end

			BodyGyro = Instance.new("BodyGyro")
			BodyGyro.P = 90000
			BodyGyro.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
			BodyGyro.CFrame = HumanoidRootPart.CFrame
			BodyGyro.Parent = HumanoidRootPart
			BodyVelocity = Instance.new("BodyVelocity")
			BodyVelocity.Velocity = Vector3.zero
			BodyVelocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
			BodyVelocity.Parent = HumanoidRootPart
			connection = RunService.RenderStepped:Connect(function()
				-- upvalues: u17 (ref), LocalPlayer (ref), Workspace (ref), UserInputService (ref), t12 (ref), BodyVelocity (ref), n1 (ref), BodyGyro (ref)
				if u17 then
					if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
						local _ = LocalPlayer.Character.HumanoidRootPart
						local Humanoid2 = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

						if Humanoid2 and Humanoid2:GetState() ~= Enum.HumanoidStateType.Running and Humanoid2:GetState() ~= Enum.HumanoidStateType.RunningNoPhysics then
							Humanoid2:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
						end

						local CurrentCameraCFrame = Workspace.CurrentCamera.CFrame
						local zero = Vector3.zero

						if UserInputService:IsKeyDown(Enum.KeyCode.W) or t12.forward then
							zero = zero + CurrentCameraCFrame.LookVector
						end

						if UserInputService:IsKeyDown(Enum.KeyCode.S) or t12.backward then
							zero = zero - CurrentCameraCFrame.LookVector
						end

						if UserInputService:IsKeyDown(Enum.KeyCode.A) or t12.left then
							zero = zero - CurrentCameraCFrame.RightVector
						end

						if UserInputService:IsKeyDown(Enum.KeyCode.D) or t12.right then
							zero = zero + CurrentCameraCFrame.RightVector
						end

						if UserInputService:IsKeyDown(Enum.KeyCode.Space) or t12.up then
							zero = zero + Vector3.new(0, 1, 0)
						end

						if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or t12.down then
							zero = zero - Vector3.new(0, 1, 0)
						end

						if not (zero.Magnitude > 0) then
							BodyVelocity.Velocity = Vector3.zero
						else
							BodyVelocity.Velocity = zero.Unit * n1
						end

						BodyGyro.CFrame = CurrentCameraCFrame

						return
					end

					return
				end
			end)
			u34("Flight", "Flight Enabled – use WASD + Space/CTRL (Speed: " .. n1 .. ")", 5)

			return
		end

		u34("Flight", "Cannot enable flight (no HumanoidRootPart)", 5)

		return
	end
end
local function u40()
	-- upvalues: u17 (ref), LocalPlayer (ref), connection (ref), BodyGyro (ref), BodyVelocity (ref), u34 (ref)
	if u17 then
		u17 = false

		local v66 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

		if v66 then
			v66:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
			v66:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
			v66:ChangeState(Enum.HumanoidStateType.GettingUp)
		end

		if connection then
			connection:Disconnect()
			connection = nil
		end

		if BodyGyro then
			BodyGyro:Destroy()
			BodyGyro = nil
		end

		if BodyVelocity then
			BodyVelocity:Destroy()
			BodyVelocity = nil
		end

		u34("Flight", "Flight Disabled", 5)

		return
	end
end

local t13 = {}

local function u42()
	-- upvalues: t1 (ref), RunService (ref), Players (ref), LocalPlayer (ref), t13 (ref), u34 (ref)
	if t1.Connection then
		t1.Connection:Disconnect()
	end

	t1.Connection = RunService.Heartbeat:Connect(function()
		-- upvalues: t1 (ref), Players (ref), LocalPlayer (ref), t13 (ref)
		if t1.Enabled then
			for _, v in ipairs(Players:GetPlayers()) do
				if v ~= LocalPlayer then
					local Character = v.Character

					if Character then
						local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

						if HumanoidRootPart and not t13[HumanoidRootPart] then
							pcall(function()
								-- upvalues: HumanoidRootPart (ref), t1 (ref), t13 (ref)
								HumanoidRootPart.Size = Vector3.new(t1.Size, t1.Size, t1.Size)
								HumanoidRootPart.Transparency = t1.Transparency
								HumanoidRootPart.Color = t1.Color
								HumanoidRootPart.Material = Enum.Material.Neon
								HumanoidRootPart.CanCollide = false
								t13[HumanoidRootPart] = true
							end)
						end
					end
				end
			end

			return
		end
	end)
	u34("Hitbox", "Hitbox Expander Enabled (size " .. t1.Size .. ")", 5)
end
local function u43()
	-- upvalues: t1 (ref), Players (ref), LocalPlayer (ref), t13 (ref), u34 (ref)
	if t1.Connection then
		t1.Connection:Disconnect()
		t1.Connection = nil
	end

	for _, v in ipairs(Players:GetPlayers()) do
		if v ~= LocalPlayer then
			local Character = v.Character

			if Character then
				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart then
					pcall(function()
						-- upvalues: HumanoidRootPart (ref), t13 (ref)
						HumanoidRootPart.Size = Vector3.new(2, 2, 1)
						HumanoidRootPart.Transparency = 1
						HumanoidRootPart.CanCollide = false
						t13[HumanoidRootPart] = nil
					end)
				end
			end
		end
	end

	t13 = {}
	u34("Hitbox", "Hitbox Expander Disabled", 5)
end
local function u44()
	-- upvalues: t5 (ref), RunService (ref), LocalPlayer (ref), Players (ref), u35 (ref), u34 (ref)
	if not t5.Connection then
		t5.Connection = RunService.Heartbeat:Connect(function()
			-- upvalues: t5 (ref), LocalPlayer (ref), Players (ref), u35 (ref)
			if t5.Enabled then
				if LocalPlayer.Character then
					local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

					if HumanoidRootPart then
						for _, v in ipairs(Players:GetPlayers()) do
							if v ~= LocalPlayer and v.Character then
								local HumanoidRootPart2 = v.Character:FindFirstChild("HumanoidRootPart")
								local Humanoid = v.Character:FindFirstChildOfClass("Humanoid")

								if HumanoidRootPart2 and Humanoid and Humanoid.Health > 0 and (HumanoidRootPart2.Position - HumanoidRootPart.Position).Magnitude <= 20 then
									pcall(function()
										-- upvalues: u35 (ref)
										u35()
									end)
									task.wait(0.1)
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
		u34("Kill Aura", "Kill Aura ENABLED (20 stud range)", 5)

		return
	end
end
local function u45()
	-- upvalues: t5 (ref), u34 (ref)
	if t5.Connection then
		t5.Connection:Disconnect()
		t5.Connection = nil
	end

	u34("Kill Aura", "Kill Aura DISABLED", 5)
end
local function u46()
	-- upvalues: LocalPlayer (ref), Players (ref)
	local v71 = nil
	local huge = math.huge

	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		local HumanoidRootPartPosition = LocalPlayer.Character.HumanoidRootPart.Position

		for _, v in ipairs(Players:GetPlayers()) do
			if v ~= LocalPlayer and v.Character then
				local HumanoidRootPart = v.Character:FindFirstChild("HumanoidRootPart")
				local Humanoid = v.Character:FindFirstChildOfClass("Humanoid")

				if HumanoidRootPart and Humanoid and Humanoid.Health > 0 then
					local Magnitude = (HumanoidRootPart.Position - HumanoidRootPartPosition).Magnitude

					if Magnitude < huge then
						huge = Magnitude
						v71 = v
					end
				end
			end
		end

		return v71
	end

	return nil
end
local function u47()
	-- upvalues: t4 (ref), t1 (ref), u34 (ref), RunService (ref), LocalPlayer (ref), u46 (ref), u35 (ref)
	if not t4.Connection then
		if not t1.Enabled or t1.Size ~= 50 then
			u34("AutoFarm Warning", "Enable Hitbox Expander and set size to 50!", 6)
		end

		t4.Connection = RunService.Heartbeat:Connect(function()
			-- upvalues: t4 (ref), LocalPlayer (ref), u46 (ref), u35 (ref)
			if t4.Enabled then
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					local HumanoidRootPart = LocalPlayer.Character.HumanoidRootPart
					local v234 = u46()

					if v234 and v234.Character and v234.Character:FindFirstChild("HumanoidRootPart") then
						local HumanoidRootPart3 = v234.Character.HumanoidRootPart
						local Humanoid = v234.Character:FindFirstChildOfClass("Humanoid")

						if Humanoid and Humanoid.Health > 0 then
							local HumanoidRootPart3Position = HumanoidRootPart3.Position

							HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart3Position.X, -5 + t4.TargetYOffset, HumanoidRootPart3Position.Z)
							u35()
							task.wait(t4.ClickDelay)
						end
					end

					return
				end

				return
			end
		end)
		u34("AutoFarm", "AutoFarm ENABLED (Y-offset: " .. t4.TargetYOffset .. ", Click Delay: " .. t4.ClickDelay .. "s)", 6)

		return
	end
end
local function u48()
	-- upvalues: t4 (ref), u34 (ref)
	if t4.Connection then
		t4.Connection:Disconnect()
		t4.Connection = nil
	end

	u34("AutoFarm", "AutoFarm DISABLED", 5)
end
local function u49(p9)
	-- upvalues: t8 (ref)
	if not t8.Drawings[p9] then
		local t14 = {
			Name = Drawing.new("Text"),
			Box = Drawing.new("Square"),
			HealthBar = Drawing.new("Line"),
			HealthBarOutline = Drawing.new("Line")
		}

		t14.Name.Size = 18
		t14.Name.Center = true
		t14.Name.Outline = true
		t14.Name.Color = t8.TextColor
		t14.Box.Thickness = 2
		t14.Box.Filled = false
		t14.Box.Color = t8.BoxColor
		t14.HealthBar.Thickness = 3
		t14.HealthBar.Color = Color3.fromRGB(0, 255, 0)
		t14.HealthBarOutline.Thickness = 4
		t14.HealthBarOutline.Color = Color3.fromRGB(0, 0, 0)
		t8.Drawings[p9] = t14

		return
	end
end
local function u50(p10)
	-- upvalues: t8 (ref)
	if t8.Drawings[p10] then
		for _, v in pairs(t8.Drawings[p10]) do
			v:Remove()
		end

		t8.Drawings[p10] = nil
	end
end
local function u51()
	-- upvalues: t8 (ref), Workspace (ref), Players (ref), LocalPlayer (ref), u49 (ref), u50 (ref)
	if t8.Enabled then
		local CurrentCamera = Workspace.CurrentCamera

		for _, v in ipairs(Players:GetPlayers()) do
			if v ~= LocalPlayer and v.Character then
				local Character = v.Character
				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
				local Head = Character:FindFirstChild("Head")
				local Humanoid = Character:FindFirstChildOfClass("Humanoid")

				if not HumanoidRootPart or not Head or not Humanoid or not (Humanoid.Health > 0) then
					u50(v)
				else
					local v124, v125 = CurrentCamera:WorldToViewportPoint(HumanoidRootPart.Position)

					if not t8.Drawings[v] then
						u49(v)
					end

					local v126 = t8.Drawings[v]

					if not v125 or not (v124.Z > 0) then
						for _, v2 in pairs(v126) do
							v2.Visible = false
						end
					else
						local v129 = CurrentCamera:WorldToViewportPoint(Head.Position + Vector3.new(0, 0.5, 0))
						local v130 = CurrentCamera:WorldToViewportPoint(HumanoidRootPart.Position - Vector3.new(0, 3, 0))
						local v131 = math.abs(v129.Y - v130.Y)
						local v132 = v131 / 2

						v126.Box.Size = Vector2.new(v132, v131)
						v126.Box.Position = Vector2.new(v124.X - v132 / 2, v124.Y - v131 / 2)
						v126.Box.Color = t8.BoxColor
						v126.Box.Visible = true
						v126.Name.Text = v.Name .. " [" .. math.floor(Humanoid.Health) .. "]"
						v126.Name.Position = Vector2.new(v124.X, v129.Y - 20)
						v126.Name.Color = t8.TextColor
						v126.Name.Visible = true

						local v133 = Humanoid.Health / Humanoid.MaxHealth

						v126.HealthBar.Color = Color3.fromRGB(255 * (1 - v133), 255 * v133, 0)

						local v134 = v124.X - v132 / 2 - 6
						local v135 = v124.Y - v131 / 2

						v126.HealthBarOutline.From = Vector2.new(v134, v135)
						v126.HealthBarOutline.To = Vector2.new(v134, v135 + v131)
						v126.HealthBarOutline.Visible = true
						v126.HealthBar.From = Vector2.new(v134, v135)
						v126.HealthBar.To = Vector2.new(v134, v135 + v131 * v133)
						v126.HealthBar.Visible = true
					end
				end
			end
		end

		return
	end
end
local function u52(p11)
	-- upvalues: t9 (ref)
	if not t9.Drawings[p11] then
		local drawing = Drawing.new("Line")

		drawing.Thickness = t9.Thickness
		drawing.Color = t9.Color
		t9.Drawings[p11] = drawing

		return
	end
end
local function u53(p12)
	-- upvalues: t9 (ref)
	if t9.Drawings[p12] then
		t9.Drawings[p12]:Remove()
		t9.Drawings[p12] = nil
	end
end
local function u54()
	-- upvalues: t9 (ref), Workspace (ref), Players (ref), LocalPlayer (ref), u52 (ref), u53 (ref)
	if t9.Enabled then
		local CurrentCamera = Workspace.CurrentCamera
		local ViewportSize = CurrentCamera.ViewportSize
		local vector2 = Vector2.new(ViewportSize.X / 2, ViewportSize.Y)

		for _, v in ipairs(Players:GetPlayers()) do
			if v ~= LocalPlayer and v.Character then
				local Character = v.Character
				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
				local Humanoid = Character:FindFirstChildOfClass("Humanoid")

				if not HumanoidRootPart or not Humanoid or not (Humanoid.Health > 0) then
					u53(v)
				else
					local v108, v109 = CurrentCamera:WorldToViewportPoint(HumanoidRootPart.Position)

					if not t9.Drawings[v] then
						u52(v)
					end

					local v110 = t9.Drawings[v]

					if not v109 or not (v108.Z > 0) then
						v110.Visible = false
					else
						v110.From = vector2
						v110.To = Vector2.new(v108.X, v108.Y)
						v110.Color = t9.Color
						v110.Thickness = t9.Thickness
						v110.Visible = true
					end
				end
			end
		end

		return
	end
end

RunService.RenderStepped:Connect(function()
	-- upvalues: t8 (ref), u51 (ref), u50 (ref), t9 (ref), u54 (ref), u53 (ref)
	if not t8.Enabled then
		for k, _ in pairs(t8.Drawings) do
			u50(k)
		end
	else
		u51()
	end

	if not t9.Enabled then
		for k, _ in pairs(t9.Drawings) do
			u53(k)
		end
	else
		u54()
	end
end)
Players.PlayerRemoving:Connect(function(player)
	-- upvalues: u50 (ref), u53 (ref)
	u50(player)
	u53(player)
end)

local function u55()
	-- upvalues: LocalPlayer (ref), Players (ref)
	local Target = LocalPlayer:GetMouse().Target

	if Target then
		local Model = Target:FindFirstAncestorOfClass("Model")

		if Model then
			local player = Players:GetPlayerFromCharacter(Model)

			if player and player ~= LocalPlayer then
				return player
			end
		end
	end

	return nil
end
local function u56()
	-- upvalues: t6 (ref), u13 (ref), UserInputService (ref), u55 (ref), u34 (ref), LocalPlayer (ref), RunService (ref), Workspace (ref)
	if not t6.Connection then
		if not u13 then
			t6.MouseConnection = LocalPlayer:GetMouse().Button1Down:Connect(function()
				-- upvalues: t6 (ref), u55 (ref), u34 (ref)
				if t6.Enabled then
					local v191 = u55()

					if v191 then
						t6.Target = v191
						u34("Camera Lock", "Locked onto " .. v191.Name, 3)
					end
				end
			end)
		else
			UserInputService.TouchTap:Connect(function(_, p14)
				-- upvalues: t6 (ref), u55 (ref), u34 (ref)
				if t6.Enabled and not p14 then
					local v194 = u55()

					if v194 then
						t6.Target = v194
						u34("Camera Lock", "Locked onto " .. v194.Name, 3)
					end
				end
			end)
		end

		t6.Connection = RunService.RenderStepped:Connect(function()
			-- upvalues: t6 (ref), u34 (ref), Workspace (ref)
			if t6.Enabled then
				if t6.Target then
					local Character = t6.Target.Character

					if not Character or not Character:FindFirstChild("HumanoidRootPart") then
						t6.Target = nil
					else
						local Humanoid = Character:FindFirstChildOfClass("Humanoid")

						if not Humanoid or Humanoid.Health <= 0 then
							t6.Target = nil
							u34("Camera Lock", "Target died - lock released", 3)

							return
						end

						local HumanoidRootPartPosition = Character.HumanoidRootPart.Position
						local CurrentCamera = Workspace.CurrentCamera

						CurrentCamera.CFrame = CFrame.new(CurrentCamera.CFrame.Position, HumanoidRootPartPosition)
					end

					return
				end

				return
			end
		end)
		u34("Camera Lock", "Camera Lock ENABLED - Click/Tap on a player to lock", 5)

		return
	end
end
local function u57()
	-- upvalues: t6 (ref), u34 (ref)
	t6.Enabled = false
	t6.Target = nil

	if t6.Connection then
		t6.Connection:Disconnect()
		t6.Connection = nil
	end

	if t6.MouseConnection then
		t6.MouseConnection:Disconnect()
		t6.MouseConnection = nil
	end

	u34("Camera Lock", "Camera Lock DISABLED", 5)
end
local function u58()
	-- upvalues: u34 (ref)
	local v165 = getrawmetatable(game)
	local __namecall = v165.__namecall

	setreadonly(v165, false)
	v165.__namecall = newcclosure(function(p15, ...)
		-- upvalues: u34 (ref), __namecall (ref)
		local v230 = getnamecallmethod()

		if v230 ~= "Kick" and v230 ~= "kick" then
			if v230 == "FireServer" or v230 == "InvokeServer" then
				local v231 = tostring(p15):lower()

				if v231:find("kick") or v231:find("ban") or v231:find("idle") or v231:find("afk") then
					u34("Anti-Kick", "Blocked anti-idle remote!", 3)

					return
				end
			end

			return __namecall(p15, ...)
		end

		u34("Anti-Kick", "Blocked kick attempt!", 5)
	end)
	setreadonly(v165, true)
	u34("Anti-Kick", "Anti-Kick ENABLED - All kick attempts will be blocked", 5)
end
local function u59()
	-- upvalues: u34 (ref)
	setfpscap(999)
	u34("FPS Unlock", "FPS Unlocked (cap set to 999)", 5)
end
local function u60()
	-- upvalues: u34 (ref)
	setfpscap(60)
	u34("FPS Unlock", "FPS Locked (cap set to 60)", 5)
end

if u13 then
	task.spawn(function()
		-- upvalues: t12 (ref), RunService (ref), u17 (ref), LocalPlayer (ref)
		local ScreenGui = Instance.new("ScreenGui")

		ScreenGui.Name = "MobileFlightControls"
		ScreenGui.ResetOnSpawn = false
		ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		local function v146(p16, p17, p18)
			-- upvalues: ScreenGui (ref)
			local TextButton = Instance.new("TextButton")

			TextButton.Name = p16
			TextButton.Size = UDim2.new(0, 60, 0, 60)
			TextButton.Position = p17
			TextButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			TextButton.BackgroundTransparency = 0.3
			TextButton.BorderSizePixel = 2
			TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.Text = p18
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 24
			TextButton.Font = Enum.Font.SourceSansBold
			TextButton.Parent = ScreenGui

			local UICorner = Instance.new("UICorner")

			UICorner.CornerRadius = UDim.new(0, 8)
			UICorner.Parent = TextButton

			return TextButton
		end

		local v147 = v146("Forward", UDim2.new(0, 80, 1, -200), "\239\191\189\239\191\189")
		local v148 = v146("Backward", UDim2.new(0, 80, 1, -130), "\239\191\189\239\191\189")
		local v149 = v146("Left", UDim2.new(0, 10, 1, -165), "\239\191\189\239\191\189")
		local v150 = v146("Right", UDim2.new(0, 150, 1, -165), "\239\191\189\239\191\189")
		local v151 = v146("Up", UDim2.new(1, -150, 1, -200), "\239\191\189\239\191\189")
		local v152 = v146("Down", UDim2.new(1, -150, 1, -130), "\239\191\189\239\191\189")

		local function v153(p19, p20)
			-- upvalues: t12 (ref)
			p19.TouchTapInRange:Connect(function()
				-- upvalues: t12 (ref), p20 (ref)
				t12[p20] = true
			end)
			p19.InputBegan:Connect(function(input)
				-- upvalues: t12 (ref), p20 (ref), p19 (ref)
				if input.UserInputType == Enum.UserInputType.Touch then
					t12[p20] = true
					p19.BackgroundTransparency = 0.1
				end
			end)
			p19.InputEnded:Connect(function(input)
				-- upvalues: t12 (ref), p20 (ref), p19 (ref)
				if input.UserInputType == Enum.UserInputType.Touch then
					t12[p20] = false
					p19.BackgroundTransparency = 0.3
				end
			end)
		end

		v153(v147, "forward")
		v153(v148, "backward")
		v153(v149, "left")
		v153(v150, "right")
		v153(v151, "up")
		v153(v152, "down")
		ScreenGui.Enabled = false
		RunService.Heartbeat:Connect(function()
			-- upvalues: ScreenGui (ref), u17 (ref)
			ScreenGui.Enabled = u17
		end)
		ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
	end)
end

local v61 = v14:CreateTab("Movement", 4483345998)

v61:CreateToggle({
	Name = "Enable Flight",
	CurrentValue = false,
	Flag = "Flight",
	Callback = function(p21)
		-- upvalues: u39 (ref), u40 (ref)
		if not p21 then
			u40()
		else
			u39()
		end
	end
})
v61:CreateSlider({
	Name = "Flight Speed",
	Range = {
		10,
		300
	},
	Increment = 5,
	CurrentValue = 70,
	Flag = "FlightSpeed",
	Callback = function(p22)
		-- upvalues: n1 (ref), u17 (ref), u34 (ref)
		n1 = p22

		if u17 then
			u34("Flight", "Flight speed updated to " .. p22, 3)
		end
	end
})
v61:CreateSlider({
	Name = "WalkSpeed",
	Range = {
		16,
		200
	},
	Increment = 1,
	CurrentValue = 16,
	Flag = "WalkSpeed",
	Callback = function(p23)
		-- upvalues: LocalPlayer (ref)
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
			LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = p23
		end
	end
})
v61:CreateSlider({
	Name = "JumpPower",
	Range = {
		50,
		300
	},
	Increment = 5,
	CurrentValue = 50,
	Flag = "JumpPower",
	Callback = function(p24)
		-- upvalues: LocalPlayer (ref)
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
			LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = p24
		end
	end
})

local v62 = v14:CreateTab("Combat", 4483345998)

v62:CreateToggle({
	Name = "Enable Hitbox Expander",
	CurrentValue = false,
	Flag = "HitboxEnabled",
	Callback = function(p25)
		-- upvalues: t1 (ref), u42 (ref), u43 (ref)
		t1.Enabled = p25

		if not p25 then
			u43()
		else
			u42()
		end
	end
})
v62:CreateSlider({
	Name = "Hitbox Size",
	Range = {
		5,
		100
	},
	Increment = 1,
	CurrentValue = 20,
	Flag = "HitboxSize",
	Callback = function(p26)
		-- upvalues: t1 (ref), t13 (ref)
		t1.Size = p26
		t13 = {}
	end
})
v62:CreateColorPicker({
	Name = "Hitbox Color",
	Color = Color3.fromRGB(0, 170, 255),
	Flag = "HitboxColor",
	Callback = function(p27)
		-- upvalues: t1 (ref), t13 (ref)
		t1.Color = p27
		t13 = {}
	end
})
v62:CreateSlider({
	Name = "Hitbox Transparency",
	Range = {
		0,
		1
	},
	Increment = 0.1,
	CurrentValue = 0.7,
	Flag = "HitboxTransparency",
	Callback = function(p28)
		-- upvalues: t1 (ref), t13 (ref)
		t1.Transparency = p28
		t13 = {}
	end
})
v62:CreateToggle({
	Name = "Kill Aura (20 stud range)",
	CurrentValue = false,
	Flag = "KillAuraEnabled",
	Callback = function(p29)
		-- upvalues: t5 (ref), u44 (ref), u45 (ref)
		t5.Enabled = p29

		if not p29 then
			u45()
		else
			u44()
		end
	end
})
v62:CreateToggle({
	Name = "AutoFarm (Requires Hitbox 50!)",
	CurrentValue = false,
	Flag = "AutoFarmEnabled",
	Callback = function(p30)
		-- upvalues: t4 (ref), u47 (ref), u48 (ref)
		t4.Enabled = p30

		if not p30 then
			u48()
		else
			u47()
		end
	end
})
v62:CreateSlider({
	Name = "AutoFarm Click Delay (seconds)",
	Range = {
		0.05,
		1
	},
	Increment = 0.05,
	CurrentValue = 0.1,
	Flag = "AutoFarmClickDelay",
	Callback = function(p31)
		-- upvalues: t4 (ref), u34 (ref)
		t4.ClickDelay = p31
		u34("AutoFarm", "Click delay set to " .. p31 .. "s", 3)
	end
})
v62:CreateParagraph({
	Title = "AutoFarm Info",
	Content = "IMPORTANT: Enable Hitbox Expander and set size to 50 for AutoFarm to work properly! It will teleport you under the closest player (Y-offset: -9) and auto-click using VIRTUAL INPUT (no actual clicking required). Adjust click delay for best results."
})
v14:CreateTab("Cooldown", 4483345998):CreateParagraph({
	Title = "Features In Development",
	Content = "New features and improvements coming soon! Stay tuned for updates."
})

local v63 = v14:CreateTab("Aim", 4483345998)

v63:CreateSection("ESP Settings")
v63:CreateToggle({
	Name = "Enable ESP",
	CurrentValue = false,
	Flag = "ESPEnabled",
	Callback = function(p32)
		-- upvalues: t8 (ref), u34 (ref)
		t8.Enabled = p32

		if not p32 then
			u34("ESP", "ESP Disabled", 5)
		else
			u34("ESP", "ESP Enabled - Name, Box, Health", 5)
		end
	end
})
v63:CreateColorPicker({
	Name = "ESP Box Color",
	Color = Color3.fromRGB(255, 0, 0),
	Flag = "ESPBoxColor",
	Callback = function(p33)
		-- upvalues: t8 (ref), u34 (ref)
		t8.BoxColor = p33
		u34("ESP", "Box color updated", 3)
	end
})
v63:CreateColorPicker({
	Name = "ESP Text Color",
	Color = Color3.fromRGB(255, 255, 255),
	Flag = "ESPTextColor",
	Callback = function(p34)
		-- upvalues: t8 (ref), u34 (ref)
		t8.TextColor = p34
		u34("ESP", "Text color updated", 3)
	end
})
v63:CreateSection("Tracer Settings")
v63:CreateToggle({
	Name = "Enable Tracers",
	CurrentValue = false,
	Flag = "TracersEnabled",
	Callback = function(p35)
		-- upvalues: t9 (ref), u34 (ref)
		t9.Enabled = p35

		if not p35 then
			u34("Tracers", "Tracers Disabled", 5)
		else
			u34("Tracers", "Tracers Enabled", 5)
		end
	end
})
v63:CreateColorPicker({
	Name = "Tracer Color",
	Color = Color3.fromRGB(255, 0, 0),
	Flag = "TracerColor",
	Callback = function(p36)
		-- upvalues: t9 (ref), u34 (ref)
		t9.Color = p36
		u34("Tracers", "Tracer color updated", 3)
	end
})
v63:CreateSlider({
	Name = "Tracer Thickness",
	Range = {
		1,
		10
	},
	Increment = 1,
	CurrentValue = 2,
	Flag = "TracerThickness",
	Callback = function(p37)
		-- upvalues: t9 (ref), u34 (ref)
		t9.Thickness = p37
		u34("Tracers", "Tracer thickness updated to " .. p37, 3)
	end
})
v63:CreateSection("Camera Lock")
v63:CreateToggle({
	Name = "Aim-Lock (Click Player)",
	CurrentValue = false,
	Flag = "CamLockEnabled",
	Callback = function(p38)
		-- upvalues: t6 (ref), u56 (ref), u57 (ref)
		t6.Enabled = p38

		if not p38 then
			u57()
		else
			u56()
		end
	end
})
v63:CreateButton({
	Name = "Release Aim-Lock",
	Callback = function()
		-- upvalues: t6 (ref), u34 (ref)
		t6.Target = nil
		u34("Aim-Lock", "Lock released", 3)
	end
})
v63:CreateParagraph({
	Title = "Aim Features Info",
	Content = "ESP: Shows player names, boxes, and health bars\nTracers: Lines from screen center to players\nCamera Lock: Click a player to lock camera\n"
})

local v64 = v14:CreateTab("Character", 4483345998)

v64:CreateDropdown({
	Name = "Choose Character",
	Options = {
		"Robin",
		"Cyborg",
		"Beast Boy",
		"Starfire",
		"Raven"
	},
	CurrentOption = "Robin",
	Flag = "CharacterSelect",
	Callback = function(p39)
		-- upvalues: s1 (ref)
		pcall(function()
			-- upvalues: s1 (ref), p39 (ref)
			s1 = p39
		end)
	end
})
v64:CreateButton({
	Name = "Play as Character",
	Callback = function()
		-- upvalues: u37 (ref), s1 (ref)
		pcall(function()
			-- upvalues: u37 (ref), s1 (ref)
			u37(s1)
		end)
	end
})
v64:CreateToggle({
	Name = "Auto-Select on Respawn",
	CurrentValue = false,
	Flag = "AutoSelectToggle",
	Callback = function(p40)
		-- upvalues: u23 (ref), u34 (ref)
		u23 = p40
		u34("Auto-Select", p40 and "Enabled auto-select on respawn" or "Disabled auto-select", 5)
	end
})

local v65 = v14:CreateTab("Settings", 4483345998)

v65:CreateSection("Protection")
v65:CreateToggle({
	Name = "Anti-Kick",
	CurrentValue = false,
	Flag = "AntiKickEnabled",
	Callback = function(p41)
		-- upvalues: t10 (ref), u58 (ref), u34 (ref)
		t10.Enabled = p41

		if not p41 then
			u34("Anti-Kick", "Anti-Kick disabled (restart script to re-enable)", 5)
		else
			u58()
		end
	end
})
v65:CreateSection("Performance")
v65:CreateToggle({
	Name = "Unlock FPS",
	CurrentValue = false,
	Flag = "UnlockFPSEnabled",
	Callback = function(p42)
		-- upvalues: t11 (ref), u59 (ref), u60 (ref)
		t11.Enabled = p42

		if not p42 then
			u60()
		else
			u59()
		end
	end
})
v65:CreateParagraph({
	Title = "Settings Info",
	Content = "Anti-Kick: Blocks all kick attempts and anti-idle remotes\nUnlock FPS: Removes FPS cap (set to 999)\n"
})
Players.PlayerRemoving:Connect(function(player)
	-- upvalues: LocalPlayer (ref), t1 (ref), t3 (ref), t2 (ref), t4 (ref), t5 (ref), t7 (ref), t6 (ref)
	if player == LocalPlayer then
		if t1.Connection then
			t1.Connection:Disconnect()
		end

		if t3.Connection then
			t3.Connection:Disconnect()
		end

		if t2.StaffConnection then
			t2.StaffConnection:Disconnect()
		end

		if t4.Connection then
			t4.Connection:Disconnect()
		end

		if t5.Connection then
			t5.Connection:Disconnect()
		end

		if t7.Connection then
			t7.Connection:Disconnect()
		end

		if t7.MouseConnection then
			t7.MouseConnection:Disconnect()
		end

		if t6.Connection then
			t6.Connection:Disconnect()
		end

		if t6.MouseConnection then
			t6.MouseConnection:Disconnect()
		end
	end
end)
--print("Your welcome amigo :D")
-- ^ was removed due to logservice detection reasons
