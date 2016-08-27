require("scripts/globals")

local Enemy = {}

function Enemy:new(_sprite, _x, _y, _speedY)
  o = {
    sprite = _sprite,
    x = _x,
    y = _y,
    speedY =  _speedY
   }
  setmetatable(o, self)
  self.__index = self
  return o
end


function Enemy.load ()
  local trainImage = love.graphics.newImage(imagesFolder .. 'enemy.png')
end

return enemy
