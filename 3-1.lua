-- https://adventofcode.com/2021/day/3

local ftable = {}
for line in io.lines("3.input") do
    for i=1,#line do
        ftable[i] = (ftable[i] or 0) + (line:sub(i,i) == "1" and 1 or -1)
    end
end
local gamma = ""
local epsilon = ""
for i=1,#ftable do
    gamma = gamma .. (ftable[i] > 0 and 1 or 0)
    epsilon = epsilon .. (ftable[i] > 0 and 0 or 1)
end
print("gamme", tonumber(gamma, 2))
print("epsilon", tonumber(epsilon, 2))
print("power consumption", tonumber(gamma, 2) * tonumber(epsilon, 2))
