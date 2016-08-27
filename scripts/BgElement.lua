local lg = love.graphics

BgElement = {}

function BgElement:new(_sprite, _x, _y, _speedX)
  o = {
    sprite = _sprite
    x = _x
    y = _y
    speedX =  _speedX
   }
  setmetatable(o, self)
  self.__index = self
  return o
end

function BgElement:update(dt)
  self.x = self.x + (self.speedX * dt)
end

function BgElement:draw()
  lg.draw(self.sprite, self._x, self._y);
end
