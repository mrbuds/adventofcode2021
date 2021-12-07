-- https://adventofcode.com/2021/day/7

local crabs = {}
for line in io.lines("7.input") do
    for crab in line:gmatch("%d+",",") do
      table.insert(crabs, tonumber(crab))
    end
end

local min, max
for _, v in ipairs(crabs) do
  min = min and math.min(min, v) or v
  max = max and math.max(max, v) or v
end

local minimal_fuel
for i = min, max do
  local fuel = 0
  for j = 1, #crabs do
    local length = crabs[j] > i and crabs[j] - i or i - crabs[j]
    for i=1,length do
      fuel = fuel + i
    end
  end
  minimal_fuel = minimal_fuel and math.min(minimal_fuel, fuel) or fuel
end
print(minimal_fuel)