-- UI Element References
local player = game.Players.LocalPlayer
local screenGui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
local frame = screenGui:WaitForChild("Frame")
local switchButton = frame:WaitForChild("SwitchButton")
local stopButton = frame:WaitForChild("StopButton")
local songSelectButton = frame:WaitForChild("SongSelectButton")

-- Initialize Variables
local isPlaying = false
local currentSongIndex = 1
local sound = Instance.new("Sound")
sound.Parent = workspace  -- Adjust as needed

-- Define Songs (example)
local songs = {
    ["Pasilyo"] = {
    -- Verse
    {pitch = 1, duration = 0.5}, -- C (z)
    {pitch = 1, duration = 0.5}, -- C (z)
    {pitch = 1, duration = 0.5}, -- C (z)
    {pitch = 1.122, duration = 0.5}, -- D (x)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.334, duration = 0.5}, -- F (v)
    {pitch = 1.498, duration = 0.5}, -- G (b)
    {pitch = 1.682, duration = 0.5}, -- A (n)
    {pitch = 1.682, duration = 0.5}, -- A (n)
    {pitch = 1.682, duration = 0.5}, -- A (n)
    {pitch = 1.498, duration = 0.5}, -- G (b)
    {pitch = 1.334, duration = 0.5}, -- F (v)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.682, duration = 0.5}, -- A (n)
    {pitch = 1.682, duration = 0.5}, -- A (n)
    {pitch = 1.682, duration = 0.5}, -- A (n)
    {pitch = 1.498, duration = 0.5}, -- G (b)
    {pitch = 1.334, duration = 0.5}, -- F (v)
    {pitch = 1.498, duration = 0.5}, -- G (b)
    {pitch = 1.334, duration = 0.5}, -- F (v)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.122, duration = 0.5}, -- D (x)
    {pitch = 1, duration = 0.5}, -- C (z)
    
    -- Chorus
    {pitch = 1.498, duration = 0.5}, -- G (b)
    {pitch = 1.498, duration = 0.5}, -- G (b)
    {pitch = 1.682, duration = 0.5}, -- A (n)
    {pitch = 1.887, duration = 0.5}, -- B (m)
    {pitch = 1, duration = 0.5}, -- C (z)
    {pitch = 1.122, duration = 0.5}, -- D (x)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.334, duration = 0.5}, -- F (v)
    {pitch = 1.498, duration = 0.5}, -- G (b)
    {pitch = 1.334, duration = 0.5}, -- F (v)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.122, duration = 0.5}, -- D (x)
    {pitch = 1, duration = 0.5}, -- C (z)
    {pitch = 1.498, duration = 0.5}, -- G (b)
    {pitch = 1.498, duration = 0.5}, -- G (b)
    {pitch = 1.682, duration = 0.5}, -- A (n)
    {pitch = 1.887, duration = 0.5}, -- B (m)
    {pitch = 1, duration = 0.5}, -- C (z)
    {pitch = 1.122, duration = 0.5}, -- D (x)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.334, duration = 0.5}, -- F (v)
    {pitch = 1.498, duration = 0.5}, -- G (b)
    {pitch = 1.334, duration = 0.5}, -- F (v)
    {pitch = 1.26, duration = 0.5}, -- E (c)
    {pitch = 1.122, duration = 0.5}, -- D (x)
    {pitch = 1, duration = 0.5}, -- C (z)

    }
    -- Add more songs here with similar format
}

-- Function to Play Notes
local function playNote(note)
    if not sound then
        warn("Sound object not found!")
        return
    end

    sound.PlaybackSpeed = note.pitch
    sound:Play()
    wait(note.duration)
    sound:Stop()
end

-- Function to Play the Current Song
local function playSong()
    local songName = "Pasilyo"  -- Default song, change as needed
    local songNotes = songs[songName]

    if songNotes then
        if not isPlaying then
            isPlaying = true
            for _, note in ipairs(songNotes) do
                playNote(note)
                if not isPlaying then break end
            end
            isPlaying = false
        end
    else
        warn("Song not found!")
    end
end

-- Function to Stop the Song
local function stopSong()
    isPlaying = false
end

-- Function to Handle Song Selection
local function selectSong()
    currentSongIndex = currentSongIndex % #songs + 1
    local songName = table.keys(songs)[currentSongIndex]
    switchButton.Text = "Play"
    print("Selected Song: " .. songName)
end

-- Button Event Connections
switchButton.MouseButton1Click:Connect(function()
    if isPlaying then
        stopSong()
        switchButton.Text = "Play"
    else
        playSong()
        switchButton.Text = "Pause"
    end
end)

stopButton.MouseButton1Click:Connect(stopSong)

songSelectButton.MouseButton1Click:Connect(selectSong)

-- Helper function to get table keys
function table.keys(t)
    local keys = {}
    for key in pairs(t) do
        table.insert(keys, key)
    end
    return keys
end
