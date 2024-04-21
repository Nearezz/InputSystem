local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local InputKeys = require(ReplicatedStorage.Shared.InputKeys)

local function InputBegan(input,gpe) 
    if gpe then return end 


    if (input.KeyCode.Name == InputKeys[input.KeyCode.Name]) then 
        print(input.KeyCode)
    end
end

-- local function InputEnded(input,gpe) 
--     if gpe then return end 
--     if (input.KeyCode.Name == InputKeys[input.KeyCode.Name] and InputKeys[input.KeyCode.Name].Type == "Hold" ) then 
--         print("input ended: " .. input.KeyCode.Name)
--     end
-- end

UserInputService.InputBegan:Connect(InputBegan)
-- UserInputService.InputEnded:Connect(InputEnded)

