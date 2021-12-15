-- https://adventofcode.com/2021/day/13

local map = {}
local max_x, max_y = 0, 0

local function fold_x(foldx)
  for y=0,max_y do
    if map[y] then
      for x=0,max_x do
        if map[y][x] then
          local dest = foldx - (x - foldx)
          if dest >= 0 then
            map[y][dest] = true
          end
        end
      end
    end
  end
  max_x = foldx - 1
end

local function fold_y(foldy)
  for y=0,max_y do
    if y > foldy and map[y] then
      local dest = foldy - (y - foldy)
      for x=0,max_x do
        if map[y][x] then
          map[dest] = map[dest] or {}
          map[dest][x] = true
        end
      end
    end
  end
  max_y = foldy - 1
end

local function count_dots()
  local r = 0
  for y=0,max_y do
    if map[y] then
      for x=0,max_x do
        if map[y][x] then
          r = r + 1
        end
      end
    end
  end
  return r
end

local function print_map()
  for y = 0, max_y do
    local row = ""
    for x = 0, max_x do
      row = row .. (map[y] and map[y][x] and "#" or " ")
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
  end
end
print(count_dots())
print_map()