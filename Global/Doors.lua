if game.Players.LocalPlayer.PlayerGui:FindFirstChild("LoadingUI") and game.Players.LocalPlayer.PlayerGui.LoadingUI.Enabled == true then
	repeat
		task.wait()
	until game.Players.LocalPlayer.PlayerGui.LoadingUI.Enabled == false
end

Screech = false
ClutchHeart = false

local u1 = nil

u1 = hookmetamethod(game, "__namecall", newcclosure(function(p1, ...)
	-- upvalues: u1 (ref)
	local t1 = { ... }
	local v94 = getnamecallmethod()

	if tostring(p1) ~= "Screech" or (v94 ~= "FireServer" or Screech ~= true) then
		if tostring(p1) ~= "ClutchHeartbeat" or v94 ~= "FireServer" or ClutchHeart ~= true then
			return u1(p1, ...)
		end

		t1[2] = true

		return u1(p1, unpack(t1))
	end

	t1[1] = true

	return u1(p1, unpack(t1))
end))
workspace.DescendantAdded:Connect(function(descendant)
	if descendant:IsA("Model") and descendant.Name == "Screech" then
		descendant:Destroy()
	end
end)

local EntityModules = game:GetService("ReplicatedStorage").ModulesClient.EntityModules
local Floor = game.ReplicatedStorage:WaitForChild("GameData"):WaitForChild("Floor")
local v4 = Floor.Value == "Mines"
local v5 = Floor.Value == "Hotel"
local v6 = Floor.Value == "Backdoor"
local v7 = Floor.Value == "Garden"

function Distance(p2)
	if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return
	end

	return (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - p2).Magnitude
end

_G.GetOldBright = {
	Brightness = game.Lighting.Brightness,
	ClockTime = game.Lighting.ClockTime,
	FogEnd = game.Lighting.FogEnd,
	GlobalShadows = game.Lighting.GlobalShadows,
	OutdoorAmbient = game.Lighting.OutdoorAmbient
}

local u8 = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local v9 = u8:CreateWindow({
	Title = "Axiora Hub - Door",
	Icon = "door-open",
	Folder = "Article Hub",
	Size = UDim2.fromOffset(700, 320),
	Transparent = true,
	Theme = "Dark",
	SideBarWidth = 200
})

Tabs = {
	Tab = v9:Tab({
		Title = "Main"
	}),
	Tab1 = v9:Tab({
		Title = "Misc"
	}),
	Tab2 = v9:Tab({
		Title = "Esp"
	}),
	Info = v9:Tab({
		Title = "Information"
	})
}

local Tab = Tabs.Tab

Tab:Toggle({
	Title = "Fullbright",
	Type = "Toggle",
	Default = false,
	Callback = function(p3)
		_G.FullBright = p3

		while _G.FullBright do
			game.Lighting.Brightness = 2
			game.Lighting.ClockTime = 14
			game.Lighting.FogEnd = 100000
			game.Lighting.GlobalShadows = false
			game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
			task.wait()
		end

		for k, v in pairs(_G.GetOldBright) do
			game.Lighting[k] = v
		end
	end
})
Tab:Toggle({
	Title = "No Fog",
	Type = "Toggle",
	Default = false,
	Callback = function(p4)
		_G.Nofog = p4

		while _G.Nofog do
			game:GetService("Lighting").FogStart = 100000
			game:GetService("Lighting").FogEnd = 200000

			for _, v in pairs(game:GetService("Lighting"):GetChildren()) do
				if v.ClassName == "Atmosphere" then
					v.Density = 0
					v.Haze = 0
				end
			end

			task.wait()
		end

		game:GetService("Lighting").FogStart = 0
		game:GetService("Lighting").FogEnd = 1000

		for _, v in pairs(game:GetService("Lighting"):GetChildren()) do
			if v.ClassName == "Atmosphere" then
				v.Density = 0.3
				v.Haze = 1
			end
		end
	end
})
Tab:Toggle({
	Title = "Instant Prompt",
	Type = "Toggle",
	Default = false,
	Callback = function(p5)
		_G.NoCooldownProximity = p5

		if _G.NoCooldownProximity ~= true then
			if CooldownProximity then
				CooldownProximity:Disconnect()
				CooldownProximity = nil
			end
		else
			for _, v in pairs(workspace:GetDescendants()) do
				if v.ClassName == "ProximityPrompt" then
					v.HoldDuration = 0
				end
			end

			CooldownProximity = workspace.DescendantAdded:Connect(function(descendant)
				if _G.NoCooldownProximity == true and descendant:IsA("ProximityPrompt") then
					descendant.HoldDuration = 0
				end
			end)
		end
	end
})
Tab:Section({
	Title = "Anti",
	TextXAlignment = "Left",
	TextSize = 17
})
Tab:Toggle({
	Title = "Anti Screech",
	Type = "Toggle",
	Default = false,
	Callback = function(p6)
		_G.AntiScreech = p6
		Screech = p6
	end
})
Tab:Toggle({
	Title = "Auto Clutch Heart Win",
	Type = "Toggle",
	Default = false,
	Callback = function(p7)
		ClutchHeart = p7
	end
})
Tab:Toggle({
	Title = "Anti Halt",
	Type = "Toggle",
	Default = false,
	Callback = function(p8)
		-- upvalues: EntityModules (ref)
		_G.NoHalt = p8

		local v79 = EntityModules:FindFirstChild("Shade") or EntityModules:FindFirstChild("_Shade")

		if v79 then
			v79.Name = _G.NoHalt and "_Shade" or "Shade"
		end
	end
})
Tab:Toggle({
	Title = "Anti Eyes / Lookman",
	Type = "Toggle",
	Default = false,
	Callback = function(p9)
		_G.NoEyes = p9

		while _G.NoEyes do
			if (workspace:FindFirstChild("Eyes") or workspace:FindFirstChild("BackdoorLookman")) and game:GetService("ReplicatedStorage"):FindFirstChild("RemotesFolder") then
				game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("MotorReplication"):FireServer(-649)
			end

			task.wait()
		end
	end
})
Tab:Toggle({
	Title = "Inf Oxygen",
	Type = "Toggle",
	Default = false,
	Callback = function(p10)
		_G.ActiveInfOxygen = p10

		while _G.ActiveInfOxygen do
			if game.Players.LocalPlayer.Character:GetAttribute("Oxygen") then
				game.Players.LocalPlayer.Character:SetAttribute("Oxygen", 99999)
			end

			task.wait()
		end

		if game.Players.LocalPlayer.Character:GetAttribute("Oxygen") then
			game.Players.LocalPlayer.Character:SetAttribute("Oxygen", 100)
		end
	end
})

local Tab1 = Tabs.Tab1

