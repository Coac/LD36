require("scripts/Enemy")
require("scripts/globals")

EnemyManager = {}

function EnemyManager:new()
    local enemyImage = lg.newImage(imagesFolder .. "enemy.png")
  local o = {
    enemies = {
      Enemy:new(enemyImage, 300, 300, 10, 2),
      Enemy:new(enemyImage, 100, 100, 10, 2)
    }
   }
  setmetatable(o, self)
  self.__index = self
  return o
end
function EnemyManager:add(enemy)
  table.insert(self.enemies,enemy)
end
function EnemyManager:remove(i)
  table.remove(self.enemies,i)
end

function EnemyManager:getNearestEnemy(x, y)
  local returnEnemy = nil
  local minDist = 9999999999
  for i, enemy in ipairs(self.enemies) do
    local dist = math.dist(x, y, enemy.x, enemy.y)
    if dist < minDist then
      minDist = dist
      returnEnemy = enemy
    end
  end

  return returnEnemy
end

function EnemyManager:update(dt)
  for i, enemy in ipairs(self.enemies) do
    enemy:update(dt)
  end
end

function EnemyManager:draw()
  for i, enemy in ipairs(self.enemies) do
    enemy:draw()
  end
end
