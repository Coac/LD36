require("scripts/globals")

Enemy = {}

function Enemy:new(_sprite, _x, _y,_speedY, _speedX,_angle)
  local o = {
    sprite = _sprite,
    x = _x,
    y = _y,
    speedY =  _speedY,
    speedX =  _speedX,
    angle =  _angle
   }
  setmetatable(o, self)
  self.__index = self
  return o
end

function Enemy:update(dt)
  self.x = self.x + self.speedX * dt * math.cos(self.angle)
  self.y = self.y + self.speedY * dt * math.sin(self.angle)
end

function Enemy:draw()
  lg.draw(self.sprite, self.x, self.y, self.angle);
end