Tab1:Dropdown({
	Title = "Choose Entity",
	Values = {
		"Rush",
		"Seek",
		"Eyes",
		"Window",
		"LookMan",
		"Giggle",
		"GloombatSwarm",
		"Ambush",
		"A-60",
		"A-120"
	},
	Value = { "Rush" },
	Multi = true,
	AllowNone = true,
	Callback = function(p11)
		_G.EntityChoose = p11
	end
})
Tab1:Toggle({
	Title = "Notification Entity",
	Type = "Toggle",
	Default = false,
	Callback = function(p12)
		-- upvalues: u8 (ref)
		_G.NotifyEntity = p12

		if not _G.NotifyEntity then
			if EntityChild then
				EntityChild:Disconnect()
				EntityChild = nil
			end
		else
			EntityChild = workspace.ChildAdded:Connect(function(child)
				-- upvalues: u8 (ref)
				for _, v in ipairs(_G.EntityChoose) do
					if child:IsA("Model") and child.Name:find(v) then
						repeat
							task.wait()
						until not child:IsDescendantOf(workspace) or game.Players.LocalPlayer:DistanceFromCharacter(child:GetPivot().Position) < 1000

						if child:IsDescendantOf(workspace) then
							u8:Notify({
								Title = v .. " Spawn!!",
								Duration = 5
							})

							if _G.NotifyEntityChat then
								local v214 = _G.ChatNotify or ""

								game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(v214 .. v .. " Spawn!!")
							end
						end
					end
				end
			end)
		end
	end
})

if v5 then
	Tab1:Toggle({
		Title = "Auto Get Code Library",
		Type = "Toggle",
		Default = false,
		Callback = function(p13)
			-- upvalues: u8 (ref)
			_G.NotifyEntity = p13

			if not _G.NotifyEntity then
				if Getpaper then
					Getpaper:Disconnect()
					Getpaper = nil
				end
			else
				local function u63(p14)
					local Hints = game.Players.LocalPlayer.PlayerGui:WaitForChild("PermUI"):WaitForChild("Hints")
					local t2 = {
						[1] = "_",
						[2] = "_",
						[3] = "_",
						[4] = "_",
						[5] = "_"
					}

					for _, v in pairs(p14:WaitForChild("UI"):GetChildren()) do
						if v:IsA("ImageLabel") and v.Name ~= "Image" then
							for _, v2 in pairs(Hints:GetChildren()) do
								if v2:IsA("ImageLabel") and v2.Visible and v.ImageRectOffset == v2.ImageRectOffset then
									t2[tonumber(v.Name)] = v2:FindFirstChild("TextLabel").Text
								end
							end
						end
					end

					return t2
				end
				local function u64(p15)
					-- upvalues: u63 (ref), u8 (ref)
					if p15:IsA("Tool") and p15.Name == "LibraryHintPaper" then
						local v182 = table.concat(u63(p15))

						if v182 then
							u8:Notify({
								Title = "Code: " .. v182,
								Duration = 5
							})

							if _G.NotifyEntityChat then
								if _G.ChatNotify then
									TextChat = _G.ChatNotify
								else
									TextChat = ""
								end

								if TextChat then
									game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(TextChat .. v182)
								end
							end

							if workspace:FindFirstChild("Padlock") and Distance(workspace.Padlock:GetPivot().Position) <= 30 and game:GetService("ReplicatedStorage"):FindFirstChild("RemotesFolder") then
								game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("LP"):FireServer(v182)
							end
						end
					end
				end

				Getpaper = game.Players.LocalPlayer.Character.ChildAdded:Connect(function(child)
					-- upvalues: u64 (ref)
					u64(child)
				end)
			end
		end
	})
end

Tab1:Input({
	Title = "Input Chat",
	Value = "",
	InputIcon = "speaker",
	Type = "Input",
	Placeholder = "Your Chat...",
	Callback = function(p16)
		_G.ChatNotify = p16
	end
})
Tab1:Toggle({
	Title = "Notification Chat",
	Type = "Toggle",
	Default = false,
	Callback = function(p17)
		_G.NotifyEntityChat = p17
	end
})
Tab1:Slider({
	Title = "Hiding Transparency",
	Step = 0.1,
	Value = {
		Min = 0,
		Max = 1,
		Default = 0.5
	},
	Callback = function(p18)
		_G.TransparencyHide = p18
	end
})
Tab1:Toggle({
	Title = "Transparency Hiding",
	Type = "Toggle",
	Default = false,
	Callback = function(p19)
		_G.HidingTransparency = p19

		while _G.HidingTransparency do
			if game.Players.LocalPlayer.Character:GetAttribute("Hiding") then
				for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
					if v:IsA("ObjectValue") and v.Name == "HiddenPlayer" and v.Value == game.Players.LocalPlayer.Character then
						local t3 = {}

						for _, v3 in pairs(v.Parent:GetChildren()) do
							if v3:IsA("BasePart") then
								v3.Transparency = _G.TransparencyHide or 0.5
								table.insert(t3, v3)
							end
						end

						repeat
							task.wait()

							for _, v8 in pairs(t3) do
								v8.Transparency = _G.TransparencyHide or 0.5
								task.wait()
							end
						until not game.Players.LocalPlayer.Character:GetAttribute("Hiding") or not _G.HidingTransparency

						for _, v10 in pairs(t3) do
							v10.Transparency = 0
							task.wait()
						end

						break
					end
				end
			end

			task.wait()
		end
	end
})
_G.Aura = {
	"ActivateEventPrompt",
	"AwesomePrompt",
	"FusesPrompt",
	"HerbPrompt",
	"LeverPrompt",
	"LootPrompt",
	"ModulePrompt",
	"SkullPrompt",
	"UnlockPrompt",
	"ValvePrompt"
}
Tab1:Toggle({
	Title = "Auto Loot",
	Type = "Toggle",
	Default = false,
	Callback = function(p20)
		_G.AutoLoot = p20

		if not _G.AutoLoot then
			if ChildAllNext then
				ChildAllNext:Disconnect()
				ChildAllNext = nil
			end

			if RemoveChild then
				RemoveChild:Disconnect()
				RemoveChild = nil
			end
		else
			lootables = {}

			local function u132(p21)
				if not table.find(lootables, p21) and p21.Name ~= "Groundskeeper" and p21:IsA("ProximityPrompt") and table.find(_G.Aura, p21.Name) then
					table.insert(lootables, p21)
				end
			end

			for _, v in ipairs(workspace:GetDescendants()) do
				if v:IsA("ProximityPrompt") then
					u132(v)
				end
			end

			ChildAllNext = workspace.DescendantAdded:Connect(function(descendant)
				-- upvalues: u132 (ref)
				if descendant:IsA("ProximityPrompt") then
					u132(descendant)
				end
			end)
			RemoveChild = workspace.DescendantRemoving:Connect(function(descendant)
				for i = #lootables, 1, -1 do
					if descendant == lootables[i] then
						table.remove(lootables, i)

						return
					end
				end
			end)
		end

		while _G.AutoLoot do
			for _, v in pairs(lootables) do
				if v:IsA("ProximityPrompt") and table.find(_G.Aura, v.Name) and ((v:GetAttribute("Interactions") == nil or v:GetAttribute("Interactions") <= 2) and Distance(v.Parent:GetPivot().Position) <= 12) then
					fireproximityprompt(v)
				end
			end

			task.wait(0.1)
		end
	end
})
Tab1:Slider({
	Title = "Walkspeed",
	Step = 1,
	Value = {
		Min = 16,
		Max = 21,
		Default = 16
	},
	Callback = function(p22)
		_G.WalkSpeedTp = p22
	end
})
Tab1:Toggle({
	Title = "WalkSpeed",
	Type = "Toggle",
	Default = false,
	Callback = function(p23)
		_G.SpeedWalk = p23

		while _G.SpeedWalk do
			if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.WalkSpeedTp
			end

			task.wait()
		end
	end
})

