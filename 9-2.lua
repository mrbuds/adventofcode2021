-- https://adventofcode.com/2021/day/9


local map = {}
local bassins = {}
local visited = {}
local result = 0

for line in io.lines("9.input") do
  local points = {}
  for v in line:gmatch("(%d)") do
    points[#points+1] = tonumber(v)
  end
  map[#map+1] = points
end

local function calc_bassin(x, y)
  if not map[x] or not map[x][y] then return 0 end
  if map[x][y] == 9 then return 0 end
  if visited[x][y] then return 0 end
  visited[x][y] = true
  return 1 + calc_bassin(x-1, y) + calc_bassin(x+1, y) + calc_bassin(x, y-1) + calc_bassin(x, y+1)
end

for x=1,#map do
  for y=1,#map[1] do
    visited[x] = visited[x] or {}
    visited[x][y] = false
  end
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
      local size = calc_bassin(x,y)
      table.insert(bassins, size)
    end
  end
end
table.sort(bassins)
if #bassins >= 3 then
  print("result", bassins[#bassins] * bassins[#bassins-1] * bassins[#bassins-2])
end
