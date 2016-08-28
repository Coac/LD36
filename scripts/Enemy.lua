require("scripts/Globals")

Enemy = {}

function Enemy:new(_sprite, _x, _y, _speed)
  local o = {
    sprite = _sprite,
    x = _x,
    y = _y,
    speed =  _speed,
    angle =  math.angle(_x, _y, WINDOW_W/2, WINDOW_H/2),
    coll = HC.rectangle(_x, _y, _sprite:getWidth(), _sprite:getHeight()),
    width = _sprite:getWidth(),
    height = _sprite:getHeight()
   }
   o.coll:rotate(o.angle)
   o.coll.name = "Enemy"

   setmetatable(o, self)
   self.__index = self
   return o
end

function Enemy:update(dt)
  self.x = self.x + self.speed * dt * math.cos(self.angle)
  self.y = self.y + self.speed * dt * math.sin(self.angle)

  self.coll:moveTo(self.x, self.y)
  for shape, delta in pairs(HC.collisions(self.coll)) do
    if(shape.name ~= "Enemy") then
      removeFromList(enemyManager.enemies, self)
      HC.remove(self.coll)
    end
    if(shape.name == "Numerobis") then
      lifeBar:takeDamage(10)
    end
  end
end

function Enemy:draw()
  lg.draw(self.sprite, self.x, self.y, self.angle, 1, 1, self.width/2, self.height/2)
   --self.coll:draw("fill")
end
