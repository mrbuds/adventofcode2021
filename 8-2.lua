-- https://adventofcode.com/2021/day/7

--[[
  0:      1:      2:      3:      4:
 aaaa    ....    aaaa    aaaa    ....
b    c  .    c  .    c  .    c  b    c
b    c  .    c  .    c  .    c  b    c
 ....    ....    dddd    dddd    dddd
e    f  .    f  e    .  .    f  .    f
e    f  .    f  e    .  .    f  .    f
 gggg    ....    gggg    gggg    ....

  5:      6:      7:      8:      9:
 aaaa    aaaa    aaaa    aaaa    aaaa
b    .  b    .  .    c  b    c  b    c
b    .  b    .  .    c  b    c  b    c
 dddd    dddd    ....    dddd    dddd
.    f  e    f  .    f  e    f  .    f
.    f  e    f  .    f  e    f  .    f
 gggg    gggg    ....    gggg    gggg
]]
local a,b,c,d,e,f,g = 8,6,8,7,4,9,7
local score_segment = {
  [0] = a+b+c+e+f+g,
  [1] = c+f,
  [2] = a+c+d+e+g,
  [3] = a+c+d+f+g,
  [4] = b+c+d+f,
  [5] = a+b+d+f+g,
  [6] = a+b+d+e+f+g,
  [7] = a+c+f,
  [8] = a+b+c+d+e+f+g,
  [9] = a+b+c+d+f+g
}
local score_segment_reverse = {}
for k,v in pairs(score_segment) do
  score_segment_reverse[v] = k
  --print(k, v)
end

local result = 0

for line in io.lines("8.input") do
  local i = 0
  local score_segments_line = {}
  local decoded = ""
  for digit in line:gmatch("%w+") do
    i = i + 1
    if i <= 10 then
      for letter in digit:gmatch("%w") do
        score_segments_line[letter] = (score_segments_line[letter] or 0) + 1
      end
    else
      local digit_score = 0
      for letter in digit:gmatch("%w") do
        digit_score = digit_score + score_segments_line[letter]
      end
      decoded = decoded .. score_segment_reverse[digit_score]
    end
  end
  result = result + tonumber(decoded)
end

print(result)