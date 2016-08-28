require("scripts/Enemy")
require("scripts/Enemy2")

require("scripts/Globals")

EnemyManager = {}

local enemyImage
function EnemyManager:new()
  enemyImage = lg.newImage(IMG_DIR .. "enemy.png")
  local o = {
    time = 0,
    spawningRate = 0.5,
    enemies = {},
    wave = 1,
    enemyCount = 0,
    isWaiting = false,
    rColor = 255,
    gColor = 255,
    bColor = 255
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

  if(self.isWaiting) then
      if(table.getn(self.enemies) == 0) then
        -- CHANGE WAVE
        self.time = 0
        self.isWaiting = false
        self.wave = self.wave + 1
        self.spawningRate = self.spawningRate - 0.1
        self.rColor = math.random(0,255)
        self.gColor = math.random(0,255)
        self.bColor = math.random(0,255)
      end
  else
    self.time = self.time + dt
    if(self.time > self.spawningRate) then
      self.time = 0
      local halfWidth = WINDOW_W / 2
      self:add(Enemy2:new(halfWidth + math.rsign()*halfWidth, math.random(0, WINDOW_H), 200 + (100 * self.wave)))

      self.enemyCount = self.enemyCount + 1
      if(self.enemyCount > 10 * self.wave) then
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
