local lg = love.graphics

BgElement = {}

function BgElement:new(_sprite, _x, _y, _speedY)
  local o = {
    sprite = _sprite,
    x = _x,
    y = _y,
    speedY =  _speedY
   }
  setmetatable(o, self)
  self.__index = self
  return o
end

function BgElement:update(dt)
  self.y = self.y + (self.speedY * dt)
end

function BgElement:draw()
  lg.draw(self.sprite, self.x, self.y);
end
