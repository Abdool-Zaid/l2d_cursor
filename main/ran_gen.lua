local random = {}

function random.color ()
local digits = {0,1,2,3,4,5,6,7,8,9,"a","b","c","d","e","f"}

local color= "#"
    for i = 1, 6, 1 do
        color= color .. digits[math.random(16)]
    end
    return color
end
function random.color_RGB()
    local res = {}
        res.r= math.random()
        res.g= math.random()
        res.b= math.random()
    return res
end
return random