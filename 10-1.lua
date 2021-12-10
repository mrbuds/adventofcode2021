-- https://adventofcode.com/2021/day/10

local score = 0
local char_score = {
  [")"] = 3,
  ["]"] = 57,
  ["}"] = 1197,
  [">"] = 25137
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
  local pile = {}
  for c in line:gmatch("(.)") do
    if opener[c] then
      pile[#pile + 1] = c
    elseif closer[c] then
      if pile[#pile] ~= closer[c] then
        score = score + char_score[c]
        break
      else
        pile[#pile] = nil
      end
    end
  end
end
print(score)