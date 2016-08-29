require("scripts/Globals")
require("scripts/turrets/Turret")
require("scripts/turrets/ShotgunTurret")

Numerobis = {}

local numerbisSprite = lg.newImage(IMG_DIR .. "numerobis.png")
function Numerobis:new(_x, _y, _speed)
  local o = {
    sprite = numerbisSprite,
    x = _x,
    y = _y,
    speed = _speed,
    width = numerbisSprite:getWidth(),
    height = numerbisSprite:getHeight(),
    coll = HC.rectangle(_x, _y, numerbisSprite:getWidth(), numerbisSprite:getHeight()),
    turretSelectedShape = nil
  }
  o.coll.name = "Numerobis"
  setmetatable(o, self)
  self.__index = self
  return o
end

function Numerobis:update(dt)
  if lk.isDown("right") then
    if self.x < train.x + train.width - train.sprite:getWidth() / 2  - 50 then
      self.x = self.x + (self.speed * dt)
    end
  end

  if lk.isDown("left") then
    if self.x > train.x - train.sprite:getWidth() / 2  + 50 then
      self.x = self.x - (self.speed * dt)
    end
  end

  if lk.isDown("down") then
    if self.y < train.y + train.height  - train.sprite:getHeight() / 2  - 50 then
      self.y = self.y + (self.speed * dt)
    end
  end

  if lk.isDown("up") then
    if self.y > train.y - train.sprite:getHeight() / 2 + 50 then
      self.y = self.y - (self.speed * dt)
    end
  end

  if (self.y > WINDOW_H) then
    self.y = WINDOW_H
  end
  if (self.y < 0) then
    self.y = 0
  end
  if (self.x > WINDOW_W) then
    self.x = WINDOW_W
  end
  if (self.x < 0) then
    self.x = 0
  end
  self.coll:moveTo(self.x, self.y)

  self.turretSelectedShape = nil
  for shape, delta in pairs(HC.collisions(self.coll)) do
    if (shape.name == "Turret") then
      self.turretSelectedShape = shape
    end
  end
end

function Numerobis:draw()
  lg.draw(self.sprite, self.x, self.y, 0, 1, 1, self.width / 2, self.height / 2);
end
