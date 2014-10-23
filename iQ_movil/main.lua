-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

--LIBRERIAS

local storyboard = require( "storyboard" )
local dbMethods = require( "code.dbMethods" )
local json = require( "json" )
local myNewData, decodedData

-----------------------------------------------------------------------------------------

--CONFIGURACIONES

display.setStatusBar( display.HiddenStatusBar )

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

-- CONEXION A BASE DE DATOS


dbMethods.createConnection()
dbMethods.createTable()
local function networkListener( event )
      if ( event.isError ) then
        print( "Network error!")
      else
        myNewData = event.response
        print ("From server: "..myNewData)
        decodedData = (json.decode( myNewData ) )
        dbMethods.fillTable(decodedData)
      end
end
network.request( "http://192.168.173.1:82/iqm/mymovies.php", "GET", networkListener )

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

--LLAMADA A PRIMER ESCENA

storyboard.gotoScene( "code.welcome" )

-----------------------------------------------------------------------------------------