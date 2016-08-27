require("scripts/Enemy")
require("scripts/globals")

EnemyManager = {}

function EnemyManager:new()
    local enemyImage = lg.newImage(imagesFolder .. "enemy.png")
  local o = {
    enemies = {
      Enemy:new(enemyImage, 300, 300, 10, 2, 2),
      Enemy:new(enemyImage, 100, 100, 10, 2, 2)
    }
   }
  setmetatable(o, self)
  self.__index = self
  return o
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
