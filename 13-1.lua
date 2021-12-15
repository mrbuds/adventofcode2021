-- https://adventofcode.com/2021/day/13

local map = {}
local max_x, max_y = 0, 0

local function fold_x(x)
  for y in pairs(map) do
    --for from in pairs(map[y]) do wtf ca marche pas§§??
    for from=x,max_x do
      --if from >= x then
      if map[y][from] then
        local to = x*2-from
        if to >= 0 then
          map[y][to] = true
        end
        map[y][from] = nil
      end
    end
  end
end

local function fold_y(y)
  for from in pairs(map) do
    if from >= y then
      local to = y*2 - from
      if to >= 0 then
        map[to] = map[to] or {}
        for x in pairs(map[from]) do
          map[to][x] = true
        end
      end
      map[from] = nil
    end
  end
end

local function count_dots()
  local r = 0
  for _,row in pairs(map) do
    for _ in pairs(row) do
      r = r + 1
    end
  end
  return r
end

local function print_map()
  for y = 0, max_y do
    local row = ""
    for x = 0, max_x do
      row = row .. (map[y] and map[y][x] and "#" or ".")
    end
    print(row)
  end
end

local first_fold = true
for line in io.lines("13.input") do
  for x,y in line:gmatch("(%d+),(%d+)") do
    x = tonumber(x)
    y = tonumber(y)
    max_x = math.max(x, max_x)
    max_y = math.max(y, max_y)
    map[y] = map[y] or {}
    map[y][x] = true
  end
  if line:match("fold along") then
    local x = tonumber(line:match("x=(%d+)"))
    local y = tonumber(line:match("y=(%d+)"))
    if y then
      fold_y(y)
    end
    if x then
      fold_x(x)
    end
    if first_fold then
      print(count_dots())
      break
    end
  end
end
