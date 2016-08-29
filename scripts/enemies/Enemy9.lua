require("scripts/Globals")
require("scripts/enemies/Enemy")

Enemy9 = {}

local enemyImage = lg.newImage(ENEMIES_IMG_DIR .. "enemy9.png")

function Enemy9:new(_x, _y)
  o = Enemy:new(_x, _y)
  o.sprite = enemyImage
  o.hp = 15
  o.speed = 300
  return o
end
