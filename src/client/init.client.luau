local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local InputKeys = require(ReplicatedStorage.Shared.InputKeys)
local player : Player = game.Players.LocalPlayer

local PlayerTable = {}


local function InputBegan(input,gpe) 
    if gpe then return end 
    local KeyName = input.KeyCode.Name
    if (InputKeys[KeyName] and not table.find(PlayerTable, player)) then 
        print("input began: " .. input.KeyCode.Name)

        table.insert(PlayerTable,player)

        if (InputKeys[KeyName].Type == "Press") then 
            task.delay(InputKeys[KeyName].Cooldown, function() 
                print("Task.deley block")
                table.remove(PlayerTable,table.find(PlayerTable, player))
            end)
        end
    end
end

local function InputEnded(input,gpe) 
    if gpe then return end 
    local KeyName = input.KeyCode.Name

    if (InputKeys[KeyName]) then 
        if (InputKeys[KeyName].Type == "Hold" and table.find(PlayerTable, player)) then 
            print("input ended: " .. input.KeyCode.Name)
            task.delay(InputKeys[KeyName].Cooldown, function() 
                print("Task.deley block")
                table.remove(PlayerTable,table.find(PlayerTable, player))
            end)
        end 
    end
end

UserInputService.InputBegan:Connect(InputBegan)
UserInputService.InputEnded:Connect(InputEnded)

