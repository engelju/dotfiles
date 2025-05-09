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

-- Function to enable shortcuts
local function enableShortcuts()
    for _, shortcut in ipairs(shortcuts) do
        hotkeys[shortcut.key] = hs.hotkey.bind({ "cmd" }, shortcut.key, function()
            hs.application.launchOrFocus(shortcut.app)
        end)
    end
    hs.alert.show("Shortcuts enabled")
end

-- Function to disable shortcuts
local function disableShortcuts()
    for key, hotkey in pairs(hotkeys) do
        if hotkey then
            hotkey:delete()
            hotkeys[key] = nil
        end
    end
    hs.alert.show("Shortcuts disabled")
end

-- Function to check if the frontmost app is an IDE
local function isIDEActive()
    local focusedApp = hs.application.frontmostApplication()
    local appName = focusedApp and focusedApp:name()
    return appName == "IntelliJ IDEA" or appName == "GoLand"
end

-- Window filter for IntelliJ and GoLand
local ideFilter = hs.window.filter.new({ "IntelliJ IDEA", "GoLand" })

-- Enable or disable shortcuts dynamically
ideFilter:subscribe(hs.window.filter.windowFocused, function()
    disableShortcuts()
end)
ideFilter:subscribe(hs.window.filter.windowUnfocused, function()
    enableShortcuts()
end)

-- Initialize shortcuts if not starting in an IDE
if not isIDEActive() then
    enableShortcuts()
else
    disableShortcuts()
end

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

        -- Calculate the new window frame with padding
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
    ["Brave Browser"] = true,
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
function getSpotifyTrack()
    local script = [[
        tell application "Spotify"
            if it is running and player state is playing then
                set trackName to name of current track
                set artistName to artist of current track
                return artistName & " - " & trackName
            else
                return "Not playing"
            end if
        end tell
    ]]
    local ok, result = hs.osascript.applescript(script)
    return result
end

-- Create a global variable for the text object
local spotifyTextDisplay = nil

-- Function to show/update the text
function updateSpotifyText()
    local trackInfo = getSpotifyTrack()

    if not spotifyTextDisplay then
        local screen = hs.screen.primaryScreen()
        local screenFrame = screen:frame()  -- excludes dock & menu bar
        local textX = screenFrame.x + 20
        local textY = screenFrame.y + screenFrame.h + 25

        spotifyTextDisplay = hs.drawing.text(
            hs.geometry.rect(textX, textY, 600, 30),
            trackInfo
        )

        spotifyTextDisplay:setTextFont("Helvetica Neue")
        spotifyTextDisplay:setTextSize(16)
        spotifyTextDisplay:setTextColor({black = 1})
        spotifyTextDisplay:setBehaviorByLabels({"canJoinAllSpaces", "stationary"})
        spotifyTextDisplay:setLevel(hs.drawing.windowLevels.status)
        spotifyTextDisplay:show()
    else
        spotifyTextDisplay:setText(trackInfo)
    end
end

-- Timer to update the track info every few seconds
timerVar = hs.timer.doEvery(5, updateSpotifyText)

-- Initial update on startup
updateSpotifyText()

