-- Beta NPC Bacon + AI + Animasi Gerak + Marah + Respawn by Lonely
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local StarterPack = game:GetService("StarterPack")

if CoreGui:FindFirstChild("DUMMY_GUI") then
    CoreGui:FindFirstChild("DUMMY_GUI"):Destroy()
end

-- GUI
local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "DUMMY_GUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 180)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true

local spawnButton = Instance.new("TextButton", frame)
spawnButton.Size = UDim2.new(1, -20, 0, 30)
spawnButton.Position = UDim2.new(0, 10, 0, 10)
spawnButton.Text = "Spawn Dummy"
spawnButton.BackgroundColor3 = Color3.fromRGB(60, 180, 75)
spawnButton.TextColor3 = Color3.new(1,1,1)
spawnButton.Font = Enum.Font.SourceSansBold
spawnButton.TextScaled = true

local textbox = Instance.new("TextBox", frame)
textbox.Size = UDim2.new(1, -20, 0, 30)
textbox.Position = UDim2.new(0, 10, 0, 50)
textbox.PlaceholderText = "Chat with dummy..."
textbox.Text = ""
textbox.TextScaled = true
textbox.ClearTextOnFocus = false

local followToggle = Instance.new("TextButton", frame)
followToggle.Size = UDim2.new(1, -20, 0, 30)
followToggle.Position = UDim2.new(0, 10, 0, 90)
followToggle.Text = "Follow: OFF"
followToggle.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
followToggle.TextColor3 = Color3.new(1,1,1)
followToggle.Font = Enum.Font.SourceSansBold
followToggle.TextScaled = true

-- Data
local dummy = nil
local follow = false
local nextMove = 0

local function getRandomName()
    local list = {"Budi", "Alex", "Ojan", "Udin", "Soni"}
    return list[math.random(1, #list)] .. math.random(100, 999)
end

-- Animasi R6
local function applyR6Animation(model)
    if model:FindFirstChildOfClass("Humanoid") then
        local animate = Instance.new("Script", model)
        animate.Name = "Animate"
        animate.Source = [[
            local hum = script.Parent:FindFirstChildOfClass("Humanoid")
            hum:LoadAnimation(script.Parent:WaitForChild("AnimateIdle")):Play()
        ]]
        local idleAnim = Instance.new("Animation", model)
        idleAnim.Name = "AnimateIdle"
        idleAnim.AnimationId = "rbxassetid://180435571" -- idle R6
    end
end

-- Spawn dummy
local function createBaconDummy()
    local userId = 1
    local model = Players:CreateHumanoidModelFromUserId(userId)
    model.Name = getRandomName()
    model.Parent = Workspace

    local root = model:FindFirstChild("HumanoidRootPart")
    if root and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        root.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(5,0,0)
    end

    applyR6Animation(model)

    local tool = StarterPack:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
    if tool then
        local cloneTool = tool:Clone()
        cloneTool.Parent = model
    end

    return model
end

-- Marah saat mati + respawn
local function connectDeathEvents(npc)
    npc:WaitForChild("Humanoid").Died:Connect(function()
        warn(npc.Name.." MATI! DIA NGAMUK!")

        local chat = Instance.new("BillboardGui", npc)
        chat.Size = UDim2.new(0, 200, 0, 50)
        chat.StudsOffset = Vector3.new(0, 3, 0)
        chat.Adornee = npc:FindFirstChild("Head")
        chat.AlwaysOnTop = true

        local label = Instance.new("TextLabel", chat)
        label.Size = UDim2.new(1, 0, 1, 0)
        label.Text = "ANJING!!! GUA MATI!!!"
        label.TextColor3 = Color3.new(1, 0, 0)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.Arcade
        label.TextScaled = true

        task.delay(3, function()
            if chat then chat:Destroy() end
        end)

        -- Respawn
        local success = pcall(function()
            local testModel = Players:CreateHumanoidModelFromUserId(1)
            testModel:Destroy()
        end)

        if success then
            task.delay(3, function()
                if dummy then dummy:Destroy() end
                dummy = createBaconDummy()
                connectDeathEvents(dummy)
            end)
        else
            warn("Game ini tidak support respawn NPC.")
        end
    end)
end

-- Spawn button
spawnButton.MouseButton1Click:Connect(function()
    if dummy then return end
    dummy = createBaconDummy()
    connectDeathEvents(dummy)
end)

-- Chat
textbox.FocusLost:Connect(function(enterPressed)
    if enterPressed and dummy then
        print("You: "..textbox.Text)
        print(dummy.Name..": Lah lu bilang '"..textbox.Text.."' ke gw? elu aneh anj.")
        textbox.Text = ""
    end
end)

-- Toggle follow
followToggle.MouseButton1Click:Connect(function()
    follow = not follow
    if follow then
        followToggle.Text = "Follow: ON"
        followToggle.BackgroundColor3 = Color3.fromRGB(80, 200, 80)
    else
        followToggle.Text = "Follow: OFF"
        followToggle.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
    end
end)

-- AI movement
RunService.Heartbeat:Connect(function(dt)
    if dummy and dummy:FindFirstChild("HumanoidRootPart") and dummy:FindFirstChild("Humanoid") then
        local root = dummy.HumanoidRootPart
        local humanoid = dummy.Humanoid

        if follow and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local target = LocalPlayer.Character.HumanoidRootPart.Position
            local distance = (target - root.Position).Magnitude

            if distance > 100 then
                root.CFrame = CFrame.new(target + Vector3.new(2, 0, 0))
            elseif distance > 5 then
                humanoid:MoveTo(target)
            else
                humanoid:MoveTo(root.Position)
            end
        else
            if tick() >= nextMove then
                nextMove = tick() + math.random(3, 6)
                local offset = Vector3.new(math.random(-10,10), 0, math.random(-10,10))
                humanoid:MoveTo(root.Position + offset)
            end
        end

        -- Lompat jika ada halangan
        local ray = Ray.new(root.Position, root.CFrame.LookVector * 3 + Vector3.new(0, -1, 0))
        local hit = Workspace:FindPartOnRay(ray, dummy)
        if hit and humanoid.FloorMaterial ~= Enum.Material.Air then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
