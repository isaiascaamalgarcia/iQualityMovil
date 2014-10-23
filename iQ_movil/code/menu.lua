-----------------------------------------------------------------------------------------

-- selectGame.lua

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

--LIBRERIAS

local storyboard = require( "storyboard" )
local widget = require( "widget" )
storyboard.purgeOnSceneChange = true

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

--VARIABLES GLOBALES

local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local sceneGroup, backgroundImage, juego1, description

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

--FUNCIONES

local function touchGame()
	--nody
end

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

--METODOS DE ESCENA

local scene = storyboard.newScene()

function scene:createScene()

	storyboard.removeScene( "login" )

	sceneGroup = self.view

	backgroundImage = display.newImageRect( "img/Panel 3.png", _W, _H )
	backgroundImage.x = _X
	backgroundImage.y = _Y
	sceneGroup:insert( backgroundImage )

	juego1 = display.newText( "Detective de Letras", ( _X / 2 ) + 10, ( _Y / 2 ) + ( _Y / 6 ), "Freestyle Script", 50)
	juego1:setFillColor( 0, 0, 0 )
	sceneGroup:insert(  juego1 )

	
juego1:addEventListener( "touch", touchGame )
end

function scene:enterScene()
	-- body
end

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

--OYENTES

scene:addEventListener( "createScene", scene )
-----------------------------------------------------------------------------------------

return scene