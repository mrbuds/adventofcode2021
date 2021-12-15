-- https://adventofcode.com/2021/day/14

local chain
local total_steps = 10
local dict = {}

for line in io.lines("14.input") do
  if line:match("^%a+$") then
    chain = line
  else
    local cc, between = line:match("^(%a%a) %-> (%a)$")
    if cc and between then
      dict[cc] = between..cc:sub(2,2)
    end
  end
end

for step=1,total_steps do
  local new_chain = chain:sub(1,1)
  for i=1,#chain-1 do
    local cc = chain:sub(i,i+1)
    new_chain = new_chain .. dict[cc]
  end
  chain = new_chain
end

local count_chars = {}
for c in chain:gmatch("%a") do
  count_chars[c] = (count_chars[c] or 0) + 1
end
local array = {}
for c, v in pairs(count_chars) do
  table.insert(array, {c,v})
end
table.sort(array, function(a,b) return a[2]<b[2] end)
print(array[1][1], array[1][2])
print(array[#array][1], array[#array][2])
print(array[#array][2] - array[1][2])