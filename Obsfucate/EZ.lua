repeat
	task.wait()
until game:IsLoaded()

local ok, result = pcall(function()
	local v519 = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

	if type(v519) ~= "table" or type(v519.SetTheme) ~= "function" then
		return v519
	end

	return v519
end)

if ok then
	if type(result) ~= "table" or type(result.SetTheme) ~= "function" then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "WindUI Error",
			Text = "Invalid UI format: " .. type(result),
			Duration = 6
		})

		return
	end

	local u3 = result
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local CurrentCamera = workspace.CurrentCamera
	local TweenService = game:GetService("TweenService")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local CoreGui = game:GetService("CoreGui")

	u3:SetTheme("Dark")

	local function u12()
		local s1 = "Unknown"
		local v367 = false

		if not identifyexecutor then
			if not getexecutorname then
				if not syn or not syn.get_thread_identity then
					if not KRNL_LOADED then
						if not getgenv().WRD_LOADED then
							if not getgenv().EVON_LOADED then
								if not getgenv().FLUXUS_LOADED then
									if not getgenv().SCRIPTWARE then
										if not PROTOSMASHER_LOADED then
											if not pebc_execute then
												if not getgenv().IS_VEGA_LOADED then
													if not getgenv().JJSploit then
														if not getgenv().OXYGEN_LOADED then
															if not Delta or not Delta.Request then
																if not getgenv().COMET_LOADED then
																	if not getgenv().COCO_LOADED then
																		if not getgenv().Kitten then
																			if arceus then
																				s1 = "Arceus X"
																			end
																		else
																			s1 = "Kitten"
																		end
																	else
																		s1 = "Coco Z"
																	end
																else
																	s1 = "Comet"
																end
															else
																s1 = "Delta"
															end
														else
															s1 = "Oxygen U"
														end
													else
														s1 = "JJSploit"
													end
												else
													s1 = "Vega X"
												end
											else
												s1 = "Panda"
											end
										else
											s1 = "ProtoSmasher"
										end
									else
										s1 = "Script-Ware"
									end
								else
									s1 = "Fluxus"
								end
							else
								s1 = "Evon"
							end
						else
							s1 = "WeAreDevs"
						end
					else
						s1 = "KRNL"
					end
				else
					s1 = "Synapse X"
				end
			else
				s1 = getexecutorname()
			end
		else
			s1 = identifyexecutor()
		end

		for _, v in ipairs({
			"Zenith",
			"Wave",
			"Volcano",
			"Velocity",
			"Bunni",
			"Swift",
			"Hydrogen",
			"Solara"
		}) do
			if string.find(string.lower(s1), string.lower(v)) then
				v367 = true

				return s1, v367
			end
		end

		return s1, v367
	end

	local u13, u14 = (function()
		-- upvalues: u12 (ref), CoreGui (ref), TweenService (ref)
		local v218, v219 = u12()
		local ScreenGui = Instance.new("ScreenGui")

		ScreenGui.Name = "ExecutorDetectionUI"
		ScreenGui.Parent = CoreGui
		ScreenGui.DisplayOrder = 999999

		local Frame = Instance.new("Frame")

		Frame.Name = "DetectionFrame"
		Frame.Size = UDim2.new(0, 600, 0, 200)
		Frame.Position = UDim2.new(0.5, -300, 0.5, -100)
		Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		Frame.BorderSizePixel = 0
		Frame.Parent = ScreenGui

		local UICorner = Instance.new("UICorner")

		UICorner.CornerRadius = UDim.new(0, 12)
		UICorner.Parent = Frame

		local UIStroke = Instance.new("UIStroke")

		UIStroke.Thickness = 2
		UIStroke.Color = v219 and Color3.new(0.2, 0.8, 0.2) or Color3.new(0.8, 0.6, 0.2)
		UIStroke.Parent = Frame

		local TextLabel = Instance.new("TextLabel")

		TextLabel.Name = "Icon"
		TextLabel.Size = UDim2.new(0, 50, 0, 50)
		TextLabel.Position = UDim2.new(0, 30, 0.5, -25)
		TextLabel.BackgroundTransparency = 1
		TextLabel.Text = v219 and "\239\191\189\239\191\189" or "\239\191\189\239\191\189\239\184\143"
		TextLabel.TextColor3 = Color3.new(1, 1, 1)
		TextLabel.TextScaled = true
		TextLabel.Font = Enum.Font.SourceSansBold
		TextLabel.Parent = Frame

		local TextLabel2 = Instance.new("TextLabel")

		TextLabel2.Name = "Title"
		TextLabel2.Size = UDim2.new(0, 500, 0, 40)
		TextLabel2.Position = UDim2.new(0, 90, 0, 30)
		TextLabel2.BackgroundTransparency = 1
		TextLabel2.Text = v219 and "SUPPORTED EXECUTOR DETECTED" or "UNSUPPORTED EXECUTOR"
		TextLabel2.TextColor3 = v219 and Color3.new(0.2, 0.8, 0.2) or Color3.new(0.8, 0.6, 0.2)
		TextLabel2.TextScaled = true
		TextLabel2.Font = Enum.Font.SourceSansBold
		TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel2.Parent = Frame

		local TextLabel3 = Instance.new("TextLabel")

		TextLabel3.Name = "ExecutorLabel"
		TextLabel3.Size = UDim2.new(0, 500, 0, 30)
		TextLabel3.Position = UDim2.new(0, 90, 0, 80)
		TextLabel3.BackgroundTransparency = 1
		TextLabel3.Text = v218
		TextLabel3.TextColor3 = Color3.new(0.9, 0.9, 0.9)
		TextLabel3.TextScaled = true
		TextLabel3.Font = Enum.Font.SourceSans
		TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel3.Parent = Frame

		local TextLabel4 = Instance.new("TextLabel")

		TextLabel4.Name = "StatusLabel"
		TextLabel4.Size = UDim2.new(0, 500, 0, 25)
		TextLabel4.Position = UDim2.new(0, 90, 0, 120)
		TextLabel4.BackgroundTransparency = 1
		TextLabel4.Text = v219 and "FEATURES ARE COMPATIBLE" or "FEATURES MAY BE MORE BUGGY"
		TextLabel4.TextColor3 = Color3.new(0.7, 0.7, 0.7)
		TextLabel4.TextScaled = true
		TextLabel4.Font = Enum.Font.SourceSans
		TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel4.Parent = Frame
		Frame.BackgroundTransparency = 1
		UIStroke.Transparency = 1

		for _, v in ipairs(Frame:GetChildren()) do
			if v:IsA("TextLabel") then
				v.TextTransparency = 1
			end
		end

		local v230 = TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
			BackgroundTransparency = 0.1
		})
		local v231 = TweenService:Create(UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
			Transparency = 0
		})

		v230:Play()
		v231:Play()

		for _, v in ipairs(Frame:GetChildren()) do
			if v:IsA("TextLabel") then
				TweenService:Create(v, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
					TextTransparency = 0
				}):Play()
			end
		end

		task.spawn(function()
			-- upvalues: TweenService (ref), Frame (ref), UIStroke (ref), ScreenGui (ref)
			task.wait(7.5)

			local v552 = TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
				BackgroundTransparency = 1
			})
			local v553 = TweenService:Create(UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
				Transparency = 1
			})

			v552:Play()
			v553:Play()

			for _, v in ipairs(Frame:GetChildren()) do
				if v:IsA("TextLabel") then
					TweenService:Create(v, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
						TextTransparency = 1
					}):Play()
				end
			end

			task.wait(0.5)
			ScreenGui:Destroy()
		end)

		return v218, v219
	end)()
	local u15 = os.date("%Y-%m-%d %H:%M:%S")
	local t5 = {
		sessionLog = {},
		showDebugOverlay = false,
		logToConsole = false,
		saveSessionLog = false,
		debugVerbosity = "Medium",
		maxLogEntries = 1000,
		overlay = nil,
		telemetryData = {},
		lastFPSUpdate = 0,
		currentFPS = 0,
		frameTime = 0,
		cpuLoad = 0,
		samplingRate = 0.2,
		Log = function(p1, p2, p3, p4)
			local v429 = os.date("%H:%M:%S")
			local t1 = {
				timestamp = v429,
				level = p2,
				message = p3,
				category = p4 or "General",
				tick = tick()
			}

			table.insert(p1.sessionLog, t1)

			if #p1.sessionLog > p1.maxLogEntries then
				table.remove(p1.sessionLog, 1)
			end

			if p1.logToConsole then
				print(string.format("[%s] [%s] %s: %s", v429, p2, p4, p3))
			end

			if p1.showDebugOverlay then
				p1:UpdateOverlay()
			end
		end,
		UpdatePerformanceMetrics = function(p5, p6)
			local timestamp = tick()

			if timestamp - p5.lastFPSUpdate >= p5.samplingRate then
				if not (p6 > 0) then
					p5.currentFPS = 60
					p5.frameTime = 16.67
				else
					p5.currentFPS = math.floor(1 / p6)
					p5.frameTime = math.floor(p6 * 1000 * 100) / 100
				end

				local v298 = p6 / 0.016666666666666666

				p5.cpuLoad = math.min(100, math.floor(v298 * 50))

				local timestamp2 = tick()

				for _ = 1, 100 do
					math.sin(math.random() * math.pi)
				end

				local v301 = (tick() - timestamp2) * 1000
				local v302 = math.min(100, math.floor(v301 * 200))

				p5.cpuLoad = math.max(p5.cpuLoad, v302)
				p5.lastFPSUpdate = timestamp
			end
		end,
		CreateDebugOverlay = function(p7)
			-- upvalues: CoreGui (ref)
			if p7.overlay then
				p7.overlay:Destroy()
			end

			local ScreenGui = Instance.new("ScreenGui")

			ScreenGui.Name = "DiagnosticsOverlay"
			ScreenGui.Parent = CoreGui
			ScreenGui.DisplayOrder = 999998

			local Frame = Instance.new("Frame")

			Frame.Name = "OverlayFrame"
			Frame.Size = UDim2.new(0, 400, 0, 300)
			Frame.Position = UDim2.new(0, 12, 0, 12)
			Frame.BackgroundColor3 = Color3.new(0, 0, 0)
			Frame.BackgroundTransparency = 0.2
			Frame.BorderSizePixel = 0
			Frame.Parent = ScreenGui

			local UICorner = Instance.new("UICorner")

			UICorner.CornerRadius = UDim.new(0, 8)
			UICorner.Parent = Frame

			local TextButton = Instance.new("TextButton")

			TextButton.Name = "CloseButton"
			TextButton.Size = UDim2.new(0, 20, 0, 20)
			TextButton.Position = UDim2.new(1, -25, 0, 5)
			TextButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
			TextButton.Text = "\239\191\189"
			TextButton.TextColor3 = Color3.new(1, 1, 1)
			TextButton.TextScaled = true
			TextButton.Font = Enum.Font.SourceSansBold
			TextButton.Parent = Frame

			local UICorner2 = Instance.new("UICorner")

			UICorner2.CornerRadius = UDim.new(0, 4)
			UICorner2.Parent = TextButton
			TextButton.MouseButton1Click:Connect(function()
				-- upvalues: p7 (ref)
				p7.showDebugOverlay = false
				p7:DestroyOverlay()
			end)

			local TextLabel = Instance.new("TextLabel")

			TextLabel.Name = "ContentLabel"
			TextLabel.Size = UDim2.new(1, -12, 1, -30)
			TextLabel.Position = UDim2.new(0, 6, 0, 6)
			TextLabel.BackgroundTransparency = 1
			TextLabel.Text = ""
			TextLabel.TextColor3 = Color3.new(0.9, 0.9, 0.9)
			TextLabel.TextSize = 12
			TextLabel.Font = Enum.Font.RobotoMono
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel.TextYAlignment = Enum.TextYAlignment.Top
			TextLabel.Parent = Frame

			local TextLabel5 = Instance.new("TextLabel")

			TextLabel5.Name = "HotkeyLabel"
			TextLabel5.Size = UDim2.new(1, -12, 0, 15)
			TextLabel5.Position = UDim2.new(0, 6, 1, -20)
			TextLabel5.BackgroundTransparency = 1
			TextLabel5.Text = "Press F9 to toggle overlay"
			TextLabel5.TextColor3 = Color3.new(0.6, 0.6, 0.6)
			TextLabel5.TextSize = 10
			TextLabel5.Font = Enum.Font.SourceSans
			TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel5.Parent = Frame
			p7.overlay = ScreenGui
		end,
		UpdateOverlay = function(p8)
			-- upvalues: u13 (ref), u14 (ref), u15 (ref)
			if p8.overlay then
				local ContentLabel = p8.overlay.OverlayFrame.ContentLabel
				local t2 = {}

				table.insert(t2, string.format("Executor: %s (%s)", u13, u14 and "Supported" or "Unsupported"))
				table.insert(t2, string.format("Detected at: %s", u15))
				table.insert(t2, string.format("FPS: %d", p8.currentFPS))
				table.insert(t2, string.format("Frame Time: %.2f ms", p8.frameTime))
				table.insert(t2, string.format("CPU Load: %d%%", p8.cpuLoad))
				table.insert(t2, "")
				table.insert(t2, "=== LIVE TELEMETRY ===")

				local v162 = p8.debugVerbosity == "High" and 10 or (p8.debugVerbosity == "Medium" and 6 or 3)
				local t3 = {}

				for i = math.max(1, #p8.sessionLog - v162 + 1), #p8.sessionLog do
					if p8.sessionLog[i] then
						table.insert(t3, p8.sessionLog[i])
					end
				end

				for _, v in ipairs(t3) do
					table.insert(t2, string.format("[%s] %s", v.timestamp, v.message))
				end

				ContentLabel.Text = table.concat(t2, "\n")

				return
			end
		end,
		DestroyOverlay = function(p9)
			if p9.overlay then
				p9.overlay:Destroy()
				p9.overlay = nil
			end
		end,
		ClearSessionLog = function(p10)
			p10.sessionLog = {}
			p10:Log("INFO", "Session log cleared", "System")
		end,
		ExportSessionLog = function(p11)
			-- upvalues: u3 (ref), u13 (ref)
			if #p11.sessionLog ~= 0 then
				local t4 = {}

				table.insert(t4, "=== EZ-WIN V3 SESSION LOG ===")
				table.insert(t4, string.format("Generated: %s", os.date("%Y-%m-%d %H:%M:%S")))
				table.insert(t4, string.format("Executor: %s", u13))
				table.insert(t4, "")

				for _, v in ipairs(p11.sessionLog) do
					table.insert(t4, string.format("[%s] [%s] %s: %s", v.timestamp, v.level, v.category, v.message))
				end

				local u287 = table.concat(t4, "\n")

				if not writefile then
					if not setclipboard then
						u3:Notify({
							Title = "Export Unavailable",
							Content = "Executor doesn't support file operations",
							Icon = "x",
							Duration = 3
						})
					else
						pcall(function()
							-- upvalues: u287 (ref), u3 (ref)
							setclipboard(u287)
							u3:Notify({
								Title = "Log Copied",
								Content = "Session log copied to clipboard",
								Icon = "copy",
								Duration = 3
							})
						end)
					end
				else
					local u288 = string.format("ezwin_log_%s.txt", os.date("%Y%m%d_%H%M%S"))

					pcall(function()
						-- upvalues: u288 (ref), u287 (ref), u3 (ref)
						writefile(u288, u287)
						u3:Notify({
							Title = "Log Exported",
							Content = "Saved as " .. u288,
							Icon = "check",
							Duration = 3
						})
					end)
				end

				return
			end

			u3:Notify({
				Title = "Export Failed",
				Content = "No log entries to export",
				Icon = "alert-triangle",
				Duration = 3
			})
		end
	}

	t5:Log("INFO", "Diagnostics system initialized", "System")
	t5:Log("INFO", string.format("Executor detected: %s", u13), "Detection")

	local u17 = u3:CreateWindow({
		Title = "Ez-Win V3",
		Icon = "crosshair",
		Author = "Author: s0ulz",
		Folder = "ExoMVSD",
		Size = UDim2.fromOffset(580, 460),
		Transparent = true,
		Theme = "Dark",
		Resizable = true,
		SideBarWidth = 200,
		User = {
			Enabled = true,
			Anonymous = false,
			Callback = function()
				print("User clicked")
			end
		}
	})
	local n1 = 30
	local n2 = 10
	local n3 = 500
	local n4 = 150
	local n5 = 0
	local n6 = 0
	local n7 = 0
	local n8 = 1
	local t6 = {}
	local t7 = {}
	local t8 = {}
	local t9 = {}
	local t10 = {}
	local t11 = {}
	local n9 = 0
	local n10 = 20
	local n11 = 70
	local color3 = Color3.fromRGB(0, 255, 0)
	local u36 = false
	local u37 = false
	local u38 = false
	local u39 = false
	local n12 = 50
	local t12 = {}
	local BodyVelocity = nil
	local u43 = false
	local u44 = false
	local u45 = false
	local u46 = false
	local color3_2 = Color3.fromRGB(0, 255, 255)
	local u48 = false
	local u49 = false
	local color3_3 = Color3.fromRGB(255, 255, 255)
	local n13 = 1
	local u52 = false
	local u53 = false
	local MouseButton2 = Enum.UserInputType.MouseButton2
	local n14 = 15
	local u56 = false
	local u57 = false
	local u58 = false
	local s2 = "HumanoidRootPart"
	local n15 = 0.5
	local u61 = false
	local n16 = 100
	local color3_4 = Color3.fromRGB(255, 255, 255)
	local n17 = 1
	local u65 = nil
	local u66 = false
	local n18 = 0.3
	local n19 = 85
	local s3 = "Linear"
	local u70 = false
	local u71 = false
	local u72 = nil
	local n20 = 0.1
	local _ = false
	local u75 = nil
	local t13 = {}
	local u77 = false
	local n21 = 50
	local color3_5 = Color3.fromRGB(255, 0, 0)
	local Part = nil
	local u81 = nil
	local t14 = {}
	local n22 = 1
	local t15 = {}
	local t16 = {}
	local t17 = {}
	local t18 = {}
	local t19 = {}
	local t20 = {
		playerData = {},
		maxHistorySize = 30,
		minHistorySize = 3,
		UpdatePlayerData = function(p12, p13)
			if p13 and p13.Character then
				local HumanoidRootPart = p13.Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart then
					local timestamp = tick()
					local HumanoidRootPartPosition = HumanoidRootPart.Position

					if not p12.playerData[p13] then
						p12.playerData[p13] = {
							positionHistory = {},
							lastUpdate = timestamp,
							velocity = Vector3.new(0, 0, 0),
							acceleration = Vector3.new(0, 0, 0),
							confidence = 0
						}
					end

					local v493 = p12.playerData[p13]

					table.insert(v493.positionHistory, {
						position = HumanoidRootPartPosition,
						timestamp = timestamp
					})

					if #v493.positionHistory > 15 then
						table.remove(v493.positionHistory, 1)
					end

					if #v493.positionHistory >= 2 then
						local v494 = v493.positionHistory[#v493.positionHistory - 1]
						local v495 = v493.positionHistory[#v493.positionHistory]
						local v496 = v495.timestamp - v494.timestamp

						if v496 > 0 then
							local v497 = (v495.position - v494.position) / v496

							if math.abs(v497.Y) > 40 then
								v497 = Vector3.new(v497.X, 0, v497.Z)
							end

							v493.velocity = v493.velocity:Lerp(v497, 0.8)

							if #v493.positionHistory >= 3 then
								v493.acceleration = (v497 - v493.velocity) / v496
							end

							if not (v497.Magnitude > 0.1) then
								v493.confidence = math.max(0, v493.confidence - 4)
							else
								v493.confidence = math.min(100, v493.confidence + 8)
							end
						end
					end

					v493.lastUpdate = timestamp

					return
				end

				return
			end
		end,
		PredictPlayerPosition = function(p14, p15, p16)
			-- upvalues: s3 (ref)
			if p14.playerData[p15] and not (#p14.playerData[p15].positionHistory < p14.minHistorySize) then
				local v262 = p14.playerData[p15]
				local position = v262.positionHistory[#v262.positionHistory].position
				local velocity = v262.velocity
				local acceleration = v262.acceleration

				if math.abs(velocity.Y) > 40 then
					velocity = Vector3.new(velocity.X, 0, velocity.Z)
				end

				local v266

				if s3 ~= "Linear" then
					if s3 ~= "Acceleration" then
						if s3 ~= "Pattern-Learning" then
							v266 = position
						else
							local vector3 = Vector3.new(0, 0, 0)
							local n23 = 0

							for i = math.max(1, #v262.positionHistory - 5), #v262.positionHistory - 1 do
								local v270 = i / #v262.positionHistory

								if i < #v262.positionHistory then
									local v271 = v262.positionHistory[i + 1].position - v262.positionHistory[i].position
									local v272 = v262.positionHistory[i + 1].timestamp - v262.positionHistory[i].timestamp

									if v272 > 0 then
										vector3 = vector3 + v271 / v272 * v270
										n23 = n23 + v270
									end
								end
							end

							if n23 > 0 then
								vector3 = vector3 / n23
							end

							v266 = position + vector3 * p16
						end
					else
						v266 = position + velocity * p16 + 0.5 * acceleration * (p16 * p16)
					end
				else
					v266 = position + velocity * p16
				end

				return position:Lerp(v266, (math.clamp(v262.confidence / 100, 0.5, 0.9))), v262.confidence
			end

			return nil, 0
		end,
		GetPredictedAimPosition = function(p17, p18)
			-- upvalues: u66 (ref), n18 (ref), s2 (ref), n19 (ref), t5 (ref)
			if u66 then
				local v508, v509 = p17:PredictPlayerPosition(p18, n18)

				if v508 then
					local s2_2 = p18.Character:FindFirstChild(s2)

					if s2_2 then
						local s2_2Position = s2_2.Position
						local v512 = n19 / 100
						local v513 = v508 * v512 + s2_2Position * (1 - v512)

						if v509 > 50 then
							t5:Log("DEBUG", string.format("Player: %s | Pos: (%.1f,%.1f,%.1f) | Pred: (%.1f,%.1f,%.1f) | Vel: (%.1f,%.1f,%.1f) | Conf: %.0f%%", p18.Name, s2_2Position.X, s2_2Position.Y, s2_2Position.Z, v508.X, v508.Y, v508.Z, p17.playerData[p18].velocity.X, p17.playerData[p18].velocity.Y, p17.playerData[p18].velocity.Z, v509), "Prediction")
						end

						return v513
					end

					return nil
				end

				return nil
			end

			return nil
		end,
		CleanupDisconnectedPlayers = function(p19)
			-- upvalues: Players (ref)
			for k, _ in pairs(p19.playerData) do
				if not k or not k.Parent or not Players:FindFirstChild(k.Name) then
					p19.playerData[k] = nil
				end
			end
		end
	}

	local function u90()
		-- upvalues: t6 (ref)
		if not (#t6 > 0) then
			local drawing = Drawing.new("Line")

			drawing.Thickness = 1
			drawing.Transparency = 0.5
			drawing.Visible = false

			return drawing
		end

		return table.remove(t6)
	end
	local function u91(p20)
		-- upvalues: t6 (ref)
		if p20 then
			p20.Visible = false
			table.insert(t6, p20)
		end
	end
	local function u92()
		-- upvalues: t7 (ref)
		if not (#t7 > 0) then
			local drawing = Drawing.new("Circle")

			drawing.Thickness = 1
			drawing.Filled = true
			drawing.Transparency = 0.5
			drawing.Visible = false
			drawing.Radius = 4

			return drawing
		end

		return table.remove(t7)
	end
	local function u93(p21)
		-- upvalues: t7 (ref)
		if p21 then
			p21.Visible = false
			table.insert(t7, p21)
		end
	end
	local function u94()
		-- upvalues: n9 (ref), t9 (ref), t10 (ref), LocalPlayer (ref), Players (ref), n3 (ref), u66 (ref), t20 (ref)
		local timestamp = tick()

		if not (timestamp - n9 < 0.5) then
			n9 = timestamp
			t9 = {}
			t10 = {}

			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local HumanoidRootPartPosition = LocalPlayer.Character.HumanoidRootPart.Position

				for _, v in ipairs(Players:GetPlayers()) do
					if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
						local Magnitude = (v.Character.HumanoidRootPart.Position - HumanoidRootPartPosition).Magnitude

						if Magnitude <= n3 then
							table.insert(t9, v)
							t10[v] = Magnitude

							if u66 then
								t20:UpdatePlayerData(v)
							end
						end
					end
				end

				if u66 then
					t20:CleanupDisconnectedPlayers()
				end

				return
			end

			return
		end
	end
	local function u95(p22)
		-- upvalues: t11 (ref), LocalPlayer (ref), CurrentCamera (ref)
		if p22 and p22.Character then
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local HumanoidRootPart = LocalPlayer.Character.HumanoidRootPart
				local HumanoidRootPart2 = p22.Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart2 then
					local v481, v482 = CurrentCamera:WorldToViewportPoint(HumanoidRootPart2.Position)

					if v482 and not (v481.Z <= 0) then
						local HumanoidRootPartPosition = HumanoidRootPart.Position
						local v484 = HumanoidRootPart2.Position - HumanoidRootPartPosition
						local Magnitude = v484.Magnitude
						local Unit = v484.Unit
						local raycastParams = RaycastParams.new()

						raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
						raycastParams.FilterDescendantsInstances = {
							LocalPlayer.Character,
							p22.Character
						}
						t11[p22] = workspace:Raycast(HumanoidRootPartPosition, Unit * Magnitude, raycastParams) == nil

						return
					end

					t11[p22] = false

					return
				end

				t11[p22] = false

				return
			end

			t11[p22] = false

			return
		end

		t11[p22] = false
	end
	local function u96()
		-- upvalues: u94 (ref), t9 (ref), n8 (ref), u95 (ref)
		u94()

		if #t9 ~= 0 then
			local v310 = math.min(2, #t9)

			for i = 1, v310 do
				local v312 = t9[(n8 - 1 + i - 1) % #t9 + 1]

				if v312 then
					u95(v312)
				end
			end

			n8 = (n8 + v310 - 1) % #t9 + 1

			return
		end
	end
	local function u97(p23)
		-- upvalues: t11 (ref), u95 (ref)
		if t11[p23] == nil then
			u95(p23)

			return t11[p23] or false
		end

		return t11[p23]
	end
	local function u98(p24)
		-- upvalues: LocalPlayer (ref)
		pcall(function()
			-- upvalues: LocalPlayer (ref), p24 (ref)
			local Humanoid = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("Humanoid")
			local Animation = Instance.new("Animation")

			Animation.AnimationId = p24

			local u578 = Humanoid:LoadAnimation(Animation)

			u578:Play()
			print("Playing animation:", p24)

			local connection = nil

			connection = Humanoid.Running:Connect(function(speed)
				-- upvalues: u578 (ref), connection (ref)
				if speed > 0 then
					u578:Stop()
					connection:Disconnect()
				end
			end)
		end)
	end

	local u99 = nil
	local t21 = {
		CombatSection = u17:Section({
			Title = "Combat",
			Icon = "sword",
			Opened = true
		}),
		VisualSection = u17:Section({
			Title = "Visual",
			Icon = "eye",
			Opened = true
		}),
		ExtraSection = u17:Section({
			Title = "Misc",
			Icon = "plus",
			Opened = true
		}),
		EzWinSection = u17:Section({
			Title = "EzWin",
			Icon = "zap",
			Opened = true
		})
	}

	t21.HitboxTab = t21.CombatSection:Tab({
		Title = "Hitbox",
		Icon = "target",
		Desc = "Modify player hitboxes for easier targeting"
	})
	t21.AimTab = t21.CombatSection:Tab({
		Title = "Aim",
		Icon = "crosshair",
		Desc = "Silent Aim and Prediction AI systems"
	})
	t21.CooldownTab = t21.CombatSection:Tab({
		Title = "Cooldown",
		Icon = "clock",
		Desc = "Weapon cooldown features (Coming Soon)"
	})
	t21.ESPTab = t21.VisualSection:Tab({
		Title = "ESP",
		Icon = "eye-off",
		Desc = "Extra sensory perception features"
	})
	t21.TracersTab = t21.VisualSection:Tab({
		Title = "Tracers",
		Icon = "git-branch",
		Desc = "Line tracers from player to enemies"
	})
	t21.EzWinTab = t21.EzWinSection:Tab({
		Title = "Autokill",
		Icon = "zap",
		Desc = "Advanced kill features"
	})
	t21.KillAuraTab = t21.EzWinSection:Tab({
		Title = "Kill Aura",
		Icon = "crosshair",
		Desc = "Automatic area-of-effect killing"
	})
	t21.EmotesTab = t21.ExtraSection:Tab({
		Title = "Emotes",
		Icon = "music",
		Desc = "Play various character animations and emotes"
	})
	t21.ExtraTab = t21.ExtraSection:Tab({
		Title = "Extra",
		Icon = "settings",
		Desc = "Additional utility features"
	})
	t21.PerformanceTab = t21.ExtraSection:Tab({
		Title = "Performance",
		Icon = "activity",
		Desc = "Performance monitoring and optimization settings"
	})

	local function u101()
		-- upvalues: u65 (ref), u92 (ref), n17 (ref), color3_4 (ref), n16 (ref), u61 (ref)
		pcall(function()
			-- upvalues: u65 (ref), u92 (ref), n17 (ref), color3_4 (ref), n16 (ref), u61 (ref)
			if u65 then
				u65:Remove()
			end

			u65 = u92()
			u65.Thickness = n17
			u65.NumSides = 100
			u65.Filled = false
			u65.Transparency = 0.7
			u65.Color = color3_4
			u65.Radius = n16
			u65.Visible = u61
		end)
	end
	local function u102()
		-- upvalues: u65 (ref), u61 (ref), UserInputService (ref), color3_4 (ref), n17 (ref), n16 (ref)
		if u65 and u61 then
			local MouseLocation = UserInputService:GetMouseLocation()

			u65.Position = Vector2.new(MouseLocation.X, MouseLocation.Y)
			u65.Color = color3_4
			u65.Thickness = n17
			u65.Radius = n16
			u65.Visible = true

			return
		end
	end
	local function u103()
		-- upvalues: u65 (ref), u93 (ref)
		if u65 then
			u93(u65)
			u65 = nil
		end
	end
	local function u104()
		-- upvalues: Part (ref), color3_5 (ref), n21 (ref)
		pcall(function()
			-- upvalues: Part (ref), color3_5 (ref), n21 (ref)
			if Part then
				Part:Destroy()
			end

			Part = Instance.new("Part")
			Part.Name = "KillAuraCircle"
			Part.Anchored = true
			Part.CanCollide = false
			Part.Material = Enum.Material.Neon
			Part.Shape = Enum.PartType.Cylinder
			Part.TopSurface = Enum.SurfaceType.Smooth
			Part.BottomSurface = Enum.SurfaceType.Smooth
			Part.Color = color3_5
			Part.Transparency = 0.7
			Part.Size = Vector3.new(0.1, n21 * 2, n21 * 2)
			Part.Parent = workspace
		end)
	end

	local t22 = {}

	local function u106()
		-- upvalues: Part (ref), u77 (ref), LocalPlayer (ref), n21 (ref), color3_5 (ref)
		if Part and u77 and LocalPlayer.Character then
			local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				local HumanoidRootPartPosition = HumanoidRootPart.Position
				local vector3 = Vector3.new(0, -1000, 0)
				local raycastParams = RaycastParams.new()

				raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
				raycastParams.FilterDescendantsInstances = {
					LocalPlayer.Character,
					Part
				}

				local raycastResult = workspace:Raycast(HumanoidRootPartPosition, vector3, raycastParams)
				local vector3_2

				if not raycastResult then
					vector3_2 = Vector3.new(HumanoidRootPartPosition.X, HumanoidRootPartPosition.Y - 5, HumanoidRootPartPosition.Z)
				else
					vector3_2 = Vector3.new(HumanoidRootPartPosition.X, raycastResult.Position.Y + 0.05, HumanoidRootPartPosition.Z)
				end

				Part.Size = Vector3.new(0.1, n21 * 2, n21 * 2)
				Part.Color = color3_5
				Part.Transparency = 0.7
				Part.CanCollide = false
				Part.Anchored = true
				Part.CFrame = CFrame.new(vector3_2) * CFrame.Angles(0, 0, math.rad(90))

				if not Part.Parent then
					Part.Parent = workspace
				end

				return
			end

			return
		end
	end
	local function u107()
		-- upvalues: Part (ref)
		if Part then
			Part:Destroy()
			Part = nil
		end
	end
	local function u108()
		-- upvalues: u81 (ref), RunService (ref), u77 (ref), LocalPlayer (ref), u106 (ref), t9 (ref), n21 (ref), n22 (ref), t22 (ref), u99 (ref), u3 (ref), t5 (ref)
		if u81 then
			u81:Disconnect()
			u81 = nil
		end

		u81 = RunService.Heartbeat:Connect(function()
			-- upvalues: u77 (ref), LocalPlayer (ref), u106 (ref), t9 (ref), n21 (ref), n22 (ref), t22 (ref), u99 (ref), u3 (ref), t5 (ref)
			if u77 and LocalPlayer.Character then
				local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart then
					local HumanoidRootPartPosition = HumanoidRootPart.Position
					local timestamp = tick()

					u106()

					for _, v in ipairs(t9) do
						if v ~= LocalPlayer and v.Character then
							local HumanoidRootPart3 = v.Character:FindFirstChild("HumanoidRootPart")
							local Humanoid = v.Character:FindFirstChildOfClass("Humanoid")

							if HumanoidRootPart3 and Humanoid and Humanoid.Health > 0 and (not LocalPlayer.Team or not v.Team or v.Team ~= LocalPlayer.Team) then
								local Magnitude = (Vector2.new(HumanoidRootPartPosition.X, HumanoidRootPartPosition.Z) - Vector2.new(HumanoidRootPart3.Position.X, HumanoidRootPart3.Position.Z)).Magnitude

								if Magnitude <= (tonumber(n21) or 0) and (tonumber(n22) or 0.5) <= timestamp - (t22[v] or 0) then
									u99(v)
									t22[v] = timestamp
									u3:Notify({
										Title = "Kill Aura",
										Content = "Attacked " .. v.Name .. " (" .. math.floor(Magnitude) .. " studs)",
										Icon = "crosshair",
										Duration = 1
									})
									t5:Log("INFO", string.format("Kill Aura attacked %s", v.Name), "KillAura")
								end
							end
						end
					end

					return
				end

				return
			end
		end)
	end
	local function u109()
		-- upvalues: u81 (ref), t14 (ref), t22 (ref), u107 (ref)
		if u81 then
			u81:Disconnect()
			u81 = nil
		end

		t14 = {}
		t22 = {}
		u107()
	end
	local function u110()
		-- upvalues: t9 (ref), LocalPlayer (ref)
		local t23 = {}

		for _, v in ipairs(t9) do
			if v.Character and (not LocalPlayer.Team or not v.Team or v.Team ~= LocalPlayer.Team) then
				local Humanoid = v.Character:FindFirstChildOfClass("Humanoid")

				if Humanoid and Humanoid.Health > 0 then
					local LeftUpperArm = v.Character:FindFirstChild("LeftUpperArm")

					if LeftUpperArm and LeftUpperArm:FindFirstChild("Part") then
						table.insert(t23, v)
					end
				end
			end
		end

		return t23
	end

	function u99(p25)
		-- upvalues: LocalPlayer (ref), ReplicatedStorage (ref)
		if p25 and p25.Character then
			if LocalPlayer:WaitForChild("Backpack", 1) and LocalPlayer.Character then
				local Backpack = LocalPlayer.Backpack
				local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")

				if Humanoid then
					local v338 = Backpack:GetChildren()[2]

					if v338 then
						Humanoid:EquipTool(v338)
					end
				end
			end

			local LeftUpperArm = p25.Character:FindFirstChild("LeftUpperArm")

			if LeftUpperArm and LeftUpperArm:FindFirstChild("Part") then
				local Remotes = ReplicatedStorage:FindFirstChild("Remotes")

				if Remotes then
					local ShootGun = Remotes:FindFirstChild("ShootGun")

					if ShootGun then
						local t24 = {
							Vector3.new(-174.95948791503906, 165.3748779296875, -1.7110586166381836),
							Vector3.new(-176.19561767578125, 144.7963409423828, 51.71797180175781),
							LeftUpperArm:FindFirstChild("Part"),
							Vector3.new(-175.43002319335938, 166.70974731445312, 6.782278537750244)
						}

						ShootGun:FireServer(unpack(t24))
					end
				end

				return
			end

			return
		end
	end

	local function u111()
		-- upvalues: u72 (ref), RunService (ref), u71 (ref), LocalPlayer (ref), u110 (ref), u99 (ref), n20 (ref)
		if u72 then
			u72:Disconnect()
			u72 = nil
		end

		u72 = RunService.Heartbeat:Connect(function()
			-- upvalues: u71 (ref), LocalPlayer (ref), u110 (ref), u99 (ref), n20 (ref)
			if u71 then
				if LocalPlayer:WaitForChild("Backpack", 1) and LocalPlayer.Character then
					local Backpack = LocalPlayer.Backpack
					local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")

					if Humanoid then
						local v559 = Backpack:GetChildren()[2]

						if v559 then
							Humanoid:EquipTool(v559)
						end
					end
				end

				local v560 = u110()

				for _, v in ipairs(v560) do
					u99(v)
				end

				task.wait(n20)

				return
			end
		end)
	end
	local function u112()
		-- upvalues: u72 (ref)
		if u72 then
			u72:Disconnect()
			u72 = nil
		end
	end
	local function u113()
		-- upvalues: LocalPlayer (ref), u3 (ref), u110 (ref), u99 (ref)
		if LocalPlayer:WaitForChild("Backpack", 1) and LocalPlayer.Character then
			local Backpack = LocalPlayer.Backpack
			local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")

			if Humanoid then
				local v419 = Backpack:GetChildren()[2]

				if not v419 then
					warn("No second item found in inventory!")
					u3:Notify({
						Title = "No Weapon Found",
						Content = "No second item found in inventory! Cannot execute kill all.",
						Icon = "alert-triangle",
						Duration = 3
					})

					return
				end

				Humanoid:EquipTool(v419)
			end
		end

		local v420 = u110()

		for _ = 1, 5 do
			for _, v in ipairs(v420) do
				u99(v)
			end

			task.wait(0.05)
		end

		u3:Notify({
			Title = "Kill All Executed",
			Content = "Targeted " .. #v420 .. " enemy players (spammed 5x)",
			Icon = "zap",
			Duration = 3
		})
	end

	function AutoShootAtTarget(p26)
		-- upvalues: LocalPlayer (ref), ReplicatedStorage (ref), t13 (ref)
		if p26 and p26.Character then
			local HumanoidRootPart = p26.Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				if LocalPlayer:WaitForChild("Backpack", 1) and LocalPlayer.Character then
					local Backpack = LocalPlayer.Backpack
					local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")

					if Humanoid then
						local v176 = Backpack:GetChildren()[2]

						if not v176 then
							warn("No second item found in inventory!")

							return
						end

						Humanoid:EquipTool(v176)
					end
				end

				local LeftUpperArm = p26.Character:FindFirstChild("LeftUpperArm")

				if LeftUpperArm and LeftUpperArm:FindFirstChild("Part") then
					local Remotes = ReplicatedStorage:FindFirstChild("Remotes")

					if Remotes then
						local ShootGun = Remotes:FindFirstChild("ShootGun")

						if ShootGun then
							local HumanoidRootPartPosition = HumanoidRootPart.Position
							local v181 = HumanoidRootPartPosition + Vector3.new(0, 2, 0)
							local t25 = {
								LocalPlayer.Character.HumanoidRootPart.Position,
								v181,
								LeftUpperArm:FindFirstChild("Part"),
								HumanoidRootPartPosition
							}

							ShootGun:FireServer(unpack(t25))
							print("Auto Shot: " .. p26.Name .. " at position " .. tostring(HumanoidRootPartPosition))
							t13[p26] = true
							task.spawn(function()
								-- upvalues: t13 (ref), p26 (ref)
								task.wait(2)
								t13[p26] = nil
							end)
						end
					end

					return
				end

				return
			end

			return
		end
	end
	function StopAutoShoot()
		-- upvalues: u75 (ref), t13 (ref)
		if u75 then
			u75:Disconnect()
			u75 = nil
		end

		t13 = {}
	end

	t21.EzWinTab:Section({
		Title = "Auto Kill Features"
	})
	t21.EzWinTab:Toggle({
		Title = "Loop Auto Kill",
		Desc = "Continuously kill all enemy players with adjustable spam rate",
		Icon = "repeat",
		Value = false,
		Callback = function(p27)
			-- upvalues: u71 (ref), u111 (ref), u3 (ref), n20 (ref), u112 (ref)
			u71 = p27

			if not p27 then
				u112()
				u3:Notify({
					Title = "Loop Auto Kill Disabled",
					Content = "Auto kill loop stopped",
					Icon = "square",
					Duration = 3
				})
			else
				u111()
				u3:Notify({
					Title = "Loop Auto Kill Enabled",
					Content = "Now killing enemies every " .. n20 .. " seconds",
					Icon = "repeat",
					Duration = 3
				})
			end
		end
	})
	t21.EzWinTab:Slider({
		Title = "Spam Rate Limiter",
		Desc = "How often to execute auto kill (in seconds)",
		Value = {
			Min = 0.1,
			Max = 5,
			Default = 0.1
		},
		Step = 0.1,
		Callback = function(p28)
			-- upvalues: n20 (ref), u3 (ref)
			n20 = p28
			u3:Notify({
				Title = "Spam Rate Updated",
				Content = "Auto kill will now execute every " .. p28 .. " seconds",
				Icon = "clock",
				Duration = 2
			})
		end
	})
	t21.EzWinTab:Button({
		Title = "Kill All",
		Desc = "Execute kill on all enemy players once",
		Icon = "zap",
		Callback = function()
			-- upvalues: u113 (ref)
			u113()
		end
	})
	t21.EzWinTab:Section({
		Title = "Information"
	})
	t21.EzWinTab:Paragraph({
		Title = "EzWin Features",
		Desc = "YOU BETTER WIN with these cheats!\nOnly problem is that players might not be able to be shot/killed so be careful as you might lose your streak. These EzWin features are still Beta!",
		Color = "Red",
		Image = "alert-triangle"
	})
	t21.KillAuraTab:Section({
		Title = "Kill Aura System"
	})
	t21.KillAuraTab:Toggle({
		Title = "Enable Kill Aura",
		Desc = "Automatically attack enemies that enter your radius",
		Icon = "target",
		Value = false,
		Callback = function(p29)
			-- upvalues: u77 (ref), u104 (ref), u108 (ref), u3 (ref), n21 (ref), u107 (ref), u109 (ref)
			u77 = p29

			if not p29 then
				u107()
				u109()
				u3:Notify({
					Title = "Kill Aura Disabled",
					Content = "Kill aura stopped",
					Icon = "square",
					Duration = 3
				})
			else
				u104()
				u108()
				u3:Notify({
					Title = "Kill Aura Enabled",
					Content = "Now attacking enemies within " .. n21 .. " studs radius",
					Icon = "target",
					Duration = 3
				})
			end
		end
	})
	t21.KillAuraTab:Slider({
		Title = "Aura Radius",
		Desc = "Size of the kill aura area (in studs)",
		Value = {
			Min = 10,
			Max = 200,
			Default = 50
		},
		Step = 5,
		Callback = function(p30)
			-- upvalues: n21 (ref), u3 (ref)
			n21 = p30
			u3:Notify({
				Title = "Kill Aura Radius Updated",
				Content = "Radius set to " .. p30 .. " studs",
				Icon = "circle",
				Duration = 2
			})
		end
	})
	t21.KillAuraTab:Slider({
		Title = "Attack Rate Limit",
		Desc = "How often to attack players in the circle (in seconds)",
		Value = {
			Min = 0.5,
			Max = 5,
			Default = 1
		},
		Step = 0.1,
		Callback = function(p31)
			-- upvalues: n22 (ref), u3 (ref)
			n22 = p31
			u3:Notify({
				Title = "Kill Aura Rate Updated",
				Content = "Will attack every " .. p31 .. " seconds",
				Icon = "clock",
				Duration = 2
			})
		end
	})
	t21.KillAuraTab:Colorpicker({
		Title = "Circle Color",
		Desc = "Color of the kill aura visual circle",
		Default = color3_5,
		Callback = function(p32)
			-- upvalues: color3_5 (ref), Part (ref)
			color3_5 = p32

			if Part then
				Part.Color = p32
			end
		end
	})

	local function u114()
		-- upvalues: Players (ref)
		for _, v in ipairs(Players:GetPlayers()) do
			if v.Character then
				local HumanoidRootPart = v.Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart then
					HumanoidRootPart.Size = Vector3.new(2, 2, 1)
					HumanoidRootPart.Transparency = 0
					HumanoidRootPart.Color = Color3.fromRGB(255, 255, 255)
					HumanoidRootPart.Material = Enum.Material.Plastic
					HumanoidRootPart.CanCollide = true
				end
			end
		end
	end
	local function u115()
		-- upvalues: u36 (ref), t9 (ref), u37 (ref), LocalPlayer (ref), u38 (ref), u97 (ref), n10 (ref), n11 (ref), color3 (ref)
		if u36 then
			for _, v in ipairs(t9) do
				if v.Character then
					local HumanoidRootPart = v.Character:FindFirstChild("HumanoidRootPart")

					if HumanoidRootPart then
						local v435 = true

						if u37 and LocalPlayer.Team and v.Team == LocalPlayer.Team then
							v435 = false
						end

						if u38 and v435 then
							v435 = u97(v)
						end

						if not v435 then
							HumanoidRootPart.Size = Vector3.new(2, 2, 1)
							HumanoidRootPart.Transparency = 0
							HumanoidRootPart.Color = Color3.fromRGB(255, 255, 255)
							HumanoidRootPart.Material = Enum.Material.Plastic
							HumanoidRootPart.CanCollide = true
						else
							HumanoidRootPart.Size = Vector3.new(n10, n10, n10)
							HumanoidRootPart.Transparency = n11 / 100
							HumanoidRootPart.Color = color3
							HumanoidRootPart.Material = Enum.Material.Neon
							HumanoidRootPart.CanCollide = false
						end
					end
				end
			end

			return
		end
	end

	t21.HitboxTab:Section({
		Title = "Hitbox Settings"
	})
	t21.HitboxTab:Toggle({
		Title = "Enable Hitbox",
		Desc = "Expand player hitboxes",
		Icon = "target",
		Value = false,
		Callback = function(p33)
			-- upvalues: u36 (ref), u114 (ref)
			u36 = p33

			if not p33 then
				u114()
			end
		end
	})
	t21.HitboxTab:Slider({
		Title = "Hitbox Size",
		Desc = "Size of the expanded hitbox",
		Value = {
			Min = 1,
			Max = 50,
			Default = 20
		},
		Callback = function(p34)
			-- upvalues: n10 (ref)
			n10 = p34
		end
	})
	t21.HitboxTab:Slider({
		Title = "Transparency",
		Desc = "Transparency of the hitbox visualization (percentage)",
		Value = {
			Min = 0,
			Max = 100,
			Default = 70
		},
		Callback = function(p35)
			-- upvalues: n11 (ref)
			n11 = p35
		end
	})
	t21.HitboxTab:Toggle({
		Title = "Team Check",
		Desc = "Don't modify teammates' hitboxes",
		Icon = "users",
		Value = false,
		Callback = function(p36)
			-- upvalues: u37 (ref)
			u37 = p36
		end
	})
	t21.HitboxTab:Toggle({
		Title = "Wall Check",
		Desc = "Only expand hitboxes of visible players (not behind walls)",
		Icon = "eye",
		Value = false,
		Callback = function(p37)
			-- upvalues: u38 (ref)
			u38 = p37
		end
	})
	t21.HitboxTab:Colorpicker({
		Title = "Hitbox Color",
		Desc = "Color of the hitbox visualization",
		Default = color3,
		Callback = function(p38)
			-- upvalues: color3 (ref)
			color3 = p38
		end
	})
	t21.AimTab:Section({
		Title = "Silent Aim"
	})
	t21.AimTab:Toggle({
		Title = "Enable Silent Aim",
		Desc = "Standard FOV-based aiming system, Note not as good as the Prediction AI Aimbot",
		Icon = "crosshair",
		Value = false,
		Callback = function(p39)
			-- upvalues: u53 (ref), u57 (ref), u3 (ref), t5 (ref)
			u53 = p39

			if p39 then
				t5:Log("INFO", "Silent Aim enabled", "Aimbot")
			else
				u57 = false
				u3:Notify({
					Title = "Silent Aim Disabled",
					Content = "Aimbot system turned off",
					Icon = "square",
					Duration = 2
				})
			end
		end
	})
	t21.AimTab:Dropdown({
		Title = "Aim Target",
		Desc = "Choose which body part to target",
		Default = "HumanoidRootPart",
		Values = {
			"HumanoidRootPart",
			"Head"
		},
		Callback = function(p40)
			-- upvalues: s2 (ref), u3 (ref)
			s2 = p40
			u3:Notify({
				Title = "Aim Target Changed",
				Content = "Now targeting: " .. p40,
				Icon = "target",
				Duration = 2
			})
		end
	})
	t21.AimTab:Slider({
		Title = "Smoothness",
		Desc = "How smooth the cursor movement is (percentage)",
		Value = {
			Min = 5,
			Max = 100,
			Default = 15
		},
		Callback = function(p41)
			-- upvalues: n14 (ref)
			n14 = p41
		end
	})
	t21.AimTab:Toggle({
		Title = "Team Check",
		Desc = "Don't target teammates",
		Icon = "users",
		Value = false,
		Callback = function(p42)
			-- upvalues: u56 (ref)
			u56 = p42
		end
	})
	t21.AimTab:Toggle({
		Title = "Wall Check",
		Desc = "Only lock onto targets you can see",
		Icon = "eye",
		Value = false,
		Callback = function(p43)
			-- upvalues: u58 (ref), u3 (ref)
			u58 = p43

			if not p43 then
				u3:Notify({
					Title = "Wall Check Disabled",
					Content = "Silent Aim will lock through walls",
					Icon = "eye-off",
					Duration = 3
				})
			else
				u3:Notify({
					Title = "Wall Check Enabled",
					Content = "Silent Aim will only lock on visible targets",
					Icon = "eye",
					Duration = 3
				})
			end
		end
	})
	t21.AimTab:Toggle({
		Title = "FOV Circle",
		Desc = "Show field of view circle that follows cursor",
		Icon = "circle",
		Value = false,
		Callback = function(p44)
			-- upvalues: u61 (ref), u101 (ref), u3 (ref), u103 (ref)
			u61 = p44

			if not p44 then
				u103()
				u3:Notify({
					Title = "FOV Circle Disabled",
					Content = "FOV Circle removed",
					Icon = "square",
					Duration = 2
				})
			else
				u101()
				u3:Notify({
					Title = "FOV Circle Enabled",
					Content = "Circle will follow your cursor and target players inside",
					Icon = "circle",
					Duration = 3
				})
			end
		end
	})
	t21.AimTab:Slider({
		Title = "FOV Radius",
		Desc = "Size of the FOV circle",
		Value = {
			Min = 30,
			Max = 300,
			Default = 100
		},
		Callback = function(p45)
			-- upvalues: n16 (ref), u65 (ref)
			n16 = p45

			if u65 then
				u65.Radius = p45
			end
		end
	})
	t21.AimTab:Slider({
		Title = "Auto Kill Delay",
		Desc = "Delay between automatic kills (seconds)",
		Value = {
			Min = 0.1,
			Max = 3,
			Default = 0.5
		},
		Step = 0.1,
		Callback = function(p46)
			-- upvalues: n15 (ref)
			n15 = p46
		end
	})
	t21.AimTab:Keybind({
		Title = "Toggle Key",
		Desc = "Key to toggle Silent Aim tracking on/off",
		Value = "RightMouseButton",
		Callback = function(p47)
			-- upvalues: MouseButton2 (ref), u3 (ref)
			if p47 ~= "RightMouseButton" then
				if p47 ~= "LeftAlt" then
					if p47 ~= "LeftControl" then
						if p47 ~= "F" then
							if p47 ~= "G" then
								if p47 ~= "Q" then
									if p47 ~= "E" then
										if p47 ~= "R" then
											if p47 ~= "T" then
												if p47 ~= "Y" then
													if p47 ~= "U" then
														if p47 ~= "I" then
															if p47 ~= "O" then
																if p47 ~= "P" then
																	if p47 ~= "C" then
																		if p47 ~= "V" then
																			if p47 ~= "B" then
																				if p47 ~= "N" then
																					if p47 ~= "M" then
																						if p47 ~= "X" then
																							if p47 == "Z" then
																								MouseButton2 = Enum.KeyCode.Z
																							end
																						else
																							MouseButton2 = Enum.KeyCode.X
																						end
																					else
																						MouseButton2 = Enum.KeyCode.M
																					end
																				else
																					MouseButton2 = Enum.KeyCode.N
																				end
																			else
																				MouseButton2 = Enum.KeyCode.B
																			end
																		else
																			MouseButton2 = Enum.KeyCode.V
																		end
																	else
																		MouseButton2 = Enum.KeyCode.C
																	end
																else
																	MouseButton2 = Enum.KeyCode.P
																end
															else
																MouseButton2 = Enum.KeyCode.O
															end
														else
															MouseButton2 = Enum.KeyCode.I
														end
													else
														MouseButton2 = Enum.KeyCode.U
													end
												else
													MouseButton2 = Enum.KeyCode.Y
												end
											else
												MouseButton2 = Enum.KeyCode.T
											end
										else
											MouseButton2 = Enum.KeyCode.R
										end
									else
										MouseButton2 = Enum.KeyCode.E
									end
								else
									MouseButton2 = Enum.KeyCode.Q
								end
							else
								MouseButton2 = Enum.KeyCode.G
							end
						else
							MouseButton2 = Enum.KeyCode.F
						end
					else
						MouseButton2 = Enum.KeyCode.LeftControl
					end
				else
					MouseButton2 = Enum.KeyCode.LeftAlt
				end
			else
				MouseButton2 = Enum.UserInputType.MouseButton2
			end

			u3:Notify({
				Title = "Keybind Updated",
				Content = "Silent Aim toggle key set to: " .. tostring(p47),
				Icon = "keyboard",
				Duration = 2
			})
		end
	})
	t21.AimTab:Section({
		Title = "AI Prediction Aimbot (Alpha)"
	})
	t21.AimTab:Toggle({
		Title = "Enable Prediction AI",
		Desc = "AI-assisted prediction system for moving targets",
		Icon = "brain",
		Value = false,
		Callback = function(p48)
			-- upvalues: u66 (ref), t5 (ref), u3 (ref)
			u66 = p48

			if not p48 then
				t5:Log("INFO", "Prediction AI disabled", "Prediction")
				u3:Notify({
					Title = "Prediction AI Disabled",
					Content = "Using standard targeting",
					Icon = "square",
					Duration = 2
				})
			else
				t5:Log("INFO", "Prediction AI enabled", "Prediction")
				u3:Notify({
					Title = "Prediction AI Enabled",
					Content = "Now using AI prediction for moving targets",
					Icon = "brain",
					Duration = 3
				})
			end
		end
	})
	t21.AimTab:Slider({
		Title = "Time Ahead",
		Desc = "How far ahead to predict target position (seconds)",
		Value = {
			Min = 0.1,
			Max = 2,
			Default = 0.3
		},
		Step = 0.1,
		Callback = function(p49)
			-- upvalues: n18 (ref), t5 (ref)
			n18 = p49
			t5:Log("DEBUG", string.format("Prediction time ahead set to %.1f seconds", p49), "Prediction")
		end
	})
	t21.AimTab:Slider({
		Title = "Probability",
		Desc = "Blend between predicted and actual position (0-100%)",
		Value = {
			Min = 0,
			Max = 100,
			Default = 85
		},
		Callback = function(p50)
			-- upvalues: n19 (ref), t5 (ref)
			n19 = p50
			t5:Log("DEBUG", string.format("Prediction probability set to %d%%", p50), "Prediction")
		end
	})
	t21.AimTab:Dropdown({
		Title = "Prediction Model",
		Desc = "Algorithm used for position prediction",
		Default = "Linear",
		Values = {
			"Linear",
			"Acceleration",
			"Pattern-Learning"
		},
		Callback = function(p51)
			-- upvalues: s3 (ref), t5 (ref), u3 (ref)
			s3 = p51
			t5:Log("INFO", string.format("Prediction model changed to %s", p51), "Prediction")
			u3:Notify({
				Title = "Prediction Model Updated",
				Content = "Now using " .. p51 .. " prediction",
				Icon = "settings",
				Duration = 2
			})
		end
	})
	t21.AimTab:Toggle({
		Title = "Debug Overlay",
		Desc = "Show prediction debug information",
		Icon = "info",
		Value = false,
		Callback = function(p52)
			-- upvalues: u70 (ref), t5 (ref)
			u70 = p52

			if not p52 then
				if not t5.showDebugOverlay then
					t5:DestroyOverlay()
				end
			else
				t5.showDebugOverlay = true

				if not t5.overlay then
					t5:CreateDebugOverlay()
				end
			end
		end
	})

	local function u116(p53)
		-- upvalues: t19 (ref), u91 (ref)
		if not p53 or not t19[p53] then
			if not p53 then
				for _, v in pairs(t19) do
					if v.line then
						u91(v.line)
					end
				end

				t19 = {}
			end
		else
			if t19[p53].line then
				u91(t19[p53].line)
			end

			t19[p53] = nil
		end
	end
	local function u117(p54)
		-- upvalues: t19 (ref), u90 (ref), n13 (ref), color3_3 (ref)
		if not t19[p54] then
			local Character = p54.Character

			if Character then
				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart then
					local v361 = u90()

					v361.Thickness = n13
					v361.Transparency = 0.8
					v361.Color = color3_3
					v361.Visible = true
					t19[p54] = {
						root = HumanoidRootPart,
						line = v361
					}

					return
				end

				return
			end

			return
		end
	end
	local function u118()
		-- upvalues: LocalPlayer (ref), t19 (ref), u116 (ref), s2 (ref), CurrentCamera (ref), color3_3 (ref), n13 (ref)
		if LocalPlayer.Character then
			local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				for k, v in pairs(t19) do
					if k and k.Character and k.Character.Parent ~= nil then
						if not v.root or not v.root.Parent then
							v.line.Visible = false
						elseif not k.Character:FindFirstChild(s2) then
							v.line.Visible = false
						else
							local v326, v327 = CurrentCamera:WorldToViewportPoint(HumanoidRootPart.Position)
							local v328, v329 = CurrentCamera:WorldToViewportPoint(v.root.Position)

							if not v327 or not v329 or not (v328.Z > 0) or not (v326.Z > 0) then
								v.line.Visible = false
							elseif not (v328.X >= 0) or (not (v328.X <= CurrentCamera.ViewportSize.X) or (not (v328.Y >= 0) or not (v328.Y <= CurrentCamera.ViewportSize.Y))) then
								v.line.Visible = false
							else
								local vector2 = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y / 2)

								v.line.From = vector2
								v.line.To = Vector2.new(v328.X, v328.Y)
								v.line.Visible = true
								v.line.Color = color3_3
								v.line.Thickness = n13
							end
						end
					else
						u116(k)
					end
				end

				return
			end

			return
		end
	end

	t21.TracersTab:Section({
		Title = "Tracer Settings"
	})
	t21.TracersTab:Toggle({
		Title = "Enable Tracers",
		Desc = "Show lines from center of screen to visible players only",
		Icon = "git-branch",
		Value = false,
		Callback = function(p55)
			-- upvalues: u49 (ref), u116 (ref), u3 (ref)
			u49 = p55

			if p55 then
				u3:Notify({
					Title = "Tracers Enabled",
					Content = "Now showing lines to visible players only",
					Icon = "git-branch",
					Duration = 3
				})
			else
				u116()
				u3:Notify({
					Title = "Tracers Disabled",
					Content = "All tracer lines removed",
					Icon = "square",
					Duration = 2
				})
			end
		end
	})
	t21.TracersTab:Slider({
		Title = "Line Thickness",
		Desc = "Thickness of the tracer lines",
		Value = {
			Min = 1,
			Max = 10,
			Default = 1
		},
		Callback = function(p56)
			-- upvalues: n13 (ref), t19 (ref)
			n13 = p56

			for _, v in pairs(t19) do
				if v.line then
					v.line.Thickness = p56
				end
			end
		end
	})
	t21.TracersTab:Colorpicker({
		Title = "Line Color",
		Desc = "Color of the tracer lines",
		Default = color3_3,
		Callback = function(p57)
			-- upvalues: color3_3 (ref), t19 (ref)
			color3_3 = p57

			for _, v in pairs(t19) do
				if v.line then
					v.line.Color = p57
				end
			end
		end
	})
	t21.TracersTab:Toggle({
		Title = "Team Check",
		Desc = "Don't show tracers to teammates",
		Icon = "users",
		Value = false,
		Callback = function(p58)
			-- upvalues: u52 (ref), Players (ref), LocalPlayer (ref), u116 (ref)
			u52 = p58

			if p58 then
				for _, v in ipairs(Players:GetPlayers()) do
					if v ~= LocalPlayer and LocalPlayer.Team and v.Team == LocalPlayer.Team then
						u116(v)
					end
				end
			end
		end
	})

	local function u119(p59)
		-- upvalues: t15 (ref), u91 (ref)
		if not p59 or not t15[p59] then
			if not p59 then
				for _, v in pairs(t15) do
					for _, v2 in ipairs(v) do
						if v2.line then
							u91(v2.line)
						end
					end
				end

				t15 = {}
			end
		else
			for _, v in ipairs(t15[p59]) do
				if v.line then
					u91(v.line)
				end
			end

			t15[p59] = nil
		end
	end
	local function u120(p60)
		-- upvalues: t16 (ref), u93 (ref)
		if not p60 or not t16[p60] then
			if not p60 then
				for _, v in pairs(t16) do
					if v.dot then
						u93(v.dot)
					end
				end

				t16 = {}
			end
		else
			if t16[p60].dot then
				u93(t16[p60].dot)
			end

			t16[p60] = nil
		end
	end
	local function u121(p61)
		-- upvalues: t17 (ref)
		pcall(function()
			-- upvalues: p61 (ref), t17 (ref)
			if not p61 or not t17[p61] then
				if not p61 then
					for _, v in pairs(t17) do
						if v.box then
							v.box:Remove()
						end
					end

					t17 = {}
				end
			else
				if t17[p61].box then
					t17[p61].box:Remove()
				end

				t17[p61] = nil
			end
		end)
	end
	local function u122(p62)
		-- upvalues: t18 (ref)
		if not p62 or not t18[p62] then
			if not p62 then
				for _, v in pairs(t18) do
					for _, v3 in ipairs(v) do
						if v3 then
							v3:Destroy()
						end
					end
				end

				t18 = {}
			end
		else
			for _, v in ipairs(t18[p62]) do
				if v then
					v:Destroy()
				end
			end

			t18[p62] = nil
		end
	end
	local function u123(p63)
		-- upvalues: t15 (ref), u90 (ref), color3_2 (ref)
		if not t15[p63] then
			local t26 = {}
			local Character = p63.Character

			if Character then
				local t27 = {
					Head = Character:FindFirstChild("Head"),
					UpperTorso = Character:FindFirstChild("UpperTorso") or Character:FindFirstChild("Torso"),
					LowerTorso = Character:FindFirstChild("LowerTorso"),
					LeftUpperArm = Character:FindFirstChild("LeftUpperArm") or Character:FindFirstChild("Left Arm"),
					LeftLowerArm = Character:FindFirstChild("LeftLowerArm"),
					LeftHand = Character:FindFirstChild("LeftHand"),
					RightUpperArm = Character:FindFirstChild("RightUpperArm") or Character:FindFirstChild("Right Arm"),
					RightLowerArm = Character:FindFirstChild("RightLowerArm"),
					RightHand = Character:FindFirstChild("RightHand"),
					LeftUpperLeg = Character:FindFirstChild("LeftUpperLeg") or Character:FindFirstChild("Left Leg"),
					LeftLowerLeg = Character:FindFirstChild("LeftLowerLeg"),
					LeftFoot = Character:FindFirstChild("LeftFoot"),
					RightUpperLeg = Character:FindFirstChild("RightUpperLeg") or Character:FindFirstChild("Right Leg"),
					RightLowerLeg = Character:FindFirstChild("RightLowerLeg"),
					RightFoot = Character:FindFirstChild("RightFoot")
				}

				if t27.Head and t27.UpperTorso then
					local t28 = {
						{
							t27.Head,
							t27.UpperTorso
						},
						{
							t27.UpperTorso,
							t27.LowerTorso or t27.UpperTorso
						},
						{
							t27.UpperTorso,
							t27.LeftUpperArm
						},
						{
							t27.LeftUpperArm,
							t27.LeftLowerArm
						},
						{
							t27.LeftLowerArm,
							t27.LeftHand
						},
						{
							t27.UpperTorso,
							t27.RightUpperArm
						},
						{
							t27.RightUpperArm,
							t27.RightLowerArm
						},
						{
							t27.RightLowerArm,
							t27.RightHand
						},
						{
							t27.LowerTorso or t27.UpperTorso,
							t27.LeftUpperLeg
						},
						{
							t27.LeftUpperLeg,
							t27.LeftLowerLeg
						},
						{
							t27.LeftLowerLeg,
							t27.LeftFoot
						},
						{
							t27.LowerTorso or t27.UpperTorso,
							t27.RightUpperLeg
						},
						{
							t27.RightUpperLeg,
							t27.RightLowerLeg
						},
						{
							t27.RightLowerLeg,
							t27.RightFoot
						}
					}

					for _, v in ipairs(t28) do
						local v153 = v[1]
						local v154 = v[2]

						if v153 and v154 and v153 ~= v154 then
							local v155 = u90()

							v155.Thickness = 1
							v155.Transparency = 0.5
							v155.Color = color3_2
							v155.Visible = true
							table.insert(t26, {
								part1 = v153,
								part2 = v154,
								line = v155
							})
						end
					end

					t15[p63] = t26

					return
				end

				return
			end

			return
		end
	end
	local function u124(p64)
		-- upvalues: t18 (ref), color3_2 (ref)
		if not t18[p64] then
			if p64.Character then
				local Highlight = Instance.new("Highlight")

				Highlight.Adornee = p64.Character
				Highlight.FillColor = color3_2
				Highlight.OutlineColor = color3_2
				Highlight.FillTransparency = 0.3
				Highlight.OutlineTransparency = 0
				Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				Highlight.Parent = p64.Character
				t18[p64] = { Highlight }

				return
			end

			return
		end
	end
	local function u125(p65)
		-- upvalues: t16 (ref), u92 (ref), color3_2 (ref)
		if not t16[p65] then
			local Character = p65.Character

			if Character then
				local Head = Character:FindFirstChild("Head")

				if Head then
					local v306 = u92()

					v306.Thickness = 1
					v306.Filled = true
					v306.Transparency = 0.5
					v306.Color = color3_2
					v306.Radius = 4
					v306.Visible = true
					t16[p65] = {
						head = Head,
						dot = v306
					}

					return
				end

				return
			end

			return
		end
	end
	local function u126(p66)
		-- upvalues: t17 (ref), color3_2 (ref)
		pcall(function()
			-- upvalues: t17 (ref), p66 (ref), color3_2 (ref)
			if not t17[p66] then
				local Character = p66.Character

				if Character then
					local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

					if HumanoidRootPart then
						local drawing = Drawing.new("Quad")

						drawing.Thickness = 1
						drawing.Filled = false
						drawing.Transparency = 0.5
						drawing.Color = color3_2
						drawing.Visible = true
						t17[p66] = {
							root = HumanoidRootPart,
							box = drawing
						}

						return
					end

					return
				end

				return
			end
		end)
	end
	local function u127()
		-- upvalues: t15 (ref), u119 (ref), t10 (ref), n3 (ref), CurrentCamera (ref), n4 (ref), color3_2 (ref)
		for k, v in pairs(t15) do
			if k and k.Character and k.Character.Parent ~= nil then
				local v438 = t10[k] or math.huge

				if not (v438 > n3) then
					local HumanoidRootPart = k.Character:FindFirstChild("HumanoidRootPart")

					if HumanoidRootPart then
						local v440, v441 = CurrentCamera:WorldToViewportPoint(HumanoidRootPart.Position)

						if v441 and v440.Z > 0 then
							local v442 = v438 > n4

							for i, v4 in ipairs(v) do
								if not v4.part1 or not v4.part2 or not v4.part1.Parent or not v4.part2.Parent then
									v4.line.Visible = false
								elseif not v442 or not (i > 6) then
									local v445, v446 = CurrentCamera:WorldToViewportPoint(v4.part1.Position)
									local v447, v448 = CurrentCamera:WorldToViewportPoint(v4.part2.Position)

									if not v446 or not v448 or not (v445.Z > 0) or not (v447.Z > 0) then
										v4.line.Visible = false
									else
										v4.line.From = Vector2.new(v445.X, v445.Y)
										v4.line.To = Vector2.new(v447.X, v447.Y)
										v4.line.Visible = true
										v4.line.Color = color3_2
									end
								else
									v4.line.Visible = false
								end
							end
						else
							for _, v5 in ipairs(v) do
								if v5.line then
									v5.line.Visible = false
								end
							end
						end
					else
						for _, v6 in ipairs(v) do
							if v6.line then
								v6.line.Visible = false
							end
						end
					end
				else
					for _, v7 in ipairs(v) do
						if v7.line then
							v7.line.Visible = false
						end
					end
				end
			else
				u119(k)
			end
		end
	end
	local function u128()
		-- upvalues: t16 (ref), u120 (ref), t10 (ref), n3 (ref), CurrentCamera (ref), color3_2 (ref)
		for k, v in pairs(t16) do
			if k and k.Character and k.Character.Parent ~= nil then
				local v187 = t10[k] or math.huge

				if not (v187 > n3) then
					if not v.head or not v.head.Parent then
						v.dot.Visible = false
					else
						local v188, v189 = CurrentCamera:WorldToViewportPoint(v.head.Position)

						if not v189 or not (v188.Z > 0) or not (v188.X >= 0) or not (v188.Y >= 0) or not (v188.X <= CurrentCamera.ViewportSize.X) or not (v188.Y <= CurrentCamera.ViewportSize.Y) then
							v.dot.Visible = false
						else
							v.dot.Position = Vector2.new(v188.X, v188.Y)
							v.dot.Visible = true
							v.dot.Color = color3_2

							local v190 = math.max(0.5, 100 / v187)

							v.dot.Radius = math.max(2, 4 * v190)
						end
					end
				else
					v.dot.Visible = false
				end
			else
				u120(k)
			end
		end
	end
	local function u129()
		-- upvalues: t17 (ref), CurrentCamera (ref), color3_2 (ref)
		pcall(function()
			-- upvalues: t17 (ref), CurrentCamera (ref), color3_2 (ref)
			v = nil

			for k, v in pairs(t17) do
				if k and k.Character and k.Character.Parent ~= nil then
					if v.root and v.root.Parent then
						local Head = k.Character:FindFirstChild("Head")
						local v539 = Head and Head.Position or v.root.Position
						local v540, v541 = CurrentCamera:WorldToViewportPoint(v539)

						if v541 and (v540.Z > 0 and (v540.X >= 0 and (v540.X <= CurrentCamera.ViewportSize.X and (v540.Y >= 0 and v540.Y <= CurrentCamera.ViewportSize.Y)))) then
							local rootCFrame = v.root.CFrame
							local vector3 = Vector3.new(3, 5, 0)
							local t29 = {
								Vector3.new(-vector3.X, -vector3.Y, 0),
								Vector3.new(vector3.X, -vector3.Y, 0),
								Vector3.new(vector3.X, vector3.Y, 0),
								Vector3.new(-vector3.X, vector3.Y, 0)
							}
							local t30 = {}
							local v546 = true

							for i, v8 in ipairs(t29) do
								local v549 = rootCFrame:PointToWorldSpace(v8)
								local v550, v551 = CurrentCamera:WorldToViewportPoint(v549)

								if not v551 or not (v550.Z > 0) then
									v546 = false

									break
								end

								t30[i] = Vector2.new(v550.X, v550.Y)
							end

							if not v546 or #t30 ~= 4 then
								if v and v.box then
									pcall(function()
										-- upvalues: v (ref)
										v.box:Remove()
									end)
								end

								t17[k] = nil
							else
								v.box.PointA = t30[1]
								v.box.PointB = t30[2]
								v.box.PointC = t30[3]
								v.box.PointD = t30[4]
								v.box.Visible = true
								v.box.Color = color3_2
							end
						else
							if v and v.box then
								pcall(function()
									-- upvalues: v (ref)
									v.box:Remove()
								end)
							end

							t17[k] = nil
						end
					else
						if v and v.box then
							pcall(function()
								-- upvalues: v (ref)
								v.box:Remove()
							end)
						end

						t17[k] = nil
					end
				else
					if v and v.box then
						pcall(function()
							-- upvalues: v (ref)
							v.box:Remove()
						end)
					end

					t17[k] = nil
				end
			end
		end)
	end
	local function u130()
		-- upvalues: t9 (ref), u48 (ref), LocalPlayer (ref), u52 (ref), u43 (ref), t15 (ref), u123 (ref), u119 (ref), u44 (ref), t16 (ref), u125 (ref), u120 (ref), u45 (ref), t17 (ref), u126 (ref), u121 (ref), u46 (ref), t18 (ref), u124 (ref), u122 (ref), u49 (ref), t19 (ref), u117 (ref), u116 (ref), Players (ref)
		for _, v in ipairs(t9) do
			if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
				local v236 = true
				local v237 = true

				if u48 and LocalPlayer.Team and v.Team == LocalPlayer.Team then
					v236 = false
				end

				if u52 and LocalPlayer.Team and v.Team == LocalPlayer.Team then
					v237 = false
				end

				if not v236 then
					if t15[v] then
						u119(v)
					end

					if t16[v] then
						u120(v)
					end

					if t17[v] then
						u121(v)
					end

					if t18[v] then
						u122(v)
					end
				else
					if not u43 or t15[v] then
						if not u43 and t15[v] then
							u119(v)
						end
					else
						u123(v)
					end

					if not u44 or t16[v] then
						if not u44 and t16[v] then
							u120(v)
						end
					else
						u125(v)
					end

					if not u45 or t17[v] then
						if not u45 and t17[v] then
							u121(v)
						end
					else
						u126(v)
					end

					if not u46 or t18[v] then
						if not u46 and t18[v] then
							u122(v)
						end
					else
						u124(v)
					end
				end

				if not v237 then
					if t19[v] then
						u116(v)
					end
				elseif not u49 or t19[v] then
					if not u49 and t19[v] then
						u116(v)
					end
				else
					u117(v)
				end
			end
		end

		for k, _ in pairs(t15) do
			if not k or not k.Parent or not Players:FindFirstChild(k.Name) then
				u119(k)
			end
		end

		for k, _ in pairs(t16) do
			if not k or not k.Parent or not Players:FindFirstChild(k.Name) then
				u120(k)
			end
		end

		for k, _ in pairs(t17) do
			if not k or not k.Parent or not Players:FindFirstChild(k.Name) then
				u121(k)
			end
		end

		for k, _ in pairs(t18) do
			if not k or not k.Parent or not Players:FindFirstChild(k.Name) then
				u122(k)
			end
		end

		for k, _ in pairs(t19) do
			if not k or not k.Parent or not Players:FindFirstChild(k.Name) then
				u116(k)
			end
		end
	end
	local function u131()
		-- upvalues: t15 (ref), color3_2 (ref), t16 (ref), t17 (ref), t18 (ref)
		for _, v in pairs(t15) do
			for _, v9 in ipairs(v) do
				if v9.line then
					v9.line.Color = color3_2
				end
			end
		end

		for _, v in pairs(t16) do
			if v.dot then
				v.dot.Color = color3_2
			end
		end

		for _, v in pairs(t17) do
			if v.box then
				v.box.Color = color3_2
			end
		end

		for _, v in pairs(t18) do
			for _, v10 in ipairs(v) do
				if v10 then
					v10.FillColor = color3_2
					v10.OutlineColor = color3_2
				end
			end
		end
	end

	t21.ESPTab:Section({
		Title = "ESP Features"
	})
	t21.ESPTab:Toggle({
		Title = "Skeleton ESP",
		Desc = "Show player skeleton outlines",
		Icon = "user",
		Value = false,
		Callback = function(p67)
			-- upvalues: u43 (ref), u119 (ref)
			u43 = p67

			if not p67 then
				u119()
			end
		end
	})
	t21.ESPTab:Toggle({
		Title = "Head ESP",
		Desc = "Show dots on player heads",
		Icon = "circle",
		Value = false,
		Callback = function(p68)
			-- upvalues: u44 (ref), u120 (ref)
			u44 = p68

			if not p68 then
				u120()
			end
		end
	})
	t21.ESPTab:Toggle({
		Title = "Box ESP (Performance Heavy)",
		Desc = "Show boxes around players (Not Recommended)",
		Icon = "square",
		Value = false,
		Callback = function(p69)
			-- upvalues: u45 (ref), u121 (ref)
			u45 = p69

			if not p69 then
				u121()
			end
		end
	})
	t21.ESPTab:Toggle({
		Title = "Chams ESP",
		Desc = "Highlight entire player models",
		Icon = "sparkles",
		Value = false,
		Callback = function(p70)
			-- upvalues: u46 (ref), u122 (ref)
			u46 = p70

			if not p70 then
				u122()
			end
		end
	})
	t21.ESPTab:Toggle({
		Title = "Team Check",
		Desc = "Don't show ESP on teammates",
		Icon = "users",
		Value = false,
		Callback = function(p71)
			-- upvalues: u48 (ref), Players (ref), LocalPlayer (ref), u119 (ref), u120 (ref), u121 (ref), u122 (ref)
			u48 = p71

			if p71 then
				for _, v in ipairs(Players:GetPlayers()) do
					if v ~= LocalPlayer and LocalPlayer.Team and v.Team == LocalPlayer.Team then
						u119(v)
						u120(v)
						u121(v)
						u122(v)
					end
				end
			end
		end
	})
	t21.ESPTab:Colorpicker({
		Title = "ESP Color",
		Desc = "Color of all ESP elements",
		Default = color3_2,
		Callback = function(p72)
			-- upvalues: color3_2 (ref), u131 (ref)
			color3_2 = p72
			u131()
		end
	})
	t21.CooldownTab:Section({
		Title = "Weapon Cooldowns"
	})
	t21.CooldownTab:Paragraph({
		Title = "Coming Soon!",
		Desc = "Cooldown bypass features are currently in development.",
		Color = "Orange",
		Image = "clock"
	})
	t21.EmotesTab:Section({
		Title = "Animation Controls"
	})
	t21.EmotesTab:Paragraph({
		Title = "Emote Instructions",
		Desc = "Click emote and get free emote simple as that ngl",
		Color = "Blue",
		Image = "info"
	})
	t21.EmotesTab:Button({
		Title = "Rocky Step",
		Desc = "Play the Rocky Step emote animation",
		Callback = function()
			-- upvalues: u98 (ref), u3 (ref)
			u98("rbxassetid://17493148164")
			u3:Notify({
				Title = "Animation Started",
				Content = "Playing Rocky Step emote! Move to stop.",
				Icon = "music",
				Duration = 3
			})
		end
	})
	t21.EmotesTab:Button({
		Title = "Zombie Walk",
		Desc = "Play the Zombie Walk animation",
		Callback = function()
			-- upvalues: u98 (ref), u3 (ref)
			u98("rbxassetid://130586820736295")
			u3:Notify({
				Title = "Animation Started",
				Content = "Playing Zombie Walk! Move to stop.",
				Icon = "music",
				Duration = 3
			})
		end
	})
	t21.EmotesTab:Button({
		Title = "Russian Kicks",
		Desc = "Play the Russian Kicks dance animation",
		Callback = function()
			-- upvalues: u98 (ref), u3 (ref)
			u98("rbxassetid://17467252077")
			u3:Notify({
				Title = "Animation Started",
				Content = "Playing Russian Kicks! Move to stop.",
				Icon = "music",
				Duration = 3
			})
		end
	})

	local function u132()
		-- upvalues: LocalPlayer (ref), BodyVelocity (ref), RunService (ref), u39 (ref), CurrentCamera (ref), UserInputService (ref), n12 (ref), t12 (ref)
		if LocalPlayer.Character then
			local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

			if Humanoid then
				Humanoid.PlatformStand = true

				local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart then
					if BodyVelocity then
						BodyVelocity:Destroy()
					end

					BodyVelocity = Instance.new("BodyVelocity")
					BodyVelocity.Velocity = Vector3.new(0, 0, 0)
					BodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
					BodyVelocity.Parent = HumanoidRootPart

					local connection = nil

					connection = RunService.Heartbeat:Connect(function()
						-- upvalues: u39 (ref), LocalPlayer (ref), HumanoidRootPart (ref), BodyVelocity (ref), connection (ref), Humanoid (ref), CurrentCamera (ref), UserInputService (ref), n12 (ref)
						if u39 and (LocalPlayer.Character and HumanoidRootPart.Parent and BodyVelocity) then
							local CurrentCameraCFrame = CurrentCamera.CFrame
							local vector3 = Vector3.new()

							if UserInputService:IsKeyDown(Enum.KeyCode.W) then
								vector3 = vector3 + CurrentCameraCFrame.LookVector
							end

							if UserInputService:IsKeyDown(Enum.KeyCode.S) then
								vector3 = vector3 - CurrentCameraCFrame.LookVector
							end

							if UserInputService:IsKeyDown(Enum.KeyCode.D) then
								vector3 = vector3 + CurrentCameraCFrame.RightVector
							end

							if UserInputService:IsKeyDown(Enum.KeyCode.A) then
								vector3 = vector3 - CurrentCameraCFrame.RightVector
							end

							if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
								vector3 = vector3 + Vector3.new(0, 1, 0)
							end

							if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
								vector3 = vector3 - Vector3.new(0, 1, 0)
							end

							if not (vector3.Magnitude > 0) then
								BodyVelocity.Velocity = Vector3.new(0, 0, 0)
							else
								BodyVelocity.Velocity = vector3.Unit * n12
							end

							return
						end

						if BodyVelocity then
							BodyVelocity:Destroy()
							BodyVelocity = nil
						end

						if connection then
							connection:Disconnect()
						end

						if Humanoid then
							Humanoid.PlatformStand = false
						end
					end)
					table.insert(t12, connection)

					return
				end

				return
			end

			return
		end
	end
	local function u133()
		-- upvalues: LocalPlayer (ref), BodyVelocity (ref), t12 (ref)
		if LocalPlayer.Character then
			local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

			if Humanoid then
				Humanoid.PlatformStand = false
			end

			local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				for _, v in ipairs(HumanoidRootPart:GetChildren()) do
					if v:IsA("BodyVelocity") then
						v:Destroy()
					end
				end
			end
		end

		if BodyVelocity then
			BodyVelocity:Destroy()
			BodyVelocity = nil
		end

		for _, v in ipairs(t12) do
			if v and v.Connected then
				v:Disconnect()
			end
		end

		t12 = {}
	end

	t21.ExtraTab:Section({
		Title = "Movement"
	})
	t21.ExtraTab:Toggle({
		Title = "Flight (Ass)",
		Desc = "Im working on it :(",
		Icon = "plane",
		Value = false,
		Callback = function(p73)
			-- upvalues: u39 (ref), u132 (ref), u133 (ref)
			u39 = p73

			if not u39 then
				u133()
			else
				u132()
			end
		end
	})
	t21.ExtraTab:Slider({
		Title = "Flight Speed",
		Desc = "Speed of flight movement",
		Value = {
			Min = 10,
			Max = 200,
			Default = 50
		},
		Step = 5,
		Callback = function(p74)
			-- upvalues: n12 (ref)
			n12 = p74
		end
	})
	t21.ExtraTab:Section({
		Title = "Information"
	})
	t21.ExtraTab:Paragraph({
		Title = "Script Info",
		Desc = "Ez Win v3 Performance Enhanced with Tracers, Silent Aim, and Prediction AI\nConverted to WindUI with advanced diagnostics\nPress F4 to toggle UI, F9 to toggle debug overlay",
		Color = "Blue",
		Image = "info"
	})
	t21.ExtraTab:Paragraph({
		Title = "IMPORTANT NOTICE",
		Desc = "If you are on an unsupported executor you may experience crashes or have be very buggy, we have tried our best to optimize for the lower sUNC executors like Solara, Xeno and have got decent performance but becareful!",
		Color = "Red",
		Image = "alert-triangle"
	})

	local t31 = {
		mainFPS = 0,
		espFPS = 0,
		playersRendered = 0,
		pooledObjects = 0,
		frameTime = 0,
		lastUpdateTime = 0
	}

	t21.PerformanceTab:Section({
		Title = "Performance Monitoring"
	})

	local u135 = t21.PerformanceTab:Paragraph({
		Title = "Live Performance Stats",
		Desc = "FPS: 0 | Frame Time: 0.00 ms\nESP FPS: 0 | Players Rendered: 0\nPooled Objects: 0 | CPU Load: 0%",
		Color = "Green",
		Image = "activity"
	})
	local connection = RunService.Heartbeat:Connect(function(dt)
		-- upvalues: t5 (ref), u135 (ref), n1 (ref), Players (ref)
		t5:UpdatePerformanceMetrics(dt)
		u135:SetDesc(string.format("FPS: %d | Frame Time: %.2f ms\nESP FPS: %d | CPU: %d%% | Players: %d", t5.currentFPS, t5.frameTime, n1, t5.cpuLoad, #Players:GetPlayers()))
	end)
	local connection2 = RunService.Heartbeat:Connect(function()
		-- upvalues: t31 (ref), t5 (ref), n1 (ref), t9 (ref), t6 (ref), t7 (ref), t8 (ref), u135 (ref)
		local timestamp = tick()

		if timestamp - t31.lastUpdateTime >= 0.5 then
			t31.lastUpdateTime = timestamp
			t31.mainFPS = t5.currentFPS
			t31.espFPS = n1
			t31.playersRendered = #t9
			t31.pooledObjects = #t6 + #t7 + #t8
			t31.frameTime = t5.frameTime

			local u293 = string.format("FPS: %d | Frame Time: %.2f ms\nESP FPS: %d | Players Rendered: %d\nPooled Objects: %d | CPU Load: %d%%", t31.mainFPS, t31.frameTime, t31.espFPS, t31.playersRendered, t31.pooledObjects, t5.cpuLoad)

			pcall(function()
				-- upvalues: u135 (ref), u293 (ref)
				if not u135 or not u135.SetDesc then
					if u135 and u135.UpdateDesc then
						u135:UpdateDesc(u293)
					end
				else
					u135:SetDesc(u293)
				end
			end)
		end
	end)

	t21.PerformanceTab:Section({
		Title = "Optimization Settings"
	})
	t21.PerformanceTab:Slider({
		Title = "LOD Distance",
		Desc = "Use simplified rendering beyond this distance (studs)",
		Value = {
			Min = 50,
			Max = 500,
			Default = 150
		},
		Step = 25,
		Callback = function(p75)
			-- upvalues: n4 (ref), t5 (ref)
			n4 = p75
			t5:Log("DEBUG", string.format("LOD distance set to %d studs", p75), "Performance")
		end
	})
	t21.PerformanceTab:Slider({
		Title = "ESP Tick Rate",
		Desc = "ESP update frequency (FPS)",
		Value = {
			Min = 10,
			Max = 60,
			Default = 30
		},
		Step = 5,
		Callback = function(p76)
			-- upvalues: n1 (ref), t5 (ref)
			n1 = p76
			t5:Log("INFO", string.format("ESP tick rate set to %d FPS", p76), "Performance")
		end
	})
	t21.PerformanceTab:Button({
		Title = "Clear Object Pools",
		Desc = "Clear and reset all drawing object pools",
		Callback = function()
			-- upvalues: t6 (ref), t7 (ref), t8 (ref), t5 (ref), u3 (ref)
			for _, v in ipairs(t6) do
				if v then
					v:Remove()
				end
			end

			for _, v in ipairs(t7) do
				if v then
					v:Remove()
				end
			end

			for _, v in ipairs(t8) do
				if v then
					v:Remove()
				end
			end

			t6 = {}
			t7 = {}
			t8 = {}
			t5:Log("INFO", "Object pools cleared and reset", "Performance")
			u3:Notify({
				Title = "Object Pools Cleared",
				Content = "All drawing object pools have been reset",
				Icon = "trash-2",
				Duration = 3
			})
		end
	})
	t21.PerformanceTab:Section({
		Title = "Diagnostics & Logging"
	})
	t21.PerformanceTab:Toggle({
		Title = "Show Debug Overlay",
		Desc = "Display diagnostic information overlay",
		Icon = "monitor",
		Value = false,
		Callback = function(p77)
			-- upvalues: t5 (ref), u70 (ref)
			t5.showDebugOverlay = p77

			if not p77 then
				if not u70 then
					t5:DestroyOverlay()
				end

				t5:Log("INFO", "Debug overlay disabled", "Diagnostics")
			else
				if not t5.overlay then
					t5:CreateDebugOverlay()
				end

				t5:Log("INFO", "Debug overlay enabled", "Diagnostics")
			end
		end
	})
	t21.PerformanceTab:Toggle({
		Title = "Log To Console",
		Desc = "Output diagnostic messages to console",
		Icon = "terminal",
		Value = false,
		Callback = function(p78)
			-- upvalues: t5 (ref)
			t5.logToConsole = p78
			t5:Log("INFO", p78 and "Console logging enabled" or "Console logging disabled", "Diagnostics")
		end
	})
	t21.PerformanceTab:Toggle({
		Title = "Save Session Log",
		Desc = "Keep session log in memory for export",
		Icon = "save",
		Value = false,
		Callback = function(p79)
			-- upvalues: t5 (ref)
			t5.saveSessionLog = p79
			t5:Log("INFO", p79 and "Session logging enabled" or "Session logging disabled", "Diagnostics")
		end
	})
	t21.PerformanceTab:Dropdown({
		Title = "Debug Verbosity",
		Desc = "Control how much telemetry data is retained",
		Default = "Medium",
		Values = {
			"Low",
			"Medium",
			"High"
		},
		Callback = function(p80)
			-- upvalues: t5 (ref)
			t5.debugVerbosity = p80
			t5:Log("INFO", string.format("Debug verbosity set to %s", p80), "Diagnostics")
		end
	})
	t21.PerformanceTab:Button({
		Title = "Clear Session Log",
		Desc = "Clear all stored log entries",
		Icon = "trash-2",
		Callback = function()
			-- upvalues: t5 (ref), u3 (ref)
			t5:ClearSessionLog()
			u3:Notify({
				Title = "Session Log Cleared",
				Content = "All log entries have been removed",
				Icon = "trash-2",
				Duration = 2
			})
		end
	})
	t21.PerformanceTab:Button({
		Title = "Export Session Log",
		Desc = "Save session log to file or clipboard",
		Icon = "download",
		Callback = function()
			-- upvalues: t5 (ref)
			t5:ExportSessionLog()
		end
	})

	local function u138()
		-- upvalues: LocalPlayer (ref), t9 (ref), u56 (ref), u97 (ref), s2 (ref), u66 (ref), t20 (ref), CurrentCamera (ref), UserInputService (ref)
		local huge = math.huge
		local v388 = nil
		local v389 = nil

		if LocalPlayer.Character then
			for _, v in ipairs(t9) do
				if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
					local Humanoid = v.Character:FindFirstChildOfClass("Humanoid")

					if Humanoid and Humanoid.Health > 0 and ((not u56 or not LocalPlayer.Team or v.Team ~= LocalPlayer.Team) and u97(v)) then
						local s2_3 = v.Character:FindFirstChild(s2)

						if s2_3 then
							local s2_3Position = s2_3.Position

							if u66 then
								local PredictedAimPosition = t20:GetPredictedAimPosition(v)

								if PredictedAimPosition then
									s2_3Position = PredictedAimPosition
								end
							end

							local v396, v397 = CurrentCamera:WorldToViewportPoint(s2_3Position)

							if v397 and v396.Z > 0 then
								local MouseLocation = UserInputService:GetMouseLocation()
								local Magnitude = (Vector2.new(v396.X, v396.Y) - Vector2.new(MouseLocation.X, MouseLocation.Y)).Magnitude

								if Magnitude < huge then
									huge = Magnitude
									v388 = v
									v389 = v396
								end
							end
						end
					end
				end
			end

			return v388, v389
		end
	end
	local function u139()
		-- upvalues: LocalPlayer (ref), u61 (ref), UserInputService (ref), n16 (ref), t9 (ref), u56 (ref), u58 (ref), u97 (ref), s2 (ref), u66 (ref), t20 (ref), CurrentCamera (ref)
		local t32 = {}

		if LocalPlayer.Character and u61 then
			local MouseLocation = UserInputService:GetMouseLocation()
			local v460 = tonumber(n16) or 0

			for _, v in ipairs(t9) do
				if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
					local Humanoid = v.Character:FindFirstChildOfClass("Humanoid")

					if Humanoid and Humanoid.Health > 0 and (not u56 or not LocalPlayer.Team or v.Team ~= LocalPlayer.Team) and (not u58 or u97(v)) then
						local s2_4 = v.Character:FindFirstChild(s2)

						if s2_4 then
							local s2_4Position = s2_4.Position

							if u66 then
								local PredictedAimPosition = t20:GetPredictedAimPosition(v)

								if PredictedAimPosition then
									s2_4Position = PredictedAimPosition
								end
							end

							local v467, _ = CurrentCamera:WorldToViewportPoint(s2_4Position)

							if v467.Z > 0 then
								local Magnitude = (Vector2.new(v467.X, v467.Y) - Vector2.new(MouseLocation.X, MouseLocation.Y)).Magnitude

								if Magnitude <= v460 then
									table.insert(t32, {
										player = v,
										screenPos = v467,
										distance = Magnitude
									})
								end
							end
						end
					end
				end
			end

			table.sort(t32, function(p81, p82)
				return p81.distance < p82.distance
			end)

			return t32
		end

		return {}
	end

	u17:SelectTab(1)

	local function v140(p83)
		-- upvalues: LocalPlayer (ref), u130 (ref), u119 (ref), u120 (ref), u121 (ref), u122 (ref), u116 (ref)
		if LocalPlayer ~= p83 then
			p83.CharacterAdded:Connect(function(_)
				-- upvalues: u130 (ref)
				task.wait(1)
				u130()
			end)
			p83.CharacterRemoving:Connect(function()
				-- upvalues: u119 (ref), p83 (ref), u120 (ref), u121 (ref), u122 (ref), u116 (ref)
				u119(p83)
				u120(p83)
				u121(p83)
				u122(p83)
				u116(p83)
			end)
		end
	end

	for _, v in ipairs(Players:GetPlayers()) do
		v140(v)
	end

	Players.PlayerAdded:Connect(v140)
	Players.PlayerRemoving:Connect(function(player)
		-- upvalues: t15 (ref), u119 (ref), t16 (ref), u120 (ref), t17 (ref), u121 (ref), t18 (ref), u122 (ref), t19 (ref), u116 (ref), t11 (ref), t10 (ref), t20 (ref)
		if t15[player] then
			u119(player)
		end

		if t16[player] then
			u120(player)
		end

		if t17[player] then
			u121(player)
		end

		if t18[player] then
			u122(player)
		end

		if t19[player] then
			u116(player)
		end

		t11[player] = nil
		t10[player] = nil

		if t20.playerData[player] then
			t20.playerData[player] = nil
		end
	end)

	if LocalPlayer then
		LocalPlayer.CharacterAdded:Connect(function(_)
			-- upvalues: u39 (ref), u132 (ref), u130 (ref)
			task.wait(1)

			if u39 then
				task.wait(0.5)
				u132()
			end

			u130()
		end)
	end

	UserInputService.InputBegan:Connect(function(input, p86)
		-- upvalues: u53 (ref), MouseButton2 (ref), u57 (ref), t5 (ref), u3 (ref), u17 (ref), u70 (ref)
		if not p86 then
			if u53 then
				local v457 = false

				if input.UserInputType ~= MouseButton2 then
					if input.KeyCode == MouseButton2 then
						v457 = true
					end
				else
					v457 = true
				end

				if v457 then
					u57 = not u57
					t5:Log("INFO", string.format("Silent Aim %s", u57 and "activated" or "deactivated"), "Aimbot")
					u3:Notify({
						Title = u57 and "Silent Aim ON" or "Silent Aim OFF",
						Content = u57 and "Now tracking targets" or "Tracking stopped",
						Icon = u57 and "crosshair" or "square",
						Duration = 2
					})
				end
			end

			if input.KeyCode == Enum.KeyCode.F4 then
				u17:SetToggleKey(Enum.KeyCode.F4)
			end

			if input.KeyCode == Enum.KeyCode.F9 then
				t5.showDebugOverlay = not t5.showDebugOverlay

				if not t5.showDebugOverlay then
					if not u70 then
						t5:DestroyOverlay()
					end
				elseif not t5.overlay then
					t5:CreateDebugOverlay()
				end

				t5:Log("INFO", string.format("Debug overlay %s via F9 hotkey", t5.showDebugOverlay and "enabled" or "disabled"), "Diagnostics")
			end

			return
		end
	end);
	(function()
		-- upvalues: connection2 (ref), connection (ref), RunService (ref), t5 (ref), n5 (ref), n6 (ref), n7 (ref), u36 (ref), u115 (ref), u61 (ref), u102 (ref), u77 (ref), u106 (ref), n1 (ref), u43 (ref), u127 (ref), u44 (ref), u128 (ref), u45 (ref), u129 (ref), u49 (ref), u118 (ref), u130 (ref), t9 (ref), t15 (ref), n2 (ref), u96 (ref), u53 (ref), u57 (ref), LocalPlayer (ref), u139 (ref), u138 (ref), UserInputService (ref), u66 (ref), t20 (ref), CurrentCamera (ref), n19 (ref), n14 (ref), t31 (ref), t6 (ref), t7 (ref), t8 (ref), u135 (ref), u70 (ref)
		if connection2 then
			connection2:Disconnect()
		end

		connection = RunService.Heartbeat:Connect(function(dt)
			-- upvalues: t5 (ref), n5 (ref), n6 (ref), n7 (ref), u36 (ref), u115 (ref), u61 (ref), u102 (ref), u77 (ref), u106 (ref), n1 (ref), u43 (ref), u127 (ref), u44 (ref), u128 (ref), u45 (ref), u129 (ref), u49 (ref), u118 (ref), u130 (ref), t9 (ref), t15 (ref), n2 (ref), u96 (ref), u53 (ref), u57 (ref), LocalPlayer (ref), u139 (ref), u138 (ref), UserInputService (ref), u66 (ref), t20 (ref), CurrentCamera (ref), n19 (ref), n14 (ref), t31 (ref), t6 (ref), t7 (ref), t8 (ref), u135 (ref), u70 (ref)
			t5:UpdatePerformanceMetrics(dt)
			n5 = n5 + 1
			n6 = n6 + 1
			n7 = n7 + 1

			if u36 then
				u115()
			end

			if u61 then
				u102()
			end

			if u77 then
				u106()
			end

			if n6 >= 60 / n1 then
				n6 = 0

				if u43 then
					u127()
				end

				if u44 then
					u128()
				end

				if u45 then
					u129()
				end

				if u49 then
					u118()
				end

				u130()

				if t5.debugVerbosity == "High" then
					t5:Log("DEBUG", string.format("ESP Update - Players: %d, Distance Culled: %d", #t9, #t9 - (Object.keys(t15).length or 0)), "Performance")
				end
			end

			if n7 >= 60 / n2 then
				n7 = 0
				u96()
			end

			if u53 and u57 and LocalPlayer.Character then
				local v523 = nil
				local v524 = nil

				if not u61 then
					v523, v524 = u138()
				else
					local v525 = u139()

					if #v525 > 0 then
						v523 = v525[1].player
						v524 = v525[1].screenPos
					end
				end

				if v523 and v524 then
					local MouseLocation = UserInputService:GetMouseLocation()
					local vector2 = Vector2.new(v524.X, v524.Y)

					if u66 then
						local PredictedAimPosition = t20:GetPredictedAimPosition(v523)

						if PredictedAimPosition then
							local v529, v530 = CurrentCamera:WorldToViewportPoint(PredictedAimPosition)

							if v530 and v529.Z > 0 then
								local v531 = n19 / 100

								vector2 = Vector2.new(v529.X * v531 + v524.X * (1 - v531), v529.Y * v531 + v524.Y * (1 - v531))
								t5:Log("DEBUG", string.format("Applied prediction blend (%.0f%%) to target %s", n19, v523.Name), "Aimbot")
							end
						end
					end

					local u532 = (vector2.X - MouseLocation.X) * (n14 / 100)
					local u533 = (vector2.Y - MouseLocation.Y) * (n14 / 100)
					local v534 = false

					if not getgenv or not getgenv().mousemoverel then
						if mousemoverel then
							v534 = pcall(function()
								-- upvalues: u532 (ref), u533 (ref)
								mousemoverel(u532, u533)
							end)
						end
					else
						v534 = pcall(function()
							-- upvalues: u532 (ref), u533 (ref)
							getgenv().mousemoverel(u532, u533)
						end)
					end

					if not v534 and mouse1move then
						v534 = pcall(function()
							-- upvalues: vector2 (ref)
							mouse1move(vector2.X, vector2.Y)
						end)
					end

					if not v534 and getgenv and getgenv().mouse then
						v534 = pcall(function()
							-- upvalues: MouseLocation (ref), u532 (ref), u533 (ref)
							local mouse = getgenv().mouse

							mouse.X = MouseLocation.X + u532
							mouse.Y = MouseLocation.Y + u533
						end)
					end

					if not v534 then
						local VirtualInputManager = game:GetService("VirtualInputManager")

						if VirtualInputManager then
							pcall(function()
								-- upvalues: VirtualInputManager (ref), vector2 (ref)
								VirtualInputManager:SendMouseMoveEvent(vector2.X, vector2.Y, game)
							end)
						end
					end
				end
			end

			if n5 % 60 == 0 then
				t31.mainFPS = t5.currentFPS
				t31.espFPS = n1
				t31.playersRendered = #t9
				t31.pooledObjects = #t6 + #t7 + #t8
				t31.frameTime = t5.frameTime

				if u135 then
					string.format("FPS: %d | Frame Time: %.2f ms\nESP FPS: %d | Players Rendered: %d\nPooled Objects: %d | CPU Load: %d%%", t5.currentFPS, t5.frameTime, n1, #t9, #t6 + #t7 + #t8, t5.cpuLoad)
					pcall(function()
					end)
				end
			end

			if t5.showDebugOverlay or u70 then
				t5:UpdateOverlay()
			end
		end)
	end)()
	game:BindToClose(function()
		-- upvalues: t5 (ref), u119 (ref), u120 (ref), u121 (ref), u122 (ref), u116 (ref), u103 (ref), u107 (ref), t6 (ref), t7 (ref), t8 (ref), connection (ref), u112 (ref), u109 (ref), u39 (ref), u133 (ref), u114 (ref)
		local v349 = t5
		local Log = v349.Log

		v = "System"
		Log(v349, "INFO", "Script unloading - performing cleanup", v)
		u119()
		u120()
		u121()
		u122()
		u116()
		u103()
		u107()

		for _, v in ipairs(t6) do
			if v then
				pcall(function()
					-- upvalues: v (ref)
					v:Remove()
				end)
			end
		end

		for _, v in ipairs(t7) do
			if v then
				pcall(function()
					-- upvalues: v (ref)
					v:Remove()
				end)
			end
		end

		for _, v in ipairs(t8) do
			if v then
				pcall(function()
					-- upvalues: v (ref)
					v:Remove()
				end)
			end
		end

		if connection then
			connection:Disconnect()
		end

		u112()
		StopAutoShoot()
		u109()

		if u39 then
			u133()
		end

		u114()
		t5:DestroyOverlay()
		t5:Log("INFO", "Cleanup completed successfully", "System")
	end)
	u17:SetToggleKey(Enum.KeyCode.F4)
	task.spawn(function()
		-- upvalues: t5 (ref), u94 (ref), u130 (ref), u61 (ref), u101 (ref)
		task.wait(2)
		t5:Log("INFO", "Initializing system components", "System")
		u94()
		u130()

		if u61 then
			u101()
		end

		t5:Log("INFO", string.format("Performance monitoring started - Sampling rate: %.1fs", t5.samplingRate), "Performance")
		t5:Log("INFO", "All systems initialized successfully", "System")
	end)
	u3:Notify({
		Title = "Ez-Win V3 Performance Loaded!",
		Content = "Press F4 to toggle UI, F9 for debug overlay. Enjoy responsibly!",
		Icon = "check",
		Duration = 5
	})
	t5:Log("INFO", "=== PERFORMANCE DEBUG INFO ===", "System")
	t5:Log("INFO", string.format("Main Tick Rate: %d FPS", 60), "Performance")
	t5:Log("INFO", string.format("ESP Tick Rate: %d FPS", n1), "Performance")
	t5:Log("INFO", string.format("Visibility Tick Rate: %d FPS", n2), "Performance")
	t5:Log("INFO", string.format("Max ESP Distance: %d studs", n3), "Performance")
	t5:Log("INFO", string.format("LOD Distance: %d studs", n4), "Performance")
	t5:Log("INFO", string.format("Object Pools Initialized - Lines: %d, Circles: %d, Quads: %d", #t6, #t7, #t8), "Performance")
	t5:Log("INFO", string.format("Executor: %s (%s) - Detection timestamp: %s", u13, u14 and "Supported" or "Unsupported", u15), "System")
	--[[t5:Log("WARNING", "THIS SYSTEM IS FOR COMPATIBILITY, DIAGNOSTICS, AND TESTING ONLY. " .. "MUST NOT BE USED TO CIRCUMVENT ANTI-CHEAT SYSTEMS. " .. "Use responsibly and follow game rules and terms of service.", "System")
	print("Press F4 To Toggle UI :D")]]

	return
end

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "WindUI Error",
	Text = "Failed to load UI: " .. tostring(result),
	Duration = 6
})
