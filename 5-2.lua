-- https://adventofcode.com/2021/day/5#part2

local map = {}
local max,min,abs = math.max,math.min,math.abs
local function mark(x, y)
    map[x] = map[x] or {}
    map[x][y] = (map[x][y] or 0) + 1
end

-- for debug
local function print_map()
    local maxX, maxY = 0, 0
    for k,rows in pairs(map) do
        if k > maxX then maxX = k end
        for z in pairs(rows) do
            if z > maxY then maxY = z end
        end
    end
    for y=0,maxY do
        local out = ""
        for x=0,maxX do
            out = out..(map[x] and map[x][y] or ".")
        end
        print(out)
    end
end

for line in io.lines("5.input") do
    local x1,y1,x2,y2 = line:match("(%d+),(%d+) %-> (%d+),(%d+)")
    if x1 and y2 and x2 and y2 then
        x1,y1,x2,y2 = tonumber(x1), tonumber(y1), tonumber(x2), tonumber(y2)
        if x1 == x2 then
            for i=y1,y2,(y1<=y2 and 1 or -1) do
                mark(x1, i)
            end
        elseif y1 == y2 then
            for i=x1,x2,(x1<=x2 and 1 or -1) do
                mark(i, y1)
            end
        elseif max(x1,x2) - min(x1,x2) == max(y1,y2) - min(y1,y2) then
            local x_direction = x1 <= x2 and 1 or -1
            local y_direction = y1 <= y2 and 1 or -1
            local length = abs(max(x1,x2) - min(x1,x2))
            for i=0,length do
                mark(x1+(i*x_direction),y1+(i*y_direction))
            end
        end
    end
end



local count = 0
for x,rows in pairs(map) do
    for y,value in pairs(rows) do
        if value > 1 then count = count + 1 end
    end
end

print_map()
print("result", count)