local Tab2 = Tabs.Tab2

if not v7 then
	Tab2:Toggle({
		Title = (not not v5 or v6) and "Esp Key / Lever" or v4 and "Esp Fuse",
		Type = "Toggle",
		Default = false,
		Callback = function(p24)
			_G.EspKey = p24

			if _G.EspKey ~= false then
				function Keys(p25)
					if (p25.Name:find("Key") or p25.Name:find("FuseObtain")) and p25:FindFirstChild("Hitbox") or p25.Name == "LeverForGate" and p25.PrimaryPart then
						if p25:FindFirstChild("Esp_Highlight") then
							p25:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
							p25:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
						end

						if _G.EspHighlight ~= true or p25:FindFirstChild("Esp_Highlight") ~= nil then
							if _G.EspHighlight == false and p25:FindFirstChild("Esp_Highlight") then
								p25:FindFirstChild("Esp_Highlight"):Destroy()
							end
						else
							local Highlight = Instance.new("Highlight")

							Highlight.Name = "Esp_Highlight"
							Highlight.FillColor = Color3.fromRGB(255, 255, 255)
							Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
							Highlight.FillTransparency = 0.5
							Highlight.OutlineTransparency = 0
							Highlight.Adornee = p25
							Highlight.Parent = p25
						end

						if p25:FindFirstChild("Esp_Gui") and p25.Esp_Gui:FindFirstChild("TextLabel") then
							p25.Esp_Gui:FindFirstChild("TextLabel").Text = (_G.EspName == true and (p25.Name == "LeverForGate" and "Lever" or (p25.Name:find("Key") and "Key" or p25.Name:find("FuseObtain") and "Fuse")) or "") .. (_G.EspDistance == true and "\nDistance (" .. string.format("%.0f", Distance(p25.Name == "LeverForGate" and p25.PrimaryPart.Position or (not not p25.Name:find("Key") or p25.Name:find("FuseObtain")) and p25.Hitbox.Position)) .. "m)" or "")
							p25.Esp_Gui:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
							p25.Esp_Gui:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
						end

						if _G.EspGui ~= true or p25:FindFirstChild("Esp_Gui") ~= nil then
							if _G.EspGui == false and p25:FindFirstChild("Esp_Gui") then
								p25:FindFirstChild("Esp_Gui"):Destroy()
							end
						else
							GuiEsp = Instance.new("BillboardGui", p25)
							GuiEsp.Adornee = p25
							GuiEsp.Name = "Esp_Gui"
							GuiEsp.Size = UDim2.new(0, 100, 0, 150)
							GuiEsp.AlwaysOnTop = true
							GuiEspText = Instance.new("TextLabel", GuiEsp)
							GuiEspText.BackgroundTransparency = 1
							GuiEspText.Font = Enum.Font.Code
							GuiEspText.Size = UDim2.new(0, 100, 0, 100)
							GuiEspText.TextSize = 15
							GuiEspText.TextColor3 = Color3.new(0, 0, 0)
							GuiEspText.TextStrokeTransparency = 0.5
							GuiEspText.Text = ""

							local UIStroke = Instance.new("UIStroke")

							UIStroke.Color = Color3.new(0, 0, 0)
							UIStroke.Thickness = 1.5
							UIStroke.Parent = GuiEspText
						end
					end
				end

				local function u161(p26)
					if not table.find(_G.KeyAdd, p26) and ((p26.Name:find("Key") or p26.Name:find("FuseObtain")) and p26:FindFirstChild("Hitbox")) or p26.Name == "LeverForGate" and p26.PrimaryPart then
						table.insert(_G.KeyAdd, p26)
					end
				end

				for _, v in ipairs(workspace:GetDescendants()) do
					u161(v)
				end

				KeySpawn = workspace.DescendantAdded:Connect(function(descendant)
					-- upvalues: u161 (ref)
					u161(descendant)
				end)
				KeyRemove = workspace.DescendantRemoving:Connect(function(descendant)
					for i = #_G.KeyAdd, 1, -1 do
						if descendant == _G.KeyAdd[i] then
							table.remove(_G.KeyAdd, i)

							return
						end
					end
				end)
			else
				_G.KeyAdd = {}

				if KeySpawn then
					KeySpawn:Disconnect()
					KeySpawn = nil
				end

				if KeyRemove then
					KeyRemove:Disconnect()
					KeyRemove = nil
				end

				for _, v in pairs(workspace:GetDescendants()) do
					if v.Name:find("Key") or v.Name == "LeverForGate" or v.Name:find("FuseObtain") then
						for _, v11 in pairs(v:GetChildren()) do
							if v11.Name:find("Esp_") then
								v11:Destroy()
							end
						end
					end
				end
			end

			while _G.EspKey do
				for _, v in pairs(_G.KeyAdd) do
					if v:IsA("Model") then
						Keys(v)
					end
				end

				task.wait()
			end
		end
	})
end

Tab2:Toggle({
	Title = "Esp Door",
	Type = "Toggle",
	Default = false,
	Callback = function(p27)
		_G.EspDoor = p27

		if _G.EspDoor == false then
			for _, v in pairs(game.Workspace:FindFirstChild("CurrentRooms"):GetChildren()) do
				if v:isA("Model") then
					for _, v12 in pairs(v:GetChildren()) do
						if v12.Name:find("Esp_") then
							v12:Destroy()
						end
					end
				end
			end
		end

		while _G.EspDoor do
			for _, v in pairs(game.Workspace:FindFirstChild("CurrentRooms"):GetChildren()) do
				if v:IsA("Model") and v:FindFirstChild("Door") and v.Door:FindFirstChild("Door") then
					if v:FindFirstChild("Esp_Highlight") then
						v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
						v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
					end

					if _G.EspHighlight ~= true or v:FindFirstChild("Esp_Highlight") ~= nil then
						if _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
							v:FindFirstChild("Esp_Highlight"):Destroy()
						end
					else
						local Highlight = Instance.new("Highlight")

						Highlight.Name = "Esp_Highlight"
						Highlight.FillColor = Color3.fromRGB(255, 255, 255)
						Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
						Highlight.FillTransparency = 0.5
						Highlight.OutlineTransparency = 0
						Highlight.Adornee = v.Door
						Highlight.Parent = v
					end

					if v:FindFirstChild("Esp_Gui") and v.Esp_Gui:FindFirstChild("TextLabel") then
						v.Esp_Gui:FindFirstChild("TextLabel").Text = (_G.EspName == true and "Door " .. (v.Door:FindFirstChild("Sign") and (v.Door.Sign:FindFirstChild("Stinker") and v.Door.Sign.Stinker.Text) or v.Door.Sign:FindFirstChild("SignText") and v.Door.Sign.SignText.Text):gsub("^0+", "") .. (v.Door:FindFirstChild("Lock") and " (lock)" or "") or "") .. (_G.EspDistance == true and "\nDistance (" .. string.format("%.0f", Distance(v.Door.Door.Position)) .. "m)" or "")
						v.Esp_Gui:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
						v.Esp_Gui:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
					end

					if _G.EspGui ~= true or v:FindFirstChild("Esp_Gui") ~= nil then
						if _G.EspGui == false and v:FindFirstChild("Esp_Gui") then
							v:FindFirstChild("Esp_Gui"):Destroy()
						end
					else
						GuiEsp = Instance.new("BillboardGui", v)
						GuiEsp.Adornee = v.Door
						GuiEsp.Name = "Esp_Gui"
						GuiEsp.Size = UDim2.new(0, 100, 0, 150)
						GuiEsp.AlwaysOnTop = true
						GuiEspText = Instance.new("TextLabel", GuiEsp)
						GuiEspText.BackgroundTransparency = 1
						GuiEspText.Font = Enum.Font.Code
						GuiEspText.Size = UDim2.new(0, 100, 0, 100)
						GuiEspText.TextSize = 15
						GuiEspText.TextColor3 = Color3.new(0, 0, 0)
						GuiEspText.TextStrokeTransparency = 0.5
						GuiEspText.Text = ""

						local UIStroke = Instance.new("UIStroke")

						UIStroke.Color = Color3.new(0, 0, 0)
						UIStroke.Thickness = 1.5
						UIStroke.Parent = GuiEspText
					end
				end
			end

			task.wait()
		end
	end
})

