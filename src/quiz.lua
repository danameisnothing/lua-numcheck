-- Help from : https://stackoverflow.com/questions/12069109/getting-input-from-the-user-in-lua
-- Tested on Lua 5.4.2
local numcheck = require("numcheck")
local questionAnswered = 0
local questionRight = 0

local function showEndText()
    local answer = nil
    while true do
        print("Continue ? (type y for yes or n for no)")
        answer = io.read("*l")
        if string.lower(answer) == "y" then
            break
        elseif string.lower(answer) == "n" then
            print("You got " .. tostring(numcheck:round(questionRight / questionAnswered * 100)) .. "% on the quiz (" .. tostring(questionRight) .. " / " .. tostring(questionAnswered) .. ").")
            os.exit(true)
        else
            print("Unrecognised input, please try again.")
        end
    end
end

while true do
    math.randomseed(os.time())
    local questionType = math.random(1, 1)
    if questionType == 1 then
        local randNum = numcheck:round(math.random(-20, 20) * 65536)
        local randomChoice = math.random(1, 2)
        if randomChoice == 1 then
            if randNum == 0 then
                -- hack
                randNum = 100 * numcheck:round(math.random(1, 20))
            end
            print("Is the number " .. tostring(randNum) .. " a POSITIVE number? (true or false)")
            local answer = io.read("*l")
            local correctAns = numcheck:positive(randNum)
            if tostring(correctAns) == string.lower(answer) then
                questionAnswered = questionAnswered + 1
                questionRight = questionRight + 1
                print("That is correct!")
            else
                questionAnswered = questionAnswered + 1
                print("Wrong!, It's "  .. tostring(correctAns))
            end
        else
            if randNum == 0 then
                -- hack
                randNum = 100 * numcheck:round(math.random(1, 20))
            end
            print("Is the number " .. tostring(randNum) .. " a NEGATIVE number? (true or false)")
            local answer = io.read("*l")
            local correctAns = numcheck:positive(randNum)
            if tostring(not correctAns) == string.lower(answer) then
                questionAnswered = questionAnswered + 1
                questionRight = questionRight + 1
                print("That is correct!")
            else
                questionAnswered = questionAnswered + 1
                print("Wrong!, It's "  .. tostring(not correctAns))
            end
        end
    elseif questionType == 2 then
        print("unimplemented")
    elseif questionType == 3 then
        print("unimplemented")
    end
    showEndText()
end
