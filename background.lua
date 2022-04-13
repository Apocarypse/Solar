local Background = {}

function Background:new()
    local background = display.newGroup()
    
    function background:init()
        local bg = display.newImageRect(background, "assets/testbg.png", g.screenWidth, g.screenHeight)
        bg.x = g.centerX
        bg.y = g.centerY
        bg.fill.effect = "filter.vignette"
        bg.fill.effect.radius = 0.5
    end
    
    background:init()
    
    return background
end

return Background