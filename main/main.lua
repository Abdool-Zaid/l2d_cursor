local ran = require("ran_gen")
local logic = require("logic")
local tar = {}
local score= 0
local dt 

function love.load ()
    hitSFX = love.audio.newSource("assets/audio/hit.wav", "static")
    missSfX = love.audio.newSource("assets/audio/miss.wav", "static")
    love.window.setFullscreen(true)
    dt = love.timer.getTime()
    tar.size=20
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    tar.color= ran.color_RGB()
    tar.x= math.random(width)
    tar.y=math.random(height)
end

local clickX, clickY = -1, -1

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        clickX, clickY = x, y
    end
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" or key == "e" then
       love.event.quit()
    end
 end

function love.update(dt)
    
    
    if clickX >= 0 and clickY >= 0 then
        local hit = logic.check_pos(tar.x,tar.y,tar.size,clickX,clickY)
        if hit == true then
            score, clickX,clickY = logic.alter_score(score , 1)
            love.audio.play(hitSFX)
            local width = love.graphics.getWidth()
            local height = love.graphics.getHeight()
            tar.color= ran.color_RGB()
            tar.x= math.random(width)
            tar.y=math.random(height)
            
        end 
    end
    
end    

function love.draw()
    local dur= love.timer.getTime() - dt
    love.graphics.setColor(1,1,1)
    love.graphics.print("score: ".. score .."\n press e to exit")
    love.graphics.setColor(tar.color.r,tar.color.g,tar.color.b)
    love.graphics.circle("fill",tar.x,tar.y,tar.size)
    
    if clickX >= 0 and clickY >= 0 then
        love.graphics.setColor(255, 0, 0)  
        love.audio.play(missSfX)
        love.graphics.circle("fill", clickX, clickY, 10)
        score, clickX,clickY = logic.alter_score(score , -1)
                 
        end
end