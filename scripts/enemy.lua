require("scripts/globals")

Enemy = {}

function Enemy:new(_sprite, _x, _y,_speedY, _speedX,_angle)
  local o = {
    sprite = _sprite,
    x = _x,
    y = _y,
    speedY =  _speedY,
    speedX =  _speedX,
    angle =  _angle,
    coll = HC.rectangle(_x, _y, _sprite:getWidth(), _sprite:getHeight()),
    width = _sprite:getWidth(),
    height = _sprite:getHeight()
   }
   o.coll:rotate(_angle)

   setmetatable(o, self)
   self.__index = self
   return o
end

function Enemy:update(dt)
  self.x = self.x + self.speedX * dt * math.cos(self.angle)
  self.y = self.y + self.speedY * dt * math.sin(self.angle)

  self.coll:moveTo(self.x, self.y)
  for shape, delta in pairs(HC.collisions(self.coll)) do
    print("COLLISION")
  end
end

function Enemy:draw()
  lg.draw(self.sprite, self.x, self.y, self.angle, 1, 1, self.width/2, self.height/2)
  self.coll:draw("fill")
end
