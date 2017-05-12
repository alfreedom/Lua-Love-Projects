

function draw_cell(cell, x, y, color)

    if cell == 1 then
        love.graphics.setColor(color)
        love.graphics.rectangle("fill", x, y,_square_size,_square_size)
    else
        love.graphics.setColor(colors.coral)
        love.graphics.rectangle("fill", x, y,_square_size,_square_size)
    end
    
end

local function check_cell(i, j , cell, board) 
    local _alives = 0
    -- Checa a la derecha
    if i < BOARD_SIZE then
        if board[i+1][j] == 1 then
            _alives = _alives + 1
        end

        if i < BOARD_SIZE and j > 1 then
            if board[i+1][j-1 ] == 1 then
                _alives = _alives + 1
            end
        end

        if i < BOARD_SIZE and j < BOARD_SIZE then
            if board[i+1][j+1] == 1 then
                _alives = _alives + 1
            end
        end
    end

    
    -- Checa a la izquierda
    if i > 1 then
        if board[i-1][j] == 1 then
            _alives = _alives + 1
        end

        if i > 1 and j > 1 then
            if board[i-1][j-1 ] == 1 then
                _alives = _alives + 1
            end
        end

        if i > 1 and j < BOARD_SIZE then
            if board[i-1][j+1 ] == 1 then
                _alives = _alives + 1
            end
        end
    end

    -- Checa abajo
    if j < BOARD_SIZE then
        if board[i][j+1] == 1 then
            _alives = _alives + 1
        end
    end

    -- Checa arriba
    if j > 1 then
        if board[i][j-1] == 1 then
            _alives = _alives + 1
        end
    end


    if cell == 1 and (_alives == 2 or _alives == 3) then
            return 1
    elseif _alives == 3 then
            return 1
    end

    return 0
end

function update_conway(board)
    local _b={}

    for i=1, BOARD_SIZE do
        _b[i]={}
        for j=1, BOARD_SIZE do
            cell = board[i][j]
             _b[i][j] = check_cell(i,j,cell, board)
        end
    end

    return _b
end