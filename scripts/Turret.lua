require("scripts/Arrow")
require("scripts/globals")
Turret = {}

local turretSprite = lg.newImage(IMG_DIR .. "turret.png")
function Turret:new(_x, _y)
  local o = {
    sprite = turretSprite,
    x = _x,
    y = _y,
    angle = 0,
    width = turretSprite:getWidth(),
    height = turretSprite:getHeight(),
    time = 0
   }
  setmetatable(o, self)
  self.__index = self

  table.insert(objectsToDraw, o)
  table.insert(objectsToUpdate, o)

  return o
end

function Turret:update(dt)
  local enemy = enemyManager:getNearestEnemy(self.x, self.y)
  if enemy ~= nil then
    self.angle = math.atan2(enemy.y-self.y, enemy.x-self.x)
  end

  self.time = self.time + dt
  if self.time > 0.2 then
    self.time = 0
    Arrow:new(self.x, self.y, 1000, self.angle)
  end
end

function Turret:draw()
  lg.draw(self.sprite, self.x, self.y, self.angle, 1, 1, self.width/2, self.height/2)
end
