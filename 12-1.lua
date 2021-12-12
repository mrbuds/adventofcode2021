-- https://adventofcode.com/2021/day/12

local nodes = {}

local function new_node(a, b)
  nodes[a] = nodes[a] or {}
  local node = nodes[a]
  if node.smallcave == nil then
    local first_char = a:sub(1,1)
    node.smallcave = first_char >= "a" and first_char <= "z"
  end
  if b then
    node.children = node.children or {}
    if not node.children[b] then
      node.children[b] = true
      new_node(b, a)
    end
  end
end

for line in io.lines("12.input") do
  for a,b in line:gmatch("([^%-]+)-([^%-]+)") do
    new_node(a, b)
  end
end

local function all_routes_from(a,finish, visited)
  if a == finish then return 1 end
  local local_visited = {}
  for k in pairs(visited) do local_visited[k] = true end
  if nodes[a].smallcave then
    if local_visited[a] then return 0 end
    local_visited[a] = true
  end
  local count = 0
  for name in pairs(nodes[a].children) do
    count = count + all_routes_from(name, finish, local_visited)
  end
  return count
end

print(all_routes_from("start","end",{}))