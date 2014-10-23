-----------------------------------------------------------------------------------------

--login.lua

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

-- LIBRERIAS

local storyboard = require( "storyboard" )
local widget = require( "widget" )
local dbMethods = require( "code.dbMethods")
storyboard.purgeOnSceneChange = true

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

-- VARIABLES GLOBALES

local _X = display.contentCenterX
local _Y = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local sceneGroup, backgroundImage, passField, userField, loginButton, registerButton, session = false

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

--FUNCIONES

local function logIn( event )
	local path = system.pathForFile( "IQM.db", system.DocumentsDirectory )
		local db = sqlite3.open( path ) 
		for row in db:nrows("SELECT * FROM users WHERE usuario='"..userField.text.."'".." and id='"..passField.text.."'") do

		--for row in db:nrows("SELECT * FROM users WHERE usuario='icg1' and id='1'") do
			--native.setKeyboardFocus( nil )
			storyboard.gotoScene( "code.menu" )
			session = true	
			break
		end
		if session == false then
			backgroundImage.isVisible=false --errorMesage.isVisible = true
			--backgroundError.isVisible = true
			--timer.performWithDelay( 3000, ocultar )
		end
		db:close()

	--storyboard.gotoScene( "pruebadb" )
end

local function signIn( )
	-- body
end

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

--METODOS DE ESCENA

local scene = storyboard.newScene()

function scene:createScene()

	sceneGroup = self.view

	backgroundImage = display.newImageRect( "img/Panel 1.png", _W, _H )
	backgroundImage.x = _X
	backgroundImage.y = _Y
	sceneGroup:insert( backgroundImage )

--	local customFont = display.newText( "custom", 40, 20, "advanced_pixel_lcd-7", 24 )
--	customFont:setFillColor( 0, 0, 0 )
--	sceneGroup:insert( customFont )

	loginButton = widget.newButton {
		x = _X - ( _W / 10 ),
		y = _Y + ( _W / 10 ),
		width = ( _W / 10 ),
		height = ( _W / 10 ),
		defaultFile = "img/botonOk.png",
		labelColor = { default = { 255, 255, 255 }, over = { 240, 248, 255 } },
		fontSize = 40,
		onEvent = logIn
	}
	sceneGroup:insert( loginButton )

	registerButton = widget.newButton {
		x = ( _W / 7 ) * 5.3,
		y = ( _H / 7 ) * 6.3,
		width = 200,
		height = 100,
		label = "Registrate",
		labelColor = { default = { 0, 0, 0 }, over = { 240, 248, 255 } },
		font = "Freestyle Script",
		fontSize = _H / 7.8,
		textOnly = true,

		onEvent = signIn
	}
	sceneGroup:insert( registerButton )

end

function scene:enterScene( )
	userField = native.newTextField( _X - ( _X / 15 ), ( _Y / 3) + ( _Y / 30), ( _W / 10 ) * 2, _H / 9 )
	userField.inputType = "default"
	userField.align = "center"
	sceneGroup:insert( userField )

	passField = native.newTextField( _X - ( _X / 7.4 ), _Y - ( _Y / 5.5 ), ( _W / 10 ) * 2, _H / 9 )
	passField.inputType = "default"
	passField.isSecure = true
	passField.align = "center"
	sceneGroup:insert( passField )
end

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

--OYENTES

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )

-----------------------------------------------------------------------------------------

return scene