-- https://adventofcode.com/2021/day/14

local chain
local total_steps = 40
local dict = {}
local count_chars = {}
local count_pairs = {}

for line in io.lines("14.diag") do
  if line:match("^%a+$") then
    chain = line
  else
    local cc, between = line:match("^(%a%a) %-> (%a)$")
    if cc and between then
      dict[cc] = {
        left = cc:sub(1,1)..between,
        right = between..cc:sub(2,2),
        between = between
      }
    end
  end
end

local function recurse_count(cc, step)
  if step == 0 then return end
  local pair = dict[cc]
  count_pairs[cc] = (count_pairs[cc] or 1) - 1
  count_pairs[pair.left] = count_pairs[cc] + 1
  count_pairs[pair.right] = count_pairs[cc] + 1
  recurse_count(pair.left, step - 1)
  recurse_count(pair.right, step - 1)
end

for i=1,#chain-1 do
  local cc = chain:sub(i,i+1)
  recurse_count(cc, total_steps)
end

--[[
local array = {}
for c, v in pairs(count_chars) do
  table.insert(array, {c,v})
end
table.sort(array, function(a,b) return a[2]<b[2] end)
print(array[1][1], array[1][2])
print(array[#array][1], array[#array][2])
print(array[#array][2] - array[1][2])
]]--