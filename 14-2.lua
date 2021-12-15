-- https://adventofcode.com/2021/day/14

local chain
local total_steps = 40
local dict = {}
local count_chars = {}
local count_pairs = {}

for line in io.lines("14.input") do
  if line:match("^%a+$") then
    chain = line
  else
    local cc, between = line:match("^(%a%a) %-> (%a)$")
    if cc and between then
      dict[cc] = {
        left = cc:sub(1,1)..between,
        right = between..cc:sub(2,2)
      }
    end
  end
end

-- count initial pairs
for i=1,#chain-1 do
  local cc = chain:sub(i,i+1)
  count_pairs[cc] = (count_pairs[cc] or 0) + 1
end

local added_last_turn = {}
for cc, count in pairs(count_pairs) do
  added_last_turn[cc] = count
end

for step=1, total_steps do
  local added_this_turn = {}
  for cc, count in pairs(added_last_turn) do
    local pair = dict[cc]
    count_pairs[cc] = count_pairs[cc] - added_last_turn[cc]
    count_pairs[pair.left] = (count_pairs[pair.left] or 0) + count
    count_pairs[pair.right] = (count_pairs[pair.right] or 0) + count
    added_this_turn[pair.left] = (added_this_turn[pair.left] or 0) + count
    added_this_turn[pair.right] = (added_this_turn[pair.right] or 0) + count
  end
  added_last_turn = added_this_turn
end

-- count chars in pairs
for cc, count in pairs(count_pairs) do
  local a, b = cc:match("(%a)(%a)")
  count_chars[a] = (count_chars[a] or 0) + count
  count_chars[b] = (count_chars[b] or 0) + count
end

local array = {}
for c, count in pairs(count_chars) do
  table.insert(array, {c, (count + count % 2) / 2}) -- magic
end
table.sort(array, function(a,b) return a[2]<b[2] end)

print(array[1][1], array[1][2])
print(array[#array][1], array[#array][2])
print(array[#array][2] - array[1][2])