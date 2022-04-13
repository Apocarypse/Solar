-- import composer library for scene management
composer = require("composer")

-- change display filter to better support pixel art
display.setDefault( "minTextureFilter", "nearest" )
display.setDefault( "magTextureFilter", "nearest" )

-- globals
g = {}
g.centerX = display.contentCenterX
g.centerY = display.contentCenterY
g.screenLeft = display.screenOriginX
g.screenWidth = display.viewableContentWidth - g.screenLeft * 2
g.screenRight = g.screenLeft + g.screenWidth
g.screenTop = display.screenOriginY
g.screenHeight = display.viewableContentHeight - g.screenTop * 2
g.screenBottom = display.screenOriginY + display.actualContentHeight
g.MAX_PLAYERS = 3

-- go to first scene
composer.gotoScene("combat", {effect = "fade"})