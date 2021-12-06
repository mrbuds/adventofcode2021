-- https://adventofcode.com/2021/day/6

local fishes = {
  [0] = 0,
  [1] = 0,
  [2] = 0,
  [3] = 0,
  [4] = 0,
  [5] = 0,
  [6] = 0,
  [7] = 0,
  [8] = 0,
}

for line in io.lines("6.input") do
    for fish in line:gmatch("%d",",") do
      fish = tonumber(fish)
      fishes[fish] = fishes[fish] + 1
    end
end

local function iter(days, fishes)
  local f = {}
  for k,v in pairs(fishes) do f[k] = v end
  for day=1,days do
    local babies = f[0]
    f[0] = f[1]
    f[1] = f[2]
    f[2] = f[3]
    f[3] = f[4]
    f[4] = f[5]
    f[5] = f[6]
    f[6] = f[7] + babies
    f[7] = f[8]
    f[8] = babies
  end
  local sum = 0
  for k,v in pairs(f) do sum = sum + v; end
  return sum
end

print("80", iter(80, fishes))
print("256", iter(256, fishes))