if v6 then
	Tab2:Toggle({
		Title = "Esp Time Lever",
		Type = "Toggle",
		Default = false,
		Callback = function(p28)
			_G.EspLeverTime = p28

			if _G.EspLeverTime ~= false then
				function LeverTimes(p29)
					if p29.Name:find("TimerLever") and p29.PrimaryPart then
						if p29:FindFirstChild("Esp_Highlight") then
							p29:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
							p29:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
						end

						if _G.EspHighlight ~= true or p29:FindFirstChild("Esp_Highlight") ~= nil then
							if _G.EspHighlight == false and p29:FindFirstChild("Esp_Highlight") then
								p29:FindFirstChild("Esp_Highlight"):Destroy()
							end
						else
							local Highlight = Instance.new("Highlight")

							Highlight.Name = "Esp_Highlight"
							Highlight.FillColor = Color3.fromRGB(255, 255, 255)
							Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
							Highlight.FillTransparency = 0.5
							Highlight.OutlineTransparency = 0
							Highlight.Adornee = p29
							Highlight.Parent = p29
						end

						if p29:FindFirstChild("Esp_Gui") and p29.Esp_Gui:FindFirstChild("TextLabel") then
							p29.Esp_Gui:FindFirstChild("TextLabel").Text = (_G.EspName == true and "Lever Time" or "") .. (_G.EspDistance == true and "\nDistance (" .. string.format("%.0f", Distance(p29.PrimaryPart.Position)) .. "m)" or "")
							p29.Esp_Gui:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
							p29.Esp_Gui:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
						end

						if _G.EspGui ~= true or p29:FindFirstChild("Esp_Gui") ~= nil then
							if _G.EspGui == false and p29:FindFirstChild("Esp_Gui") then
								p29:FindFirstChild("Esp_Gui"):Destroy()
							end
						else
							GuiEsp = Instance.new("BillboardGui", p29)
							GuiEsp.Adornee = p29
							GuiEsp.Name = "Esp_Gui"
							GuiEsp.Size = UDim2.new(0, 100, 0, 150)
							GuiEsp.AlwaysOnTop = true
							GuiEspText = Instance.new("TextLabel", GuiEsp)
							GuiEspText.BackgroundTransparency = 1
							GuiEspText.Font = Enum.Font.Code
							GuiEspText.Size = UDim2.new(0, 100, 0, 100)
							GuiEspText.TextSize = 15
							GuiEspText.TextColor3 = Color3.new(0, 0, 0)
							GuiEspText.TextStrokeTransparency = 0.5
							GuiEspText.Text = ""

							local UIStroke = Instance.new("UIStroke")

							UIStroke.Color = Color3.new(0, 0, 0)
							UIStroke.Thickness = 1.5
							UIStroke.Parent = GuiEspText
						end
					end
				end

				local function u142(p30)
					if not table.find(_G.TimeLeverAdd, p30) and p30.Name == "TimerLever" then
						table.insert(_G.TimeLeverAdd, p30)
					end
				end

				for _, v in ipairs(workspace:GetDescendants()) do
					u142(v)
				end

				TimeLeverSpawn = workspace.DescendantAdded:Connect(function(descendant)
					-- upvalues: u142 (ref)
					u142(descendant)
				end)
				TimeLeverRemove = workspace.DescendantRemoving:Connect(function(descendant)
					for i = #_G.TimeLeverAdd, 1, -1 do
						if descendant == _G.TimeLeverAdd[i] then
							table.remove(_G.TimeLeverAdd, i)

							return
						end
					end
				end)
			else
				_G.TimeLeverAdd = {}

				if TimeLeverSpawn then
					TimeLeverSpawn:Disconnect()
					TimeLeverSpawn = nil
				end

				if TimeLeverRemove then
					TimeLeverRemove:Disconnect()
					TimeLeverRemove = nil
				end

				for _, v in pairs(workspace:GetDescendants()) do
					if v.Name:find("TimerLever") then
						for _, v13 in pairs(v:GetChildren()) do
							if v13.Name:find("Esp_") then
								v13:Destroy()
							end
						end
					end
				end
			end

			while _G.EspLeverTime do
				for _, v in pairs(_G.TimeLeverAdd) do
					if v:IsA("Model") then
						LeverTimes(v)
					end
				end

				task.wait()
			end
		end
	})
end

