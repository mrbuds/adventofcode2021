-- https://adventofcode.com/2021/day/7

local ezdecode = {
  [2] = 1,
  [3] = 7,
  [4] = 4,
  [7] = 8
}

local result = 0

for line in io.lines("8.input") do
    local i = 0
    for input in line:gmatch("%w+","[%w]+") do
      i = i + 1
      if i > 10 then
        if ezdecode[#input] then result = result + 1 end
      end
    end
end

print(result)