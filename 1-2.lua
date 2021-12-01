-- https://adventofcode.com/2021/day/1#part2

local larger, lines = 0, 0
local prev1, prev2, prev3 = 0, 0, 0
local window, prevwindow = 0, 0

for line in io.lines("1.input") do
    lines = lines + 1
    line = tonumber(line)
    prev3 = prev2
    prev2 = prev1
    prev1 = line
    prevwindow = window
    window = prev1 + prev2 + prev3
    if lines > 3 then
        -- print(window, prevwindow)
        if window > prevwindow then
            larger = larger + 1
        end
    end
end
print(lines, larger)
