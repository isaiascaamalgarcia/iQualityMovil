-----------------------------------------------------------------------------------------
--
--welcome.lua
--
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

--LIBRERIAS

local storyboard = require( "storyboard" )
storyboard.purgeOnSceneChange = true

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

--VARIABLES GLOBALES

local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local backgroundImage

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

-- FUNCIONES

function goToLogin( )
	storyboard.gotoScene( "code.login", "fade", 400 )
end
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

--METODOS DE ESCENA

local scene = storyboard.newScene( )

function scene:createScene( event )

	local sceneGroup = self.view

	backgroundImage = display.newImageRect( "img/Logo.png", _W, _H )
	backgroundImage.x = _X
	backgroundImage.y = _Y
	sceneGroup:insert( backgroundImage )

end

function scene:enterScene()

	splashtimer = timer.performWithDelay( 2000, goToLogin, 1 ) 

end

function scene:exitScene( )
	timer.cancel( splashtimer )
end

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

-- OYENTES

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )

-----------------------------------------------------------------------------------------

return scene