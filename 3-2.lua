-- https://adventofcode.com/2021/day/3#part2


local data = {}
local oxigenCandidates, co2Candidates = {}, {}

local lines = 0
for line in io.lines("3.input") do
    lines = lines + 1
    data[lines] = {}
    local i = 0
    for v in line:gmatch("(%d)") do
        i = i + 1
        data[lines][i] = tonumber(v)
    end
    oxigenCandidates[lines] = true
    co2Candidates[lines] = true
end

local width = #data[1]

local function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

-- oxigen
for i=1,width do
    local x = 0
    for k in pairs(oxigenCandidates) do
        x = x + (data[k][i] == 1 and 1 or -1)
    end
    local mostCommon = x >= 0 and 1 or 0
    for k in pairs(oxigenCandidates) do
        if data[k][i] ~= mostCommon then
            oxigenCandidates[k] = nil
        end
    end
    if tablelength(oxigenCandidates) == 1 then break end
end

-- co2
for i=1,width do
    local x = 0
    for k in pairs(co2Candidates) do
        x = x + (data[k][i] == 1 and 1 or -1)
    end
    local mostCommon = x >= 0 and 1 or 0
    for k in pairs(co2Candidates) do
        if data[k][i] == mostCommon then
            co2Candidates[k] = nil
        end
    end
    if tablelength(co2Candidates) == 1 then break end
end

local oxygen, co2
for k in pairs(oxigenCandidates) do
    local r = table.concat(data[k],"")
    oxygen = tonumber(r, 2)
    print("oxygen", k, r, oxygen)
end
for k in pairs(co2Candidates) do
    local r = table.concat(data[k],"")
    co2 = tonumber(r, 2)
    print("co2", k, r, co2)
end
print("result", oxygen * co2)
