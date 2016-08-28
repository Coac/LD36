require("scripts/Globals")
require("scripts/enemies/Enemy")

Enemy3 = {}

local enemyImage = lg.newImage(ENEMIES_IMG_DIR .. "enemy3.png")

function Enemy3:new(_x, _y)
  o = Enemy:new(_x, _y)
  o.sprite = enemyImage
  o.hp = 3
  o.speed = 250
  return o
end
