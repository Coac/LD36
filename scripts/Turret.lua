require("scripts/Arrow")
require("scripts/globals")
Turret = {}

function Turret:new(_sprite, _x, _y, _speedY)
  local o = {
    sprite = _sprite,
    x = _x,
    y = _y,
    speedY =  _speedY,
    angle = 0,
    width = _sprite:getWidth(),
    height = _sprite:getHeight(),
    time = 0
   }
  setmetatable(o, self)
  self.__index = self
  return o
end

function Turret:update(dt)
  local enemy = enemyManager:getNearestEnemy(self.x, self.y)
  if enemy ~= nil then
    self.angle = math.atan2(enemy.y-self.y, enemy.x-self.x)
  end

  self.time = self.time + dt
  if self.time > 2 then
    self.time = 0
    local arrow = Arrow:new(self.x, self.y, 300, self.angle)
    table.insert(objectsToDraw, arrow)
    table.insert(objectsToUpdate, arrow)
  end
end

function Turret:draw()
  lg.draw(self.sprite, self.x, self.y, self.angle, 1, 1, self.width/2, self.height/2)
end
