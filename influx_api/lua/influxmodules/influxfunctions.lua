-- Influx Bar Start
local smoothTable = {}

function influx.Bar( x, y, w, h, perc, percmax, color, smoothName)
    local percent = math.Clamp(perc, 0, percmax)
    local smooth = perc
    if smoothName != nil then
		local temp = smoothTable[smoothName] or 0
        smooth = math.Approach(temp, percent, 200*FrameTime())
        smoothTable[smoothName] = smooth
    end
    surface.SetDrawColor( color.r, color.g, color.b, color.a )
    surface.DrawRect( x, ((y + percmax) - smooth), w, h - ((y + percmax) - smooth) )
end
-- Influx 
function influx.RoundedBar( r, x, y, w, h, perc, percmax, color, smoothName)
    local percent = math.Clamp(perc, 0, percmax)
    local smooth = perc
    if smoothName != nil then
		local temp = smoothTable[smoothName] or 0
        smooth = math.Approach(temp, percent, 200*FrameTime())
        smoothTable[smoothName] = smooth
    end
    draw.RoundedBox( r, x, y - (h * (smooth / percmax)) + h, w, h * (smooth / percmax), Color( color.r, color.g, color.b, color.a ) )
end
-- Influx Bar End

-- Influx Box Start
function influx.Box( x, y, w, h, color)
    surface.SetDrawColor( color.r, color.g, color.b, color.a )
    surface.DrawRect( x, y, w, h )
end
-- Influx Box End

-- Influx RoundedBox Start
-- Using Draw Function to save time.
function influx.RoundedBox( r, x, y, w, h, color, bool1, bool2, bool3, bool4)
    draw.RoundedBox( r, x, y, w, h, Color( color.r, color.g, color.b, color.a ) )
end

function influx.RoundedBoxEx( r, x, y, w, h, color, boolean1, boolean2, boolean3, boolean4 )
    draw.RoundedBoxEx( r, x, y, w, h, Color( color.r, color.g, color.b, color.a ), boolean1, boolean2, boolean3, boolean4 )
end
-- Influx RoundedBox End

-- Influx Circle Start
function influx.Circle( x, y, radius, color)
    local cir = {}
    local seg = 25

    table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
    for i = 0, seg do
        local a = math.rad( ( i / seg ) * -360 )
        table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
    end

    local a = math.rad( 0 )
    table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

    surface.SetDrawColor( color.r, color.g, color.b, color.a )
    draw.NoTexture()
    surface.DrawPoly( cir )
end
-- Influx Circle End

-- Influx Icon Start
function influx.Icon( x, y, w, h, icon, color)
    surface.SetMaterial( icon )
    surface.SetDrawColor( color.r, color.g, color.b, color.a )
    surface.DrawTexturedRect( x, y, w, h)
end
-- Influx Icon End

-- Influx Text Start
function influx.Text( text, font, x, y, color, aly1, aly2 )
    draw.SimpleText( text, font, x, y, color, aly1, aly2 )
end
-- Influx Text End

-- Influx Wedge Start
function influx.Wedge( cx1, cy1, cx2, cy2, cx3, cy3, color )
    local DrawWedge = {
        { x = cx1, y = cy1 },
        { x = cx2, y = cy2 },
        { x = cx3, y = cy3 }
    }
    surface.SetDrawColor( color.r, color.g, color.b, color.a )
    draw.NoTexture()
    surface.DrawPoly( DrawWedge )
end
-- Influx Wedge End