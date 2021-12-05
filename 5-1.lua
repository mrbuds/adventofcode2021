-- https://adventofcode.com/2021/day/5

local map = {}

local function mark(x, y)
    map[x] = map[x] or {}
    map[x][y] = (map[x][y] or 0) + 1
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
        end
    end
end

local count = 0
for x,rows in pairs(map) do
    for y,value in pairs(rows) do
        if value > 1 then count = count + 1 end
    end
end

print(count)
