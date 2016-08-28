require("scripts/Globals")
require("scripts/enemies/Enemy")

Enemy4 = {}

local enemyImage = lg.newImage(ENEMIES_IMG_DIR .. "enemy4.png")

function Enemy4:new(_x, _y)
  o = Enemy:new(_x, _y)
  o.sprite = enemyImage
  o.hp = 4
  o.speed = 200
  return o
end
