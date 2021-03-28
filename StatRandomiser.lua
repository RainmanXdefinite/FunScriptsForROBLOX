-- Stat Randomiser Script.
-- Script written by RainmanXdefinite (C) 2021
-- Do not republish this script. If you give me credit then its fine. If you dont then its not fine.
-- This needs to be a LocalScript to Work.

-- Define variables
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character
local humanoid = character:WaitForChild("Humanoid")

-- Define function
function checkIfClass(object,desiredClass)
	local class = object.ClassName
	if class == desiredClass then
		return true
	else
		return false
	end
end

function randomiseBool()
	local value = math.random(0,1)
	if value == 0 then
		return false
	elseif value == 1 then
		return true
	end
end

-- Check class of Humanoid
local class = checkIfClass(humanoid,"Humanoid")

if class then print("Found object is of class Humanoid") else error("Found object is not of class Humanoid") end

-- Create gui elements. We only need to give the ScreenGui itself a name. We dont need to name the descendants.
local gui = Instance.new("ScreenGui",game.StarterGui)
gui.Name = "StatRandomiserGui" -- The reason for this is if you need to include this in another script.
local frame = Instance.new("Frame",gui)
frame.Position = UDim2.new(0.615,0,0.767,0)
frame.Size = UDim2.new(0,438,0,106)
frame.Style = Enum.FrameStyle.RobloxRound
local button = Instance.new("TextButton",frame)
button.Position = UDim2.new(0.032,0,0.09,0)
button.Size = UDim2.new(0,394,0,74)
button.Style = Enum.ButtonStyle.RobloxButtonDefault
button.Text = "Randomise My Stats"

-- Listen for mouse clicks on button and randomise the hell out of the humanoid
button.MouseButton1Click:Connect(function()
	humanoid.JumpPower = math.random(-100,100)
	local sitValue = randomiseBool()
	humanoid.Sit = sitValue
	local jumpValue = randomiseBool()
	humanoid.Jump = jumpValue
	humanoid.Health = math.random(-100,100)
	humanoid.MaxHealth = math.random(-100,100)
	humanoid.HipHeight = math.random(-100,100)
	humanoid.WalkSpeed = math.random(-100,100)
end)
