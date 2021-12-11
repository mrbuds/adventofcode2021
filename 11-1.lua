-- https://adventofcode.com/2021/day/11

local map = {}
for line in io.lines("11.input") do
  local row = {}
  for v in line:gmatch("(%d)") do
    row[#row+1] = tonumber(v)
  end
  map[#map+1] = row
end

local count_lighted = 0

local function incr(x, y, lighted)
  if not map[x]
  or not map[x][y]
  or (lighted[x] and lighted[x][y])
  then
    return
  end
  if map[x][y] ~= 9 then
    map[x][y] = map[x][y] + 1
  elseif map[x][y] == 9 then
    map[x][y] = 0
    lighted[x] = lighted[x] or {}
    lighted[x][y] = true
    count_lighted = count_lighted + 1
    for a = -1, 1 do
      for b = -1, 1 do
        if not(a==0 and b==0) then
          incr(x+a, y+b, lighted)
        end
      end
    end
  end
end

for step=1,100 do
  local lighted = {}
  for x=1,#map do
    for y=1,#map[1] do
      incr(x,y,lighted)
    end
  end
end

print(count_lighted)