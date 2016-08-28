require("scripts/Globals")
require("scripts/Enemy")

Enemy2 = {}

local enemyImage = lg.newImage(IMG_DIR .. "enemy2.png")

function Enemy2:new(_x, _y, _speed)
  o = Enemy:new(enemyImage, _x, _y, _speed)
  o.hp = 2
  return o
end
