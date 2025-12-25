-- Function to reload Hammerspoon configuration
function reloadConfig()
    hs.reload()
    hs.alert.show("Config Reloaded", 3) -- Show the alert for 3 seconds
    hs.notify.new({ title = "Hammerspoon", informativeText = "Config Reloaded" }):send()
end

hs.hotkey.bind({ "ctrl", "cmd" }, "R", reloadConfig)

-- *** Navigation Hotkeys *** ---

-- Define shortcuts and their corresponding applications
local shortcuts = {
    { key = "1", app = "iTerm" },
    { key = "2", app = "Firefox" },
    { key = "3", app = "Sublime Text" },
    { key = "4", app = "Finder" },
}

-- Table to store hotkey objects
local hotkeys = {}

-- Enable shortcuts (idempotent)
local function enableShortcuts()
    for _, s in ipairs(shortcuts) do
        if not hotkeys[s.key] then
            hotkeys[s.key] = hs.hotkey.bind({ "cmd" }, s.key, function()
                hs.application.launchOrFocus(s.app)
            end)
        end
    end
    -- hs.alert.show("Shortcuts enabled")
end

-- Disable shortcuts (idempotent)
local function disableShortcuts()
    for key, hk in pairs(hotkeys) do
        if hk then hk:delete() end
        hotkeys[key] = nil
    end
    -- hs.alert.show("Shortcuts disabled")
end

-- Decide if the current frontmost app is a JetBrains IDE you want to exclude
local function isIDEActive()
    local app = hs.application.frontmostApplication()
    local name = app and app:name() or ""
    -- Match IntelliJ Idea (incl. CE/Ultimate) and GoLand
    return name:match("^IntelliJ IDEA") ~= nil or name == "GoLand"
    -- Add more if you like: or name == "WebStorm" or name == "PyCharm"
end


local function updateShortcuts()
    if isIDEActive() then
        disableShortcuts()
    else
        enableShortcuts()
    end
end

-- Watch for app focus changes and toggle shortcuts
local appWatcher = hs.application.watcher.new(function(_, event)
    if event == hs.application.watcher.activated then
        updateShortcuts()
    end
end)

-- appWatcher:start()

-- Initialize based on the current frontmost app
-- updateShortcuts()

-- Notify on reload
hs.notify.new({ title = "Hammerspoon", informativeText = "Config loaded!" }):send()

-- *** Window Management *** ---

-- Ensure padding variables are defined
local padding = 10        -- Define your desired padding value
local padding_bottom = 10 -- Define your desired padding bottom value

-- Function to maximize the current window with padding
function maximizeWithPadding()
    local win = hs.window.focusedWindow()
    if win then
        local screen = win:screen()
        local screenFrame = screen:frame()
        local newFrame = {
            x = screenFrame.x + padding,
            y = screenFrame.y + padding,
            w = screenFrame.w - (2 * padding),
            h = screenFrame.h - (2 * padding),
        }
        win:setFrame(newFrame)
    end
end

-- Function to move the active window to the left side of the screen with padding
function moveWindowLeftWithPadding()
    local win = hs.window.focusedWindow()
    if win then
        local screen = win:screen()
        local screenFrame = screen:frame()
        local newFrame = {
            x = screenFrame.x + padding,
            y = screenFrame.y + padding,
            w = (screenFrame.w / 2) - padding,
            h = screenFrame.h - (2 * padding),
        }
        win:setFrame(newFrame)
    end
end

-- Function to move the active window to the right side of the screen with padding
function moveWindowRightWithPadding()
    local win = hs.window.focusedWindow()
    if win then
        local screen = win:screen()
        local screenFrame = screen:frame()
        local newFrame = {
            x = screenFrame.x + (screenFrame.w / 2) + padding,
            y = screenFrame.y + padding,
            w = (screenFrame.w / 2) - padding,
            h = screenFrame.h - (2 * padding),
        }
        win:setFrame(newFrame)
    end
end