if v5 then
	Tab2:Toggle({
		Title = "Esp Book",
		Type = "Toggle",
		Default = false,
		Callback = function(p31)
			_G.EspBook = p31

			if _G.EspBook ~= false then
				function Books(p32)
					if p32.Name:find("LiveHintBook") and p32.PrimaryPart then
						if p32:FindFirstChild("Esp_Highlight") then
							p32:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
							p32:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
						end

						if _G.EspHighlight ~= true or p32:FindFirstChild("Esp_Highlight") ~= nil then
							if _G.EspHighlight == false and p32:FindFirstChild("Esp_Highlight") then
								p32:FindFirstChild("Esp_Highlight"):Destroy()
							end
						else
							local Highlight = Instance.new("Highlight")

							Highlight.Name = "Esp_Highlight"
							Highlight.FillColor = Color3.fromRGB(255, 255, 255)
							Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
							Highlight.FillTransparency = 0.5
							Highlight.OutlineTransparency = 0
							Highlight.Adornee = p32
							Highlight.Parent = p32
						end

						if p32:FindFirstChild("Esp_Gui") and p32.Esp_Gui:FindFirstChild("TextLabel") then
							p32.Esp_Gui:FindFirstChild("TextLabel").Text = (_G.EspName == true and "Book" or "") .. (_G.EspDistance == true and "\nDistance (" .. string.format("%.0f", Distance(p32.PrimaryPart.Position)) .. "m)" or "")
							p32.Esp_Gui:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
							p32.Esp_Gui:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
						end

						if _G.EspGui ~= true or p32:FindFirstChild("Esp_Gui") ~= nil then
							if _G.EspGui == false and p32:FindFirstChild("Esp_Gui") then
								p32:FindFirstChild("Esp_Gui"):Destroy()
							end
						else
							GuiEsp = Instance.new("BillboardGui", p32)
							GuiEsp.Adornee = p32
							GuiEsp.Name = "Esp_Gui"
							GuiEsp.Size = UDim2.new(0, 100, 0, 150)
							GuiEsp.AlwaysOnTop = true
							GuiEspText = Instance.new("TextLabel", GuiEsp)
							GuiEspText.BackgroundTransparency = 1
							GuiEspText.Font = Enum.Font.Code
							GuiEspText.Size = UDim2.new(0, 100, 0, 100)
							GuiEspText.TextSize = 15
							GuiEspText.TextColor3 = Color3.new(0, 0, 0)
							GuiEspText.TextStrokeTransparency = 0.5
							GuiEspText.Text = ""

							local UIStroke = Instance.new("UIStroke")

							UIStroke.Color = Color3.new(0, 0, 0)
							UIStroke.Thickness = 1.5
							UIStroke.Parent = GuiEspText
						end
					end
				end

				local function u68(p33)
					if not table.find(_G.BookAdd, p33) and p33.Name == "LiveHintBook" then
						table.insert(_G.BookAdd, p33)
					end
				end

				for _, v in ipairs(workspace:GetDescendants()) do
					u68(v)
				end

				BookSpawn = workspace.DescendantAdded:Connect(function(descendant)
					-- upvalues: u68 (ref)
					u68(descendant)
				end)
				BookRemove = workspace.DescendantRemoving:Connect(function(descendant)
					for i = #_G.BookAdd, 1, -1 do
						if descendant == _G.BookAdd[i] then
							table.remove(_G.BookAdd, i)

							return
						end
					end
				end)
			else
				_G.BookAdd = {}

				if BookSpawn then
					BookSpawn:Disconnect()
					BookSpawn = nil
				end

				if BookRemove then
					BookRemove:Disconnect()
					BookRemove = nil
				end

				for _, v in pairs(workspace:GetDescendants()) do
					if v.Name:find("LiveHintBook") then
						for _, v14 in pairs(v:GetChildren()) do
							if v14.Name:find("Esp_") then
								v14:Destroy()
							end
						end
					end
				end
			end

			while _G.EspBook do
				for _, v in pairs(_G.BookAdd) do
					if v:IsA("Model") then
						Books(v)
					end
				end

				task.wait()
			end
		end
	})
	Tab2:Toggle({
		Title = "Esp Breaker",
		Type = "Toggle",
		Default = false,
		Callback = function(p34)
			_G.EspBreaker = p34

			if _G.EspBreaker ~= false then
				function Breakers(p35)
					if p35.Name == "LiveBreakerPolePickup" and p35:FindFirstChildOfClass("ProximityPrompt") then
						if p35:FindFirstChild("Esp_Highlight") then
							p35:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
							p35:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
						end

						if _G.EspHighlight ~= true or p35:FindFirstChild("Esp_Highlight") ~= nil then
							if _G.EspHighlight == false and p35:FindFirstChild("Esp_Highlight") then
								p35:FindFirstChild("Esp_Highlight"):Destroy()
							end
						else
							local Highlight = Instance.new("Highlight")

							Highlight.Name = "Esp_Highlight"
							Highlight.FillColor = Color3.fromRGB(255, 255, 255)
							Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
							Highlight.FillTransparency = 0.5
							Highlight.OutlineTransparency = 0
							Highlight.Adornee = p35
							Highlight.Parent = p35
						end

						if p35:FindFirstChild("Esp_Gui") and p35.Esp_Gui:FindFirstChild("TextLabel") then
							p35.Esp_Gui:FindFirstChild("TextLabel").Text = (_G.EspName == true and "Breaker" or "") .. (_G.EspDistance == true and "\nDistance (" .. string.format("%.0f", Distance(p35.PrimaryPart.Position)) .. "m)" or "")
							p35.Esp_Gui:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
							p35.Esp_Gui:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
						end

						if _G.EspGui ~= true or p35:FindFirstChild("Esp_Gui") ~= nil then
							if _G.EspGui == false and p35:FindFirstChild("Esp_Gui") then
								p35:FindFirstChild("Esp_Gui"):Destroy()
							end
						else
							GuiEsp = Instance.new("BillboardGui", p35)
							GuiEsp.Adornee = p35
							GuiEsp.Name = "Esp_Gui"
							GuiEsp.Size = UDim2.new(0, 100, 0, 150)
							GuiEsp.AlwaysOnTop = true
							GuiEspText = Instance.new("TextLabel", GuiEsp)
							GuiEspText.BackgroundTransparency = 1
							GuiEspText.Font = Enum.Font.Code
							GuiEspText.Size = UDim2.new(0, 100, 0, 100)
							GuiEspText.TextSize = 15
							GuiEspText.TextColor3 = Color3.new(0, 0, 0)
							GuiEspText.TextStrokeTransparency = 0.5
							GuiEspText.Text = ""

							local UIStroke = Instance.new("UIStroke")

							UIStroke.Color = Color3.new(0, 0, 0)
							UIStroke.Thickness = 1.5
							UIStroke.Parent = GuiEspText
						end
					end
				end

				local function u83(p36)
					if not table.find(_G.BreakerAdd, p36) and p36.Name == "LiveBreakerPolePickup" then
						table.insert(_G.BreakerAdd, p36)
					end
				end

				for _, v in ipairs(workspace:GetDescendants()) do
					u83(v)
				end

				BreakerSpawn = workspace.DescendantAdded:Connect(function(descendant)
					-- upvalues: u83 (ref)
					u83(descendant)
				end)
				BreakerRemove = workspace.DescendantRemoving:Connect(function(descendant)
					for i = #_G.BreakerAdd, 1, -1 do
						if descendant == _G.BreakerAdd[i] then
							table.remove(_G.BreakerAdd, i)

							return
						end
					end
				end)
			else
				_G.BreakerAdd = {}

				if BreakerSpawn then
					BreakerSpawn:Disconnect()
					BreakerSpawn = nil
				end

				if BreakerRemove then
					BreakerRemove:Disconnect()
					BreakerRemove = nil
				end

				for _, v in pairs(workspace:GetDescendants()) do
					if v.Name:find("LiveBreakerPolePickup") then
						for _, v15 in pairs(v:GetChildren()) do
							if v15.Name:find("Esp_") then
								v15:Destroy()
							end
						end
					end
				end
			end

			while _G.EspBreaker do
				for _, v in pairs(_G.BreakerAdd) do
					if v.Name == "LiveBreakerPolePickup" then
						Breakers(v)
					end
				end

				task.wait()
			end
		end
	})
end

