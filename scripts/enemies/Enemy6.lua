require("scripts/Globals")
require("scripts/enemies/Enemy")

Enemy6 = {}

local enemyImage = lg.newImage(ENEMIES_IMG_DIR .. "enemy6.png")

function Enemy6:new(_x, _y)
  o = Enemy:new(_x, _y)
  o.sprite = enemyImage
  o.hp = 2
  o.speed = 600
  return o
end
