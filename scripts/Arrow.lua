require("scripts/globals")

Arrow = {}

function Arrow:new(_x, _y, _speed, _angle)
    _sprite = lg.newImage(IMG_DIR .. "arrow.png")
    local o = {
    sprite = _sprite,
    x = _x,
    y = _y,
    speed =  _speed,
    angle = _angle,
    coll = HC.rectangle(_x, _y, _sprite:getWidth(), _sprite:getHeight()),
    width = _sprite:getWidth(),
    height = _sprite:getHeight(),
    isCollided = false
   }
  o.coll:rotate(_angle)
  o.coll.name = "Arrow"

  setmetatable(o, self)
  self.__index = self

  table.insert(objectsToDraw, o)
  table.insert(objectsToUpdate, o)

  return o
end

function Arrow:destroy()
  removeFromList(objectsToUpdate, self)
  removeFromList(objectsToDraw, self)
  HC.remove(self.coll)
end

function Arrow:update(dt)
  if(self.isCollided) then
    print("ok")
    self:destroy()
    return
  end

  self.x = self.x + self.speed * dt * math.cos(self.angle)
	self.y = self.y + self.speed * dt * math.sin(self.angle)

  self.coll:moveTo(self.x, self.y)
  for shape, delta in pairs(HC.collisions(self.coll)) do
    if(shape.name ~= "Arrow") then
      self.isCollided = true
      return
    end
  end
end

function Arrow:draw()
  lg.draw(self.sprite, self.x, self.y, self.angle, 1, 1, self.width/2, self.height/2)
  -- self.coll:draw("fill")
end
