---------------------------------------------------------------------------------
-- REQUIRE & VARIABLES
---------------------------------------------------------------------------------

local sqlite3 = require ("sqlite3")
local json = require( "json" )
--Abre la base de datos BD.db.
--Si la base de datos no existe, la crea.
local myNewData, user, password, found = false


local functions = {}
---------------------------------------------------------------------------------
-- DATABASE
---------------------------------------------------------------------------------

--Creación de la tabla "user".
functions.createTable = function ()
	local ts = [[DROP TABLE 'users';]]
	db:exec(ts)
	local tablesetup = [[CREATE TABLE IF NOT EXISTS users ( id INTEGER PRIMARY KEY, usuario, nombre, apellido_p, apellido_m, grado);]] 
	db:exec( tablesetup )
end

functions.fillTable = function( decodedData )
	local counter = 1
	local index = counter
	local user = decodedData[index]
	 
	while ( user ~= nil ) do
	    local tablefill ="INSERT INTO users VALUES (NULL,'" .. user[2] .. "','" .. user[3] .. "','" .. user[4] .. "','" .. user[5] .. "','" .. user[6] .. "');"
	    --print(tablefill)
	    db:exec( tablefill )
	    counter=counter+1
	    index = counter
	    user = decodedData[index]
  	end
  db:close( )
end

--Abre conexion a base de datos
functions.createConnection = function ()
	local path = system.pathForFile("IQM.db", system.DocumentsDirectory)
	db = sqlite3.open( path )
end

--Inserción de registros en la base de datos.
functions.InsertUser = function ( user, password )
	local insercion = [[INSERT INTO user VALUES (']]..user..[[',']]..password..[[');]]
	db:exec(insercion)
end

--Búsqueda de un registro en la base de datos.
functions.searchUser = function( user, password )
	for row in db:nrows("SELECT * FROM users WHERE usuario='"..user.."'".." and id='"..password.."'") do
		found = true
		break
	end
	return found
end

--Cierra la conexión a Base de Datos.
functions.closeDB = function ()
	db:close()
end

return functions