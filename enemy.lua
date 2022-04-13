local Enemy = {}

function Enemy:new()
    local enemy = display.newGroup()
    local enemyHPBar
    local enemySprite
    local eMaxHP
    local eMoveForward
    local eMoveBack
    
    enemy.stats = { hp = 10, speed = 2000, atk = 1, def = 1 }
    
    function enemy:init()
        eMaxHP = enemy.stats.hp
      
        enemySprite = display.newImageRect(enemy, "assets/testenemy.png", 16, 16)
        enemySprite.x = g.centerX
        enemySprite.y = g.centerY / 1.5
        
        enemyHPBar = display.newRect(enemySprite.x, enemySprite.y - 5, 10, 2)
        enemyHPBar:setFillColor(1, 0, 0)
    end
    
    function enemy:attack()
        if enemy then
            eMoveForward = timer.performWithDelay(25, function() enemySprite.y = enemySprite.y + 1 end, 5)
            eMoveBack = timer.performWithDelay(300, function() timer.performWithDelay(25, function() enemySprite.y = enemySprite.y - 1 end, 5) end)
        end
    end
    
    function enemy:takeDamage(dmg)
        if enemy then
            enemy.stats.hp = math.max(enemy.stats.hp - dmg, 0)
            enemy:updateHP()
        end
    end
    
    function enemy:updateHP()
        enemyHPBar.width = (enemy.stats.hp / eMaxHP) * 10
        if enemy.stats.hp <= 0 then enemy:destroy() end
    end
    
    function enemy:destroy()
        timer.cancel(eMoveForward)
        timer.cancel(eMoveBack)
        display.remove(enemy)
        enemy = nil
    end
    
    return enemy
end

return Enemy