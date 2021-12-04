-- https://adventofcode.com/2021/day/4

local draws = {}
local boards = {}

local lines = 0
local row

for line in io.lines("4.input") do
    lines = lines + 1
    if lines == 1 then
        for n in line:gmatch("(%d+)") do
            table.insert(draws, n)
        end
    end
    if lines >= 3 then
        row = (lines - 2) % 6
        if row == 1 then
            board = {}
        end
        if row > 0 then
            board[row] = {}
            local i = 0
            for n in line:gmatch("(%d+)") do
                i = i + 1
                board[row][i] = {n, false}
            end
        end
        if row == 5 then
            table.insert(boards, board)
        end
    end
end

local function mark(board, n)
    for i=1,5 do
        for j=1,5 do
            if board[i][j][1] == n then
                board[i][j][2] = true
                break
            end
        end
    end
end

local function check_rows(board)
    for i=1,5 do
        local good = true
        for j=1,5 do
            if board[i][j][2] == false then
                good = false
                break
            end
        end
        if good then
            return true
        end
    end
end

local function check_cols(board)
    for i=1,5 do
        local good = true
        for j=1,5 do
            if board[j][i][2] == false then
                good = false
                break
            end
        end
        if good then
            return true
        end
    end
end

local function score(board, n)
    local r = 0
    for i=1,5 do
        local good = true
        for j=1,5 do
            if board[i][j][2] == false then
                r = r + board[i][j][1]
            end
        end
    end
    return r * n
end

for _,draw in ipairs(draws) do
    for i,board in ipairs(boards) do
        mark(board, draw)
        if check_rows(board) or check_cols(board) then
            print("found board", i, "with score", score(board, draw))
            return
        end
    end
end