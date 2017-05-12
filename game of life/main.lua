--[[
    Plantilla para la programación de juegos en lenguaje LUA con la API Love2D.

    Esta plantilla incluye algunas definiciones de las funciones callback
    de la API love.

    Plantilla creada por:
        Alfredo Orozco de la Paz
        alfredoopa@gmail.com
        www.vidaembebida.wordpress.com
--]]

require("colors")
require("conway")

BOARD_SIZE = 150
BOARD_MARGIN = 0
_board = {}
_square_size = 0
seconds = 0
_play = false


function love.load()
    love.graphics.setBackgroundColor(255, 255, 255)
    
    for i=1, BOARD_SIZE do
        _board[i]={}
        for j=1, BOARD_SIZE do
            _board[i][j] = 0
        end
    end

    _square_size = (love.window.getWidth() - BOARD_MARGIN*2)/BOARD_SIZE
end


function love.draw()
    --Code to do drawing event.
    local x= BOARD_MARGIN
    local y= BOARD_MARGIN
    love.graphics.setColor(0, 0, 0)
    for i=1, BOARD_SIZE do
        for j=1, BOARD_SIZE do
            draw_cell(_board[i][j],x,y,colors.white)            
            x = x + _square_size;
        end

        y =  y + _square_size
        x = BOARD_MARGIN
    end
end


function love.update(dt)
    --Code to do update event. 

    if _play then 
            sencods=0
            _board = update_conway(_board)
         
    end  
end


function love.quit()
    --Code to manage the exit event.
end

function love.keypressed(key)
   --Code to manage the key pressed event.
   if key == "escape" then
        love.event.quit()
   end

   if key == "p" then
    _play = not _play
   end
   if key == "c" then
    _play = false
    for i=1, BOARD_SIZE do
        for j=1, BOARD_SIZE do
            _board[i][j] = 0
        end
    end
   end
end


function love.mousepressed(x, y, button)

    local _x = BOARD_MARGIN
    local _y = BOARD_MARGIN
    if x > BOARD_MARGIN and 
       x < (BOARD_MARGIN + (_square_size * BOARD_SIZE)) and 
       y > BOARD_MARGIN and 
       y < BOARD_MARGIN + _square_size * BOARD_SIZE then
        
        for i=1, BOARD_SIZE do
            for j=1, BOARD_SIZE do
                if x > _x and 
                   x < _x + _square_size and 
                   y > _y and
                   y < _y + _square_size then

                    if button == "l" then
                        _board[i][j]=1
                    elseif button == "r" then
                        _board[i][j]=0
                    end
               end
                   _x = _x +_square_size
            end

            _x = BOARD_MARGIN
            _y = _y +_square_size
        end 

    end
end


function love.mousemoved( x, y, dx, dy )
    --Code to manage the mouse movement event.
    if love.mouse.isDown("l") then
        love.mousepressed(x,y,'l')
    end --Code to manage the mouse movement event.
    if love.mouse.isDown("r") then
        love.mousepressed(x,y,'r')
    end
end

