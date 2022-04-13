local combat = composer.newScene()

-- groups
local combatGroup = display.newGroup()

-- initialize elements
local bg = require("background"):new()
combatGroup:insert(bg)

local player = require("player"):new()
player:init()
combatGroup:insert(player)

local enemy = require("enemy"):new()
enemy:init()
combatGroup:insert(enemy)

--------------------------------------------------------------------------------
-- Combat loop
--------------------------------------------------------------------------------

local pTurnTimer
local eTurnTimer

local function playerTurn()
    -- enemy and player alive? attack
    if enemy and player.stats.hp > 0 then
        player:attack()
        enemy:takeDamage(math.max(player.stats.atk, 1))
    else
        -- stop attacking. if player dead, remove
        timer.cancel(pTurnTimer)
        if player.stats.hp <= 0 then
            display.remove(player)
            player = nil
        end
    end
end

local function enemyTurn()
    -- player and enemy alive? attack
    if player and enemy.stats.hp > 0 then
        enemy:attack()
        player:takeDamage(math.max(enemy.stats.atk, 1))
    else
        -- stop attacking. if enemy dead, remove
        timer.cancel(eTurnTimer)
        if enemy.stats.hp <= 0 then
            display.remove(enemy)
            enemy = nil
        end
    end
end

local function combatLoop()
    -- start player and enemy turns
    pTurnTimer = timer.performWithDelay(player.stats.speed, playerTurn, 0)
    eTurnTimer = timer.performWithDelay(enemy.stats.speed, enemyTurn, 0)
end

combatLoop()

return combat