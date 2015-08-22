states = {
    menu = require "states.menu",
    settings = require "states.settings",
    help = require "states.help",
    prompt = require "states.prompt",
    fadestate = require "states.fadestate",
    delaytest = require "states.delaytest",
    songselect = require "states.songselect",
    loadsong = require "states.loadsong",
    pause = require "states.pause",
    game = require "states.game",
    win = require "states.win",
    editor = require "states.editor"
}

local gamestate = require "lib.hump.gamestate"

function love.load()
    if love.filesystem.isFused() then
        local dir = love.filesystem.getSourceBaseDirectory()
        local success = love.filesystem.mount(dir, "")

        if not success then
            print("Failed to mount source base directory in fused mode")
        end
    end

    love.mouse.setCursor(love.mouse.newCursor("assets/cursor_pointer3D_shadow.png", 0, 0))

    if love.filesystem.isFile("assets/gamecontrollerdb.txt") then
        love.joystick.loadGamepadMappings("assets/gamecontrollerdb.txt")
        print("Loaded assets/gamecontrollerdb.txt mappings")
    end

    gamestate.registerEvents()
    gamestate.switch(states.menu)
end

-- function love.touchpressed(id,x,y,p)
--     gamestate.switch(states.settings)
-- end
