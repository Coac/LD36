require("scripts/Globals")
require("scripts/enemies/Enemy")

Enemy5 = {}

local enemyImage = lg.newImage(ENEMIES_IMG_DIR .. "enemy5.png")

function Enemy5:new(_x, _y)
  o = Enemy:new(_x, _y)
  o.sprite = enemyImage
  o.hp = 1
  o.speed = 600
  return o
end
