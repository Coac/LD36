require("scripts/globals")

Arrow = {}

function Arrow:new(_x, _y, _speed, _angle)
    _sprite = lg.newImage(imagesFolder .. "arrow.png")
    local o = {
    sprite = _sprite,
    x = _x,
    y = _y,
    speed =  _speed,
    angle = _angle,
    coll = HC.rectangle(_x, _y, _sprite:getWidth(), _sprite:getHeight()),
    width = _sprite:getWidth(),
    height = _sprite:getHeight()
   }
  o.coll:rotate(_angle)

  setmetatable(o, self)
  self.__index = self
  return o
end

function Arrow:update(dt)
  self.x = self.x + self.speed * dt * math.cos(self.angle)
	self.y = self.y + self.speed * dt * math.sin(self.angle)

  self.coll:moveTo(self.x, self.y)
  for shape, delta in pairs(HC.collisions(self.coll)) do
    print("COLLISION")
  end
end

function Arrow:draw()
  lg.draw(self.sprite, self.x, self.y, self.angle, 1, 1, self.width/2, self.height/2)
  --self.coll:draw("fill")
end
