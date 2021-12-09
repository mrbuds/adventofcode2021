-- https://adventofcode.com/2021/day/9


local map = {}
local result = 0

for line in io.lines("9.input") do
  local points = {}
  for v in line:gmatch("(%d)") do
    points[#points+1] = tonumber(v)
  end
  map[#map+1] = points
end

for x=1,#map do
  for y=1,#map[1] do
    local v = map[x][y]
    local a = map[x-1] and map[x-1][y]
    local b = map[x+1] and map[x+1][y]
    local c = map[x] and map[x][y+1]
    local d = map[x] and map[x][y-1]

    if (not a or a > v)
    and (not b or b > v)
    and (not c or c > v)
    and (not d or d > v)
    then
      result = result + v + 1
    end
  end
end

print("result", result)