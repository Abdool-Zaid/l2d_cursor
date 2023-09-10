local res = {}

function res.check_pos(tarX,tarY,radius,Hx,Hy)
    local distance = math.sqrt((tarX - Hx)^2 + (tarY - Hy)^2)

    -- Check if the distance is less than or equal to the circle's radius
    local res = distance <= radius

    return res
end

function res.alter_score(score , increment)
    score = score + increment
    return score , -1,-1
end
return res