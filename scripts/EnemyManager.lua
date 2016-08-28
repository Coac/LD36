require("scripts/enemies/Enemy")
require("scripts/enemies/Enemy2")
require("scripts/enemies/Enemy3")
require("scripts/enemies/Enemy4")
require("scripts/enemies/Enemy5")

require("scripts/Wave")

require("scripts/Globals")

EnemyManager = {}

function EnemyManager:new()
  local o = {
    time = 0,
    spawningRate = 0.5,
    enemies = {},
    wave = 1,
    enemyCount = 0,
    isWaiting = false,
    rColor = 255,
    gColor = 255,
    bColor = 255,
    waves = {}
   }

   table.insert(o.waves, Wave:new({Enemy}, 10, 0.5))
   table.insert(o.waves, Wave:new({Enemy, Enemy2}, 10, 0.5))
   table.insert(o.waves, Wave:new({Enemy2, Enemy3}, 10, 0.4))
   table.insert(o.waves, Wave:new({Enemy3, Enemy4}, 10, 0.3))
   table.insert(o.waves, Wave:new({Enemy4}, 10, 0.3))
   table.insert(o.waves, Wave:new({Enemy5}, 9999999999, 0.2))


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

  if(self.isWaiting) then
      if(table.getn(self.enemies) == 0) then
        -- CHANGE WAVE
        self.time = 0
        self.isWaiting = false
        self.wave = self.wave + 1
        self.rColor = math.random(0,255)
        self.gColor = math.random(0,255)
        self.bColor = math.random(0,255)
      end
  else
    local currentWave = self.waves[self.wave]
    self.time = self.time + dt
    if(self.time > currentWave.spawningRate) then
      self.time = 0
      local possibleEnemies = currentWave.possibleEnemies
      local pickedEnemy = possibleEnemies[math.random(1, table.getn(possibleEnemies))]

      local halfWidth = WINDOW_W / 2
      self:add(pickedEnemy:new(halfWidth + math.rsign()*halfWidth, math.random(0, WINDOW_H)))

      self.enemyCount = self.enemyCount + 1
      if(self.enemyCount > currentWave.nbToPick) then
        self.enemyCount = 0
        self.isWaiting = true
      end

    end
  end
end

function EnemyManager:draw()
  lg.setColor(self.rColor, self.gColor, self.bColor)
  for i, enemy in ipairs(self.enemies) do
    enemy:draw()
  end
  lg.setColor(255,255,255)

  lg.print({{0,0,0,255},"Wave " .. self.wave} , WINDOW_W / 2 - 70, 600)


end
