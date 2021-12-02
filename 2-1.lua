-- https://adventofcode.com/2021/day/2

local lines = 0
local position = 0
local depth = 0
local w, n

for line in io.lines("2.input") do
    if line then
        lines = lines + 1
        w, n = line:match("(%w+) (%d+)")
        if w and n then
            if w == "forward" then
                position = position + n
            elseif w == "down" then
                depth = depth + n
            elseif w == "up" then
                depth = depth - n
            end
        end
    end
end
print(lines, position, depth, position * depth)
