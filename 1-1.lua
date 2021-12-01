-- https://adventofcode.com/2021/day/1

local larger, lines = 0, 0
local prev

for line in io.lines("1.input") do
    lines = lines + 1
    line = tonumber(line)
    if prev and line > prev then
        larger = larger + 1
    end
    prev = line
end
print(lines, larger)