hs.hotkey.bind({ "ctrl", "cmd" }, "F", maximizeWithPadding)
hs.hotkey.bind({ "ctrl", "cmd" }, "Left", moveWindowLeftWithPadding)
hs.hotkey.bind({ "ctrl", "cmd" }, "Right", moveWindowRightWithPadding)
-- for when left and right are not remapped
hs.hotkey.bind({ "ctrl", "cmd" }, "H", moveWindowLeftWithPadding)
hs.hotkey.bind({ "ctrl", "cmd" }, "L", moveWindowRightWithPadding)


-- ** add arrow key movement to browsers

-- Define apps considered browsers
local browsers = {
    ["Firefox"] = true,
    ["Google Chrome"] = true,
    ["Safari"] = true
}

-- Map keys to directions and scroll values
local keyActions = {
    h = {arrow = "left", scroll = {-20, 0}},
    j = {arrow = "down", scroll = {0, -50}},
    k = {arrow = "up", scroll = {0, 50}},
    l = {arrow = "right", scroll = {20, 0}}
}

-- Modifier keys
local mods = {"cmd", "shift"}

-- Bind keys
for key, action in pairs(keyActions) do
    hs.hotkey.bind(mods, key, function()
        local app = hs.application.frontmostApplication()
        local appName = app and app:name() or ""
        if browsers[appName] then
            -- Scroll instead of arrow key
            hs.eventtap.scrollWheel(action.scroll, {}, "pixel")
        else
            -- Send arrow key
            hs.eventtap.keyStroke({}, action.arrow)
        end
    end)
end

-- === Display spotify song ===

-- Function to get current Spotify track info
-- function getSpotifyTrack()
--     local script = [[
--         tell application "Spotify"
--             if it is running and player state is playing then
--                 set trackName to name of current track
--                 set artistName to artist of current track
--                 return artistName & " - " & trackName
--             else
--                 return "Not playing"
--             end if
--         end tell
--     ]]
--     local ok, result = hs.osascript.applescript(script)
--     return result
-- end

-- Create a global variable for the text object
-- local spotifyTextDisplay = nil

-- Function to show/update the text
-- function updateSpotifyText()
--     local trackInfo = getSpotifyTrack()
--
--     if not spotifyTextDisplay then
--         local screen = hs.screen.primaryScreen()
--         local screenFrame = screen:frame()  -- excludes dock & menu bar
--         local textX = screenFrame.x + 20
--         local textY = screenFrame.y + screenFrame.h + 25
--
--         spotifyTextDisplay = hs.drawing.text(
--             hs.geometry.rect(textX, textY, 600, 30),
--             trackInfo
--         )
--
--         spotifyTextDisplay:setTextFont("Helvetica Neue")
--         spotifyTextDisplay:setTextSize(16)
--         spotifyTextDisplay:setTextColor({white = 1})
--         spotifyTextDisplay:setBehaviorByLabels({"canJoinAllSpaces", "stationary"})
--         spotifyTextDisplay:setLevel(hs.drawing.windowLevels.status)
--         spotifyTextDisplay:show()
--     else
--         spotifyTextDisplay:setText(trackInfo)
--     end
-- end

-- Timer to update the track info every few seconds
-- timerVar = hs.timer.doEvery(5, updateSpotifyText)

-- Initial update on startup
-- updateSpotifyText()

--- DROPDOWN TERMINAL

-- hs.hotkey.bind({ "ctrl", "shift" }, "a", function()
--     wez = hs.application.find("WezTerm", true)
--     if not wez then
--         hs.application.launchOrFocus("WezTerm")
--     else
--         if wez:isFrontmost() then
--             wez:hide()
--         else
--             wez:activate()
--         end
--     end
-- end)

--- MOVE THE MOUSE WITH KEYBOARD

local step = 21

function moveMouse(dx, dy)
    local pos = hs.mouse.absolutePosition()
    pos.x = pos.x + dx
    pos.y = pos.y + dy
    hs.mouse.absolutePosition(pos)
end

hs.hotkey.bind({"alt", "ctrl"}, "h", function() moveMouse(-step, 0) end)
hs.hotkey.bind({"alt", "ctrl"}, "j", function() moveMouse(0, step) end)
hs.hotkey.bind({"alt", "ctrl"}, "k", function() moveMouse(0, -step) end)
hs.hotkey.bind({"alt", "ctrl"}, "l", function() moveMouse(step, 0) end)

