local Player = {}

function Player:new()
    local player = display.newGroup()
    local playerHPBar
    local playerSprite
    local pMaxHP
    
    player.stats = { hp = 10, speed = 1500, atk = 1, def = 1 }
    
    function player:init()
        pMaxHP = player.stats.hp
      
        playerSprite = display.newImageRect(player, "assets/fighterback.png", 16, 19)
        playerSprite.x = g.centerX
        playerSprite.y = g.centerY * 1.5

        playerHPBar = display.newRect(playerSprite.x, playerSprite.y + 15, 10, 2)
        playerHPBar:setFillColor(1, 0, 0)
    end
    
    function player:attack()
        timer.performWithDelay(25, function() playerSprite.y = playerSprite.y - 1 end, 5)
        timer.performWithDelay(300, function() timer.performWithDelay(25, function() playerSprite.y = playerSprite.y + 1 end, 5) end)
    end
    
    function player:takeDamage(dmg)
        player.stats.hp = math.max(player.stats.hp - dmg, 0)
        player:updateHP()
    end
    
    function player:updateHP()
        playerHPBar.width = (player.stats.hp / pMaxHP) * 10
    end
    
    return player  
end

return Player