Tab2:Toggle({
	Title = "Esp Item",
	Type = "Toggle",
	Default = false,
	Callback = function(p37)
		_G.EspItem = p37

		if _G.EspItem ~= false then
			function Items(p38)
				if p38.Name == "Handle" and p38.Parent:FindFirstChildOfClass("ProximityPrompt") then
					if p38:FindFirstChild("Esp_Highlight") then
						p38:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
						p38:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
					end

					if _G.EspHighlight ~= true or p38:FindFirstChild("Esp_Highlight") ~= nil then
						if _G.EspHighlight == false and p38:FindFirstChild("Esp_Highlight") then
							p38:FindFirstChild("Esp_Highlight"):Destroy()
						end
					else
						local Highlight = Instance.new("Highlight")

						Highlight.Name = "Esp_Highlight"
						Highlight.FillColor = Color3.fromRGB(255, 255, 255)
						Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
						Highlight.FillTransparency = 0.5
						Highlight.OutlineTransparency = 0
						Highlight.Adornee = p38.Parent
						Highlight.Parent = p38
					end

					if p38:FindFirstChild("Esp_Gui") and p38.Esp_Gui:FindFirstChild("TextLabel") then
						p38.Esp_Gui:FindFirstChild("TextLabel").Text = (_G.EspName == true and p38.Parent.Name or "") .. (_G.EspDistance == true and "\nDistance (" .. string.format("%.0f", Distance(p38.Position)) .. "m)" or "")
						p38.Esp_Gui:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
						p38.Esp_Gui:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
					end

					if _G.EspGui ~= true or p38:FindFirstChild("Esp_Gui") ~= nil then
						if _G.EspGui == false and p38:FindFirstChild("Esp_Gui") then
							p38:FindFirstChild("Esp_Gui"):Destroy()
						end
					else
						GuiEsp = Instance.new("BillboardGui", p38)
						GuiEsp.Adornee = p38.Parent
						GuiEsp.Name = "Esp_Gui"
						GuiEsp.Size = UDim2.new(0, 100, 0, 150)
						GuiEsp.AlwaysOnTop = true
						GuiEspText = Instance.new("TextLabel", GuiEsp)
						GuiEspText.BackgroundTransparency = 1
						GuiEspText.Font = Enum.Font.Code
						GuiEspText.Size = UDim2.new(0, 100, 0, 100)
						GuiEspText.TextSize = 15
						GuiEspText.TextColor3 = Color3.new(0, 0, 0)
						GuiEspText.TextStrokeTransparency = 0.5
						GuiEspText.Text = ""

						local UIStroke = Instance.new("UIStroke")

						UIStroke.Color = Color3.new(0, 0, 0)
						UIStroke.Thickness = 1.5
						UIStroke.Parent = GuiEspText
					end
				end
			end

			local function u96(p39)
				if not table.find(_G.ItemAdd, p39) and p39.Name == "Handle" then
					table.insert(_G.ItemAdd, p39)
				end
			end

			for _, v in ipairs(workspace:GetDescendants()) do
				u96(v)
			end

			ItemSpawn = workspace.DescendantAdded:Connect(function(descendant)
				-- upvalues: u96 (ref)
				u96(descendant)
			end)
			ItemRemove = workspace.DescendantRemoving:Connect(function(descendant)
				for i = #_G.ItemAdd, 1, -1 do
					if descendant == _G.ItemAdd[i] then
						table.remove(_G.ItemAdd, i)

						return
					end
				end
			end)
		else
			_G.ItemAdd = {}

			if ItemSpawn then
				ItemSpawn:Disconnect()
				ItemSpawn = nil
			end

			if ItemRemove then
				ItemRemove:Disconnect()
				ItemRemove = nil
			end

			for _, v in pairs(workspace:GetDescendants()) do
				if v.Name:find("Handle") then
					for _, v16 in pairs(v:GetChildren()) do
						if v16.Name:find("Esp_") then
							v16:Destroy()
						end
					end
				end
			end
		end

		while _G.EspItem do
			for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Tool") then
					for _, v17 in pairs(v:GetChildren()) do
						if v17.Name:find("Esp_") then
							v17:Destroy()
						end
					end
				end
			end

			for _, v in pairs(_G.ItemAdd) do
				if v.Name == "Handle" then
					Items(v)
				end
			end

			task.wait()
		end
	end
})
_G.EspEntityNameDis = {
	FigureRig = "Figure",
	SallyMoving = "Window",
	RushMoving = "Rush",
	Eyes = "Eyes",
	Groundskeeper = "Skeeper",
	BackdoorLookman = "Lookman",
	BackdoorRush = "Blitz",
	MandrakeLive = "Mandrake",
	GloombatSwarm = "Gloombat",
	GiggleCeiling = "Giggle",
	AmbushMoving = "Ambush"
}
Tab2:Toggle({
	Title = "Esp Entity",
	Type = "Toggle",
	Default = false,
	Callback = function(p40)
		_G.EspEntity = p40

		if _G.EspEntity ~= false then
			local function u115(p41)
				for k, _ in pairs(_G.EspEntityNameDis) do
					if p41:IsA("Model") and k == p41.Name and not table.find(_G.EntityAdd, p41) then
						table.insert(_G.EntityAdd, p41)
					end
				end
			end

			for _, v in ipairs(workspace:GetDescendants()) do
				u115(v)
			end

			EntitySpawn = workspace.DescendantAdded:Connect(function(descendant)
				-- upvalues: u115 (ref)
				u115(descendant)
			end)
			EntityRemove = workspace.DescendantRemoving:Connect(function(descendant)
				for i = #_G.EntityAdd, 1, -1 do
					if descendant == _G.EntityAdd[i] then
						table.remove(_G.EntityAdd, i)

						return
					end
				end
			end)
		else
			_G.EntityAdd = {}

			if EntitySpawn then
				EntitySpawn:Disconnect()
				EntitySpawn = nil
			end

			if EntityRemove then
				EntityRemove:Disconnect()
				EntityRemove = nil
			end

			for _, v in pairs(workspace:GetDescendants()) do
				for k, _ in pairs(_G.EspEntityNameDis) do
					if v:IsA("Model") and k == v.Name then
						if v.PrimaryPart then
							v.PrimaryPart.Transparency = 1
						end

						for _, v18 in pairs(v:GetChildren()) do
							if v18.Name:find("Esp_") then
								v18:Destroy()
							end
						end
					end
				end
			end
		end

		while _G.EspEntity do
			for _, v in pairs(_G.EntityAdd) do
				for k, _ in pairs(_G.EspEntityNameDis) do
					if v:IsA("Model") and k == v.Name then
						if v.PrimaryPart then
							v.PrimaryPart.Transparency = 0
						end

						if v:FindFirstChild("Esp_Highlight") then
							v:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
							v:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
						end

						if _G.EspHighlight ~= true or v:FindFirstChild("Esp_Highlight") ~= nil then
							if _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
								v:FindFirstChild("Esp_Highlight"):Destroy()
							end
						else
							local Highlight = Instance.new("Highlight")

							Highlight.Name = "Esp_Highlight"
							Highlight.FillColor = Color3.fromRGB(255, 255, 255)
							Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
							Highlight.FillTransparency = 0.5
							Highlight.OutlineTransparency = 0
							Highlight.Adornee = v
							Highlight.Parent = v
						end

						if v:FindFirstChild("Esp_Gui") and v.Esp_Gui:FindFirstChild("TextLabel") then
							v.Esp_Gui:FindFirstChild("TextLabel").Text = (_G.EspName == true and _G.EspEntityNameDis[v.Name] or "") .. (_G.EspDistance == true and "\nDistance (" .. string.format("%.0f", Distance(v.PrimaryPart.Position)) .. "m)" or "")
							v.Esp_Gui:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
							v.Esp_Gui:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
						end

						if _G.EspGui ~= true or v:FindFirstChild("Esp_Gui") ~= nil then
							if _G.EspGui == false and v:FindFirstChild("Esp_Gui") then
								v:FindFirstChild("Esp_Gui"):Destroy()
							end
						else
							GuiEsp = Instance.new("BillboardGui", v)
							GuiEsp.Adornee = v
							GuiEsp.Name = "Esp_Gui"
							GuiEsp.Size = UDim2.new(0, 100, 0, 150)
							GuiEsp.AlwaysOnTop = true
							GuiEspText = Instance.new("TextLabel", GuiEsp)
							GuiEspText.BackgroundTransparency = 1
							GuiEspText.Font = Enum.Font.Code
							GuiEspText.Size = UDim2.new(0, 100, 0, 100)
							GuiEspText.TextSize = 15
							GuiEspText.TextColor3 = Color3.new(0, 0, 0)
							GuiEspText.TextStrokeTransparency = 0.5
							GuiEspText.Text = ""

							local UIStroke = Instance.new("UIStroke")

							UIStroke.Color = Color3.new(0, 0, 0)
							UIStroke.Thickness = 1.5
							UIStroke.Parent = GuiEspText
						end
					end
				end
			end

			task.wait()
		end
	end
})
Tab2:Toggle({
	Title = "Esp Hiding Spots",
	Type = "Toggle",
	Default = false,
	Callback = function(p42)
		_G.EspHiding = p42

		if _G.EspHiding ~= false then
			function Hidings(p43)
				if (p43.Name == "Bed" or (p43.Name == "Wardrobe" or p43.Name == "Backdoor_Wardrobe" or p43.Name == "Locker_Large" or p43.Name == "Rooms_Locker")) and p43.PrimaryPart then
					if p43:FindFirstChild("Esp_Highlight") then
						p43:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
						p43:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.fromRGB(255, 255, 255)
					end

					if _G.EspHighlight ~= true or p43:FindFirstChild("Esp_Highlight") ~= nil then
						if _G.EspHighlight == false and p43:FindFirstChild("Esp_Highlight") then
							p43:FindFirstChild("Esp_Highlight"):Destroy()
						end
					else
						local Highlight = Instance.new("Highlight")

						Highlight.Name = "Esp_Highlight"
						Highlight.FillColor = Color3.fromRGB(255, 255, 255)
						Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
						Highlight.FillTransparency = 0.5
						Highlight.OutlineTransparency = 0
						Highlight.Adornee = p43
						Highlight.Parent = p43
					end

					if p43:FindFirstChild("Esp_Gui") and p43.Esp_Gui:FindFirstChild("TextLabel") then
						p43.Esp_Gui:FindFirstChild("TextLabel").Text = (_G.EspName == true and p43.Name or "") .. (_G.EspDistance == true and "\nDistance (" .. string.format("%.0f", Distance(p43.PrimaryPart.Position)) .. "m)" or "")
						p43.Esp_Gui:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
						p43.Esp_Gui:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
					end

					if _G.EspGui ~= true or p43:FindFirstChild("Esp_Gui") ~= nil then
						if _G.EspGui == false and p43:FindFirstChild("Esp_Gui") then
							p43:FindFirstChild("Esp_Gui"):Destroy()
						end
					else
						GuiEsp = Instance.new("BillboardGui", p43)
						GuiEsp.Adornee = p43
						GuiEsp.Name = "Esp_Gui"
						GuiEsp.Size = UDim2.new(0, 100, 0, 150)
						GuiEsp.AlwaysOnTop = true
						GuiEspText = Instance.new("TextLabel", GuiEsp)
						GuiEspText.BackgroundTransparency = 1
						GuiEspText.Font = Enum.Font.Code
						GuiEspText.Size = UDim2.new(0, 100, 0, 100)
						GuiEspText.TextSize = 15
						GuiEspText.TextColor3 = Color3.new(0, 0, 0)
						GuiEspText.TextStrokeTransparency = 0.5
						GuiEspText.Text = ""

						local UIStroke = Instance.new("UIStroke")

						UIStroke.Color = Color3.new(0, 0, 0)
						UIStroke.Thickness = 1.5
						UIStroke.Parent = GuiEspText
					end
				end
			end

			local function u17(p44)
				if not table.find(_G.HidingAdd, p44) and p44.Name == "Bed" or (p44.Name == "Wardrobe" or p44.Name == "Backdoor_Wardrobe" or p44.Name == "Locker_Large" or p44.Name == "Rooms_Locker") then
					table.insert(_G.HidingAdd, p44)
				end
			end

			for _, v in ipairs(workspace:GetDescendants()) do
				u17(v)
			end

			BookSpawn = workspace.DescendantAdded:Connect(function(descendant)
				-- upvalues: u17 (ref)
				u17(descendant)
			end)
			BookRemove = workspace.DescendantRemoving:Connect(function(descendant)
				for i = #_G.HidingAdd, 1, -1 do
					if descendant == _G.HidingAdd[i] then
						table.remove(_G.HidingAdd, i)

						return
					end
				end
			end)
		else
			_G.HidingAdd = {}

			if HidingSpawn then
				HidingSpawn:Disconnect()
				HidingSpawn = nil
			end

			if HidingRemove then
				HidingRemove:Disconnect()
				HidingRemove = nil
			end

			for _, v in pairs(workspace:GetDescendants()) do
				if v.Name == "Bed" or v.Name == "Wardrobe" or v.Name == "Backdoor_Wardrobe" or v.Name == "Locker_Large" or v.Name == "Rooms_Locker" then
					for _, v19 in pairs(v:GetChildren()) do
						if v19.Name:find("Esp_") then
							v19:Destroy()
						end
					end
				end
			end
		end

		while _G.EspHiding do
			for _, v in pairs(_G.HidingAdd) do
				if v:IsA("Model") then
					Hidings(v)
				end
			end

			task.wait()
		end
	end
})
Tab2:Toggle({
	Title = "Esp Player",
	Type = "Toggle",
	Default = false,
	Callback = function(p45)
		_G.EspPlayer = p45

		if _G.EspPlayer == false then
			for _, v in pairs(game.Players:GetChildren()) do
				if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") then
					for _, v20 in pairs(v.Character:GetChildren()) do
						if v20.Name:find("Esp_") then
							v20:Destroy()
						end
					end
				end
			end
		end

		while _G.EspPlayer do
			for _, v in pairs(game.Players:GetChildren()) do
				if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") then
					if v.Character:FindFirstChild("Esp_Highlight") then
						v.Character:FindFirstChild("Esp_Highlight").FillColor = _G.ColorLight or Color3.new(255, 255, 255)
						v.Character:FindFirstChild("Esp_Highlight").OutlineColor = _G.ColorLight or Color3.new(255, 255, 255)
					end

					if _G.EspHighlight ~= true or v.Character:FindFirstChild("Esp_Highlight") ~= nil then
						if _G.EspHighlight == false and v.Character:FindFirstChild("Esp_Highlight") then
							v.Character:FindFirstChild("Esp_Highlight"):Destroy()
						end
					else
						local Highlight = Instance.new("Highlight")

						Highlight.Name = "Esp_Highlight"
						Highlight.FillColor = Color3.fromRGB(255, 255, 255)
						Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
						Highlight.FillTransparency = 0.5
						Highlight.OutlineTransparency = 0
						Highlight.Adornee = v.Character
						Highlight.Parent = v.Character
					end

					if v.Character:FindFirstChild("Esp_Gui") and v.Character.Esp_Gui:FindFirstChild("TextLabel") then
						v.Character.Esp_Gui:FindFirstChild("TextLabel").Text = (_G.EspName == true and v.Name or "") .. (_G.EspDistance == true and "\nDistance (" .. string.format("%.0f", Distance(v.Character.HumanoidRootPart.Position)) .. "m)" or "") .. (_G.EspHealth == true and "\nHealth [ " .. (v.Character.Humanoid.Health <= 0 and "Dead" or string.format("%.0f", v.Character.Humanoid.Health)) .. " ]" or "")
						v.Character.Esp_Gui:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
						v.Character.Esp_Gui:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
					end

					if _G.EspGui ~= true or v.Character:FindFirstChild("Esp_Gui") ~= nil then
						if _G.EspGui == false and v.Character:FindFirstChild("Esp_Gui") then
							v.Character:FindFirstChild("Esp_Gui"):Destroy()
						end
					else
						GuiPlayerEsp = Instance.new("BillboardGui", v.Character)
						GuiPlayerEsp.Adornee = v.Character.Head
						GuiPlayerEsp.Name = "Esp_Gui"
						GuiPlayerEsp.Size = UDim2.new(0, 100, 0, 150)
						GuiPlayerEsp.AlwaysOnTop = true
						GuiPlayerEsp.StudsOffset = Vector3.new(0, 3, 0)
						GuiPlayerEspText = Instance.new("TextLabel", GuiPlayerEsp)
						GuiPlayerEspText.BackgroundTransparency = 1
						GuiPlayerEspText.Font = Enum.Font.Code
						GuiPlayerEspText.Size = UDim2.new(0, 100, 0, 100)
						GuiPlayerEspText.TextSize = 15
						GuiPlayerEspText.TextColor3 = Color3.new(0, 0, 0)
						GuiPlayerEspText.TextStrokeTransparency = 0.5
						GuiPlayerEspText.Text = ""

						local UIStroke = Instance.new("UIStroke")

						UIStroke.Color = Color3.new(0, 0, 0)
						UIStroke.Thickness = 1.5
						UIStroke.Parent = GuiPlayerEspText
					end
				end
			end

			task.wait()
		end
	end
})
Tab2:Section({
	Title = "Settings Esp",
	TextXAlignment = "Left",
	TextSize = 17
})
Tab2:Toggle({
	Title = "Esp Gui",
	Type = "Toggle",
	Default = false,
	Callback = function(p46)
		_G.EspGui = p46
	end
})
Tab2:Toggle({
	Title = "Esp HightLight",
	Type = "Toggle",
	Default = false,
	Callback = function(p47)
		_G.EspHighlight = p47
	end
})
Tab2:Section({
	Title = "Settings Color",
	TextXAlignment = "Left",
	TextSize = 17
})
Tab2:Colorpicker({
	Title = "Color Gui",
	Default = Color3.fromRGB(255, 255, 255),
	Transparency = 0,
	Locked = false,
	Callback = function(p48)
		_G.EspGuiTextColor = p48
	end
})
Tab2:Colorpicker({
	Title = "Color HightLight",
	Default = Color3.fromRGB(255, 255, 255),
	Transparency = 0,
	Locked = false,
	Callback = function(p49)
		_G.ColorLight = p49
	end
})
Tab2:Slider({
	Title = "Text Size [ Gui ]",
	Step = 1,
	Value = {
		Min = 5,
		Max = 50,
		Default = 10
	},
	Callback = function(p50)
		_G.EspGuiTextSize = p50
	end
})
Tab2:Section({
	Title = "Settings Text",
	TextXAlignment = "Left",
	TextSize = 17
})
Tab2:Toggle({
	Title = "Esp Name",
	Type = "Toggle",
	Default = false,
	Callback = function(p51)
		_G.EspName = p51
	end
})
Tab2:Toggle({
	Title = "Esp Distance",
	Type = "Toggle",
	Default = false,
	Callback = function(p52)
		_G.EspDistance = p52
	end
})
Tab2:Toggle({
	Title = "Esp Health",
	Type = "Toggle",
	Default = false,
	Callback = function(p53)
		_G.EspHealth = p53
	end
})
Info = Tabs.Info

