Picaporte = Picaporte or {}

-- Load global vars
assert(SMODS.load_file("globals.lua"))()

-- Load hooks and aux functions
local utils_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "utils")
for _, file in ipairs(utils_src) do
    assert(SMODS.load_file("utils/" .. file))()
end

-- Load Atlas and Sounds
local atlas_and_sounds_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "atlas_and_sounds")
for _, file in ipairs(atlas_and_sounds_src) do
    assert(SMODS.load_file("atlas_and_sounds/" .. file))()
end

-- Load steam Data
get_steam_persona_name()
get_balatro_hours()

-- Load Jazan Temperature
get_jazan_temperature()

-- Load jokers
local jokers_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "jokers")
for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("jokers/" .. file))()
end

-- Load bosses
local bosses_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "bosses")
for _, file in ipairs(bosses_src) do
    assert(SMODS.load_file("bosses/" .. file))()
end

-- Load decks
local decks_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "decks")
for _, file in ipairs(decks_src) do
    assert(SMODS.load_file("decks/" .. file))()
end

-- Load editions
local editions_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "editions")
for _, file in ipairs(editions_src) do
    assert(SMODS.load_file("editions/" .. file))()
end

-- Load enhacements
local enhacements_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "enhacements")
for _, file in ipairs(enhacements_src) do
    assert(SMODS.load_file("enhacements/" .. file))()
end

-- Load planets
local planets_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "planets")
for _, file in ipairs(planets_src) do
    assert(SMODS.load_file("planets/" .. file))()
end

-- Load seals
local seals_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "seals")
for _, file in ipairs(seals_src) do
    assert(SMODS.load_file("seals/" .. file))()
end

-- Load spectrals
local spectrals_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "spectrals")
for _, file in ipairs(spectrals_src) do
    assert(SMODS.load_file("spectrals/" .. file))()
end

-- Load tags
local tags_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "tags")
for _, file in ipairs(tags_src) do
    assert(SMODS.load_file("tags/" .. file))()
end

-- Initialize video frames
load_video_animations()
load_shaders_images()



-- DEBUG
old_keypressed = love.keypressed or function() end
function love.keypressed(key)
    old_keypressed(key)
    if key == "v" then
        Picaporte.spawn_video_animation(math.random(0, love.graphics.getWidth() - 300), y, Picaporte.snape_video.frames, Picaporte.snape_video.audio_data)
    end
end
