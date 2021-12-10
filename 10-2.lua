-- https://adventofcode.com/2021/day/10#2

local scores = {}
local char_score = {
  [")"] = 1,
  ["]"] = 2,
  ["}"] = 3,
  [">"] = 4
}
local opener = {
  ["("] = ")",
  ["["] = "]",
  ["{"] = "}",
  ["<"] = ">"
}
local closer = {}
for k,v in pairs(opener) do closer[v] = k end

for line in io.lines("10.input") do
  local corrupt = false
  local pile = {}
  for c in line:gmatch("(.)") do
    if opener[c] then
      pile[#pile + 1] = c
    elseif closer[c] then
      if pile[#pile] ~= closer[c] then
        corrupt = true
        break
      else
        pile[#pile] = nil
      end
    end
  end
  if not corrupt and #pile > 0 then
    local score = 0
    for i=#pile,1,-1 do
      score = score * 5 + char_score[opener[pile[i]]]
    end
    if score > 0 then
      scores[#scores+1] = score
    end
  end
end
table.sort(scores)
print(scores[(#scores+1)/2])