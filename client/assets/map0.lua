local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
end


-- show()
function scene:show( event )
display.remove(map)
display.remove(map)
    local sceneGroup = self.view
    local phase = event.phase
map = display.newImage (Background,"assets/maps/map0.png",  display.contentCenterX+16, display.contentCenterY+16)
    if ( phase == "will" ) then
        -- Coordx, coordy
blocks = {{32,35},{32,36},{32,37}}
-- Coordx, coordy, map
tps = {{24,64,"map1"},{25,64,"map1"}}
dialnpcs={{35,35,"trader"}}
-- Coordx, coordy, hp, atk, def
_G.battles = {{30,30,50,1,1},{100,30,50,1,1}}
mobs={}
mobs[1]=display.newImage (playergroup, "assets/characters/revolgirl.png",(10*32),(9*32)+16)
mobs[2]=display.newImage (playergroup, "assets/characters/revolgirl.png",(5*32),(8*32)+16)
--  _G.npcs[1]=display.newImage (playergroup, "assets/characters/trader.png",(10*32),(9*32)+16)
-- _G.npcs[2]=display.newImage (playergroup, "assets/characters/trader.png",(-5*32),(-8*32)+16)
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
    end
end


-- hide()
function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene