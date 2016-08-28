require("scripts/Globals")
require("scripts/enemies/Enemy")

Enemy2 = {}

local enemyImage = lg.newImage(ENEMIES_IMG_DIR .. "enemy2.png")

function Enemy2:new(_x, _y)
  o = Enemy:new(_x, _y)
  o.sprite = enemyImage
  o.hp = 2
  return o
end
