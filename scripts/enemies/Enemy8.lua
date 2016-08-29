require("scripts/Globals")
require("scripts/enemies/Enemy")

Enemy8 = {}

local enemyImage = lg.newImage(ENEMIES_IMG_DIR .. "enemy8.png")

function Enemy8:new(_x, _y)
  o = Enemy:new(_x, _y)
  o.sprite = enemyImage
  o.hp = 10
  o.speed = 100
  return o
end