local s1 = "jk6dssAE52"
local u14 = "https://discord.com/api/v10/invites/" .. s1 .. "?with_counts=true&with_expiration=true";

(function()
	-- upvalues: u8 (ref), u14 (ref), s1 (ref)
	local ok, result = pcall(function()
		-- upvalues: u8 (ref), u14 (ref)
		return game:GetService("HttpService"):JSONDecode(u8.Creator.Request({
			Url = u14,
			Method = "GET",
			Headers = {
				["User-Agent"] = "RobloxBot/1.0",
				Accept = "application/json"
			}
		}).Body)
	end)

	if not ok or not result or not result.guild then
		Info:Paragraph({
			Title = "Error fetching Discord Info",
			Desc = game:GetService("HttpService"):JSONEncode(result),
			Image = "triangle-alert",
			ImageSize = 26,
			Color = "Red"
		})
	else
		local u139 = Info:Paragraph({
			Title = result.guild.name,
			Desc = " <font color=\"#52525b\">\239\191\189</font> Member Count : " .. tostring(result.approximate_member_count) .. "\n <font color=\"#16a34a\">\239\191\189</font> Online Count : " .. tostring(result.approximate_presence_count),
			Image = "https://cdn.discordapp.com/icons/" .. result.guild.id .. "/" .. result.guild.icon .. ".png?size=1024",
			ImageSize = 42
		})

		Info:Button({
			Title = "Update Info",
			Callback = function()
				-- upvalues: u8 (ref), u14 (ref), u139 (ref)
				local ok2, result2 = pcall(function()
					-- upvalues: u8 (ref), u14 (ref)
					return game:GetService("HttpService"):JSONDecode(u8.Creator.Request({
						Url = u14,
						Method = "GET"
					}).Body)
				end)

				if ok2 and result2 and result2.guild then
					u139:SetDesc(" <font color=\"#52525b\">\239\191\189</font> Member Count : " .. tostring(result2.approximate_member_count) .. "\n <font color=\"#16a34a\">\239\191\189</font> Online Count : " .. tostring(result2.approximate_presence_count))
				end
			end
		})
		Info:Button({
			Title = "Copy Discord Invite",
			Callback = function()
				-- upvalues: s1 (ref)
				setclipboard("https://discord.gg/" .. s1)
			end
		})
	end
end)()
Info:Divider()
Info:Section({
	Title = "Axiora Hub By Zynoxis",
	TextXAlignment = "Center",
	TextSize = 17
})
Info:Divider()
Info:Paragraph({
	Title = "Main Developer",
	Desc = "Dev for doors is Elvis. Owned By Zynoxis.",
	Image = "rbxassetid://77933782593847",
	ImageSize = 30,
	Thumbnail = "",
	ThumbnailSize = 0,
	Locked = false
})
Info:Paragraph({
	Title = "Axiora Hub",
	Desc = "Developed by Elvis, Zynoxis Scripts, and Viper",
	Image = "rbxassetid://129542787176629",
	ImageSize = 30,
	Thumbnail = "",
	ThumbnailSize = 0,
	Locked = false
})
