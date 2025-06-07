


local a=game;local b=a:GetService("Players")
local c=b.LocalPlayer;local d=c:WaitForChild("PlayerGui")
local e=Instance.new("ScreenGui",d)e.Name="WatermarkGui"
local f=Instance.new("TextLabel",e)f.Text="created On CustomMoveMaker.netlify.app"
f.Size=UDim2.new(0.3,0,0.05,0)f.Position=UDim2.new(0.35,0,0,0)
f.BackgroundTransparency=1;f.TextTransparency=0.5;f.TextSize=13
f.TextColor3=Color3.new(1,1,1)e.ResetOnSpawn=false



local g=Instance.new("ScreenGui",d)g.Name="CreditsGui"
local h=Instance.new("TextLabel",g)h.Text="YT_Ex0"
h.TextColor3=Color3.new(1,1,1)h.TextSize=18
h.Font=Enum.Font.SourceSansBold;h.BackgroundTransparency=1
h.Position=UDim2.new(0.01,0,0.01,0)h.Size=UDim2.new(0,200,0,30)
h.TextXAlignment=Enum.TextXAlignment.Left;g.ResetOnSpawn=false

local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui
local hotbar = playerGui:FindFirstChild("Hotbar")
local backpack = hotbar:FindFirstChild("Backpack")
local hotbarFrame = backpack:FindFirstChild("Hotbar")

-- Button 1
local baseButton1 = hotbarFrame:FindFirstChild("1").Base
local ToolName1 = baseButton1.ToolName
ToolName1.Text = "Punch"
ToolName1.Font = Enum.Font.SourceSansBold

-- Button 2
local baseButton2 = hotbarFrame:FindFirstChild("2").Base
local ToolName2 = baseButton2.ToolName
ToolName2.Text = "Walkspeed Override"
ToolName2.Font = Enum.Font.SourceSansBold

-- Button 3
local baseButton3 = hotbarFrame:FindFirstChild("3").Base
local ToolName3 = baseButton3.ToolName
ToolName3.Text = "Corrupt Nature"
ToolName3.Font = Enum.Font.SourceSansBold

-- Button 4
local baseButton4 = hotbarFrame:FindFirstChild("4").Base
local ToolName4 = baseButton4.ToolName
ToolName4.Text = "Pizza Delivery"
ToolName4.Font = Enum.Font.SourceSansBold

local function waitForGui()
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    while true do
        local screenGui = playerGui:FindFirstChild("ScreenGui")
        if screenGui then
            local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
            if magicHealthFrame then
                local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
                if textLabel then
                    textLabel.Text = "...."
                    textLabel.Font = Enum.Font.SourceSansBold
                    return
                end
            end
        end
        wait(1)
    end
end

waitForGui()

local function onAnimationPlayed(animationTrack)
    local animationId = tonumber(animationTrack.Animation.AnimationId:match("%d+"))

    local animationReplacements = {
        [12534735382] = {
            id = "rbxassetid://18885909645",
            time = 1,
            speed = 1
        },
        [12502664044] = {
            id = "rbxassetid://18885932392",
            time = 1,
            speed = 1
        },
        [12618271998] = {
            id = "rbxassetid://18885909645",
            time = 1,
            speed = 1
        },
        [12684390285] = {
            id = "rbxassetid://18885915433",
            time = 1,
            speed = 1
        },
    }

    local replacement = animationReplacements[animationId]
    if replacement then
        for _, animTrack in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
            animTrack:Stop()
        end
        wait(0.1)

        local anim = Instance.new("Animation")
        anim.AnimationId = replacement.id
        local newAnimTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)
        newAnimTrack:Play()

        newAnimTrack:AdjustSpeed(0)
        newAnimTrack.TimePosition = replacement.time
        newAnimTrack:AdjustSpeed(replacement.speed)
    end
end

local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local function onBodyVelocityAdded(bodyVelocity)
    if bodyVelocity:IsA("BodyVelocity") then
        bodyVelocity.Velocity = Vector3.new(bodyVelocity.Velocity.X, 0, bodyVelocity.Velocity.Z)
    end
end

local character = game.Players.LocalPlayer.Character
for _, descendant in pairs(character:GetDescendants()) do
    onBodyVelocityAdded(descendant)
end

character.DescendantAdded:Connect(onBodyVelocityAdded)

game.Players.LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    for _, descendant in pairs(newCharacter:GetDescendants()) do
        onBodyVelocityAdded(descendant)
    end
    newCharacter.DescendantAdded:Connect(onBodyVelocityAdded)
end)

-- VFX Code
local Cr = game:GetService("Players")
local Rep = game:GetService("ReplicatedStorage")

local lolskider = Cr.LocalPlayer
local dect = lolskider.Character or lolskider.CharacterAdded:Wait()
local human = dect:WaitForChild("Humanoid")

human.AnimationPlayed:Connect(function(track)
    if track.Animation.AnimationId == "rbxassetid://18885909645" then
        local Test = game.ReplicatedStorage.Resources.NinjaRun.Heavy_Effects.Start.Wide.Second_Shock
        local test = Test:Clone()
        test.Parent = dect:WaitForChild("HumanoidRootPart")

        for _, child in ipairs(test:GetChildren()) do
            if child:IsA("ParticleEmitter") then
                child:Emit(15)
                child.Enabled = true
            end
        end
        wait(3)
        test:Destroy()
    end
end)

human.AnimationPlayed:Connect(function(track)
    if track.Animation.AnimationId == "rbxassetid://18885932392" then
        local Test = game.ReplicatedStorage.Resources.GrandFissureFinisher.PunchShockwave.Particletest.Attachment
        local test = Test:Clone()
        test.Parent = dect:WaitForChild("HumanoidRootPart")

        for _, child in ipairs(test:GetChildren()) do
            if child:IsA("ParticleEmitter") then
                child:Emit(15)
                child.Enabled = true
            end
        end
        wait(3)
        test:Destroy()
    end
end)

human.AnimationPlayed:Connect(function(track)
    if track.Animation.AnimationId == "rbxassetid://18885909645" then
        local Test = game.ReplicatedStorage.Resources.GrandFissureFinisher.PunchShockwave.Particletest.Attachment
        local test = Test:Clone()
        test.Parent = dect:WaitForChild("HumanoidRootPart")

        for _, child in ipairs(test:GetChildren()) do
            if child:IsA("ParticleEmitter") then
                child:Emit(15)
                child.Enabled = true
            end
        end
        wait(3)
        test:Destroy()
    end
end)

human.AnimationPlayed:Connect(function(track)
    if track.Animation.AnimationId == "rbxassetid://18885915433" then
        local Test = game.ReplicatedStorage.Resources.Sorcerer.LimitlessBarrier.RootPos.Attachment.Slash2.Slash
        local test = Test:Clone()
        test.Parent = dect:WaitForChild("HumanoidRootPart")

        for _, child in ipairs(test:GetChildren()) do
            if child:IsA("ParticleEmitter") then
                child:Emit(15)
                child.Enabled = true
            end
        end
        wait(3)
        test:Destroy()
    end
end)



-- Sound Code


-- Tools Code


-- Fire Effects Code
