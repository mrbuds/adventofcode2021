-- https://adventofcode.com/2021/day/2#part2

local lines = 0
local position = 0
local depth = 0
local aim = 0
local w, n

for line in io.lines("2.input") do
    if line then
        lines = lines + 1
        w, n = line:match("(%w+) (%d+)")
        if w and n then
            if w == "forward" then
                position = position + n
                depth = depth + aim * n
            elseif w == "down" then
                aim = aim + n
            elseif w == "up" then
                aim = aim - n
            end
        end
    end
end
print(lines, position, depth, position * depth)
