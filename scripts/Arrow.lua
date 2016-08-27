local lg = love.graphics
require("scripts/globals")

Arrow = {}

function Arrow:new(_x, _y, _speed, _angle)
  o = {
    sprite = lg.newImage(imagesFolder .. "arrow.png"),
    x = _x,
    y = _y,
    speed =  _speed,
    angle = _angle
   }
  setmetatable(o, self)
  self.__index = self
  return o
end

function Arrow:update(dt)
  self.x = self.x + self.speed * dt * math.cos(self.angle)
	self.y = self.y + self.speed * dt * math.sin(self.angle)
end

function Arrow:draw()
  lg.draw(self.sprite, self.x, self.y, self.angle);
end
