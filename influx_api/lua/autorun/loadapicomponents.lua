-- Loading API
local modules = file.Find( "influxmodules/*.lua", "LUA" )
influx = influx or {}

if SERVER then
	for _, svfile in ipairs( modules ) do
		AddCSLuaFile( "influxmodules/" .. svfile )
	end
end

if CLIENT then
	Msg( "\n|| Influx API: Loading... \n" )

	for _, clfile in ipairs( modules ) do
		include( "influxmodules/" .. clfile )
		Msg( "|| Influx >> " .. clfile .. "\n")
	end

	Msg( "|| Influx API: Done loading. \n\n" )
end
-- End of loading

InfluxApiLoaded = true

if SERVER then
	concommand.Add("reloadinflux", function() include("autorun/loadapicomponents.lua") end)
end