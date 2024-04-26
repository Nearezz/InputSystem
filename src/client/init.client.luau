local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local InputKeys = require(ReplicatedStorage.Shared.InputKeys)
local player : Player = game.Players.LocalPlayer

local PlayerTable = {}

local function InputBegan(input,gpe) 
    if gpe then return end 
    local KeyName = input.KeyCode.Name
    if (InputKeys[KeyName]) then 
        print("input began: " .. input.KeyCode.Name)
        table.insert(PlayerTable,player)
        print(PlayerTable)
    end
end

local function InputEnded(input,gpe) 
    if gpe then return end 
    local KeyName = input.KeyCode.Name

   
    if (InputKeys[KeyName]) then 
        if InputKeys[KeyName].Type == "Hold" then 
            print("input ended: " .. input.KeyCode.Name)
        end 

    end
end

UserInputService.InputBegan:Connect(InputBegan)
UserInputService.InputEnded:Connect(InputEnded)

