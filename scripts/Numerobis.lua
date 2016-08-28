require("scripts/globals")
require("scripts/Turret")
Numerobis = {}
local numerobis
function Numerobis:new(_x, _y, _speed)
  local o = {
    sprite = lg.newImage(IMG_DIR .. "numerobis.png"),
    x = _x,
    y = _y,
    speed =  _speed
   }
  setmetatable(o, self)
  self.__index = self
  numerobis = o
  return o
end

function Numerobis:update(dt)
  if lk.isDown("right") then
     self.x = self.x + (self.speed * dt)
  end

  if lk.isDown("left") then
     self.x = self.x - (self.speed * dt)
  end

  if lk.isDown("down") then
     self.y = self.y + (self.speed * dt)
  end

  if lk.isDown("up") then
     self.y = self.y - (self.speed * dt)
  end

end

function love.keypressed(key)
  if(key == "space") then
    Turret:new(numerobis.x, numerobis.y)
  end
end


function Numerobis:draw()
  lg.draw(self.sprite, self.x, self.y);
end
