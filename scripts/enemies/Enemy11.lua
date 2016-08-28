require("scripts/Globals")
require("scripts/enemies/Enemy")

Enemy11 = {}

local enemyImage = lg.newImage(ENEMIES_IMG_DIR .. "enemy11.png")

function Enemy11:new(_x, _y)
  o = Enemy:new(_x, _y)
  o.sprite = enemyImage
  o.hp = 100
  o.speed = 30
  return o
end
