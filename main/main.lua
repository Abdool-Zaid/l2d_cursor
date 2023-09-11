function love.load()
    love.window.setTitle("matrix calculator")
    coor = {}
    gui = require('gui')
    love.window.setMode(1024, 768)

end
function love.update(dt)
    coor.x, coor.y = love.mouse.getPosition()
    
end

function love.draw()
    love.graphics.print("x: ".. coor.x .. " y: " .. coor.y) 
 end
