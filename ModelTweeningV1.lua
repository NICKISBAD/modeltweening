local function TweenCharacterToModel(player, modelName, duration)
    -- Get the necessary services
    local TweenService = game:GetService("TweenService")
    local Players = game:GetService("Players")

    -- Wait for the model to exist
    local modelToTween = workspace:FindFirstChild(modelName)

    -- Function to tween the player's character to the target model
    local function TweenCharacter(player, targetModel)
        -- Get the player's character
        local character = player.Character
        if not character then
            return
        end

        -- Get the humanoid root part of the character
        local rootPart = character:WaitForChild("HumanoidRootPart")

        -- Define the tween info
        local tweenInfo = TweenInfo.new(
            duration,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        )

        -- Create the tween
        local tween = TweenService:Create(
            rootPart,
            tweenInfo,
            {CFrame = targetModel.PrimaryPart.CFrame}
        )

        -- Play the tween
        tween:Play()
    end

    -- Listen for new player additions
    local function onPlayerAdded(player)
        if player == Players.LocalPlayer then
            TweenCharacter(player, modelToTween)
        end
    end

    -- Connect the player added event
    Players.PlayerAdded:Connect(onPlayerAdded)
end
