require("scripts/Globals")
require("scripts/Turret")
Numerobis = {}
local numerobis

local numerbisSprite = lg.newImage(IMG_DIR .. "numerobis.png")
function Numerobis:new(_x, _y, _speed)
  local o = {
    sprite = numerbisSprite,
    x = _x,
    y = _y,
    speed =  _speed,
    width = numerbisSprite:getWidth(),
    height = numerbisSprite:getHeight(),
    coll = HC.rectangle(_x, _y, numerbisSprite:getWidth(), numerbisSprite:getHeight()),
   }
  o.coll.name = "Numerobis"
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

  self.coll:moveTo(self.x, self.y)

end

function love.keypressed(key)
  if(key == "space") then
    Turret:new(numerobis.x, numerobis.y)
  end
end


function Numerobis:draw()
  lg.draw(self.sprite, self.x, self.y, 0, 1, 1, self.width/2, self.height/2);
end
