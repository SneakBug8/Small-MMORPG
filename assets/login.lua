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
map = display.newImage (Background,"assets/gui/background.png",  display.contentCenterX+16, display.contentCenterY+16)

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
blocks = {{31,32},{33,32},{32,33},{32,31}}
tps = {{31,1,"map0"},{100,100,"map0"}}
_G.battles = {{30,30,50,1,1},{100,30,50,1,1}}
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