function love.load()
    love.window.setTitle("matrix calculator")
    Coor = {}
    Gui = require('gui')
    love.window.setMode(1024, 768)
    User_input =''
    Res =''


end

function love.textinput(t)
    User_input= User_input .. t
    
end
function love.keypressed(key)
    if key == "return" then
        Res = calculate(input)
        User_input = ""
    elseif key == "backspace" then
        User_input = input:sub(1, -2)
    end
end
function love.keyboard.isDown(key)
    if key == "backspace" then
        User_input= ""
        return true
    end
    
end

function love.update(dt)
    Coor.x, Coor.y = love.mouse.getPosition()
    
end

function love.draw()
    love.graphics.print("x: ".. Coor.x .. " y: " .. Coor.y)

 end
