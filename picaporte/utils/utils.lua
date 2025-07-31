
-- Spawnea el video un video en la ubicación deseada
function Picaporte.spawn_video_animation(x, y, frames, audio_data)
    local anim = {
        frames = frames,
        audio_data = audio_data,
        frame_index = 1,
        timer = 0,
        frame_time = 1 / 25,
        playing = true,
        audio = nil,
        x = x,
        y = y,
        
    }
    if anim.audio_data then
        anim.audio = love.audio.newSource(anim.audio_data, "stream")
        anim.audio:play()
    end

    table.insert(Picaporte.video_anims, anim)
end

-- Carga las imagenes de los shaders
function load_shaders_images()
    local path = SMODS.current_mod.path .. "assets/shaders/drops.png"
    local data = NFS.read(path)
    local fileData = love.filesystem.newFileData(data, "drops.png")
    local imageData = love.image.newImageData(fileData)
    Picaporte.rain_image = love.graphics.newImage(imageData)
end

-- Carga los frames del video de snape
function load_snape_video()
    local i = 1

    -- load frames
    while true do
        local real_path = Picaporte.mod_path .. "resources/snape_frames/frame_" .. string.format("%04d", i) .. "..png"

        local data = NFS.read(real_path)
        if not data then
            break
        end
        local fileData = love.filesystem.newFileData(data, "frame.png")
        local imageData = love.image.newImageData(fileData)
        local image = love.graphics.newImage(imageData)
        table.insert(Picaporte.snape_video.frames, image)
        i = i + 1
    end

    -- load audio
    local audio_path = Picaporte.mod_path .. "/resources/audio.ogg"
    local audio_data = NFS.read(audio_path)

    if audio_data then
        Picaporte.snape_video.audio_data = love.filesystem.newFileData(audio_data, "audio.ogg")
    end
end

-- Cada 3 segundos spawnea un video de snape
function check_spawn_snape(dt)
    if Picaporte.snape_loop then
        Picaporte.video_timer = Picaporte.video_timer + dt
        if Picaporte.video_timer >= 3 then
            Picaporte.video_timer = 0
            Picaporte.spawn_video_animation(
                math.random(-150, love.graphics.getWidth() - 400),
                math.random(-200, love.graphics.getHeight() - 300),
                Picaporte.snape_video.frames,
                Picaporte.snape_video.audio_data
            )
        end
    end
end

-- reproduce todas los videos de video_anims
function update_frames(dt)
        
    for _, anim in ipairs(Picaporte.video_anims) do
        if anim.playing then
            anim.timer = anim.timer + dt
            if anim.timer >= anim.frame_time then
                anim.timer = anim.timer - anim.frame_time
                anim.frame_index = anim.frame_index + 1
                if anim.frame_index > #anim.frames then
                    anim.playing = false
                    if anim.audio then anim.audio:stop() end
                end
            end
        end
    end
    
    -- Limpia las animaciones que ya terminaron
    for i = #Picaporte.video_anims, 1, -1 do
        if not Picaporte.video_anims[i].playing then
            table.remove(Picaporte.video_anims, i)
        end
    end
end

-- carga todas las animaciones
function load_video_animations()
    load_snape_video()
end

-- dibuja los frames de video_anims
function draw_current_frames()
    for _, anim in ipairs(Picaporte.video_anims) do
        if anim.playing then
            local frame = anim.frames[anim.frame_index]
            if frame then
                local w, h = frame:getDimensions()
                love.graphics.draw(frame, anim.x, anim.y)
            end
        end
    end
end

-- visually shake a card
function shakecard(self) 
    G.E_MANAGER:add_event(Event({
        func = function()
            self:juice_up(0.5, 0.5)
            return true
        end
    }))
end

-- Get Steam user name and steamID
function get_steam_persona_name()
    local steam_config_path = "C:\\Program Files (x86)\\Steam\\config\\loginusers.vdf"
    local f = io.open(steam_config_path, "r")
    if not f then
        Picaporte.steamID = "76561198078354748"
        Picaporte.persona_name = "rezekyt"
        return
    end

    local contents = f:read("*all")
    f:close()

    Picaporte.steamID = contents:match('"(%d+)"%s*{')
    Picaporte.persona_name = contents:match('"PersonaName"%s+"(.-)"')

    if not Picaporte.steamID then Picaporte.steamID = "76561198078354748" end
    if not Picaporte.persona_name then Picaporte.persona_name = "rezekyt" end

    print("usuario: " .. Picaporte.persona_name)
end

-- Get hours spent on Balatro on Steam
function get_balatro_hours()
    local succ, https = pcall(require, "SMODS.https")
    Picaporte.balatro_hours = 0
    if not succ then
        print("No se pudo cargar SMODS.https")
        return
    end

    local url = "https://steamcommunity.com/profiles/" .. Picaporte.steamID .."/games/?xml=1"
    local options = {
        method = "GET",
        headers = {
            ["user-agent"] = "Mozilla/5.0"
        }
    }

    local status, body = https.request(url, options)

    if status ~= 200 or not body then
        print("Error en la petición HTTP, código: " .. tostring(status))
        return
    end

    local games = {}
    local inside_balatro = false
    for line in body:gmatch("<game>(.-)</game>") do
        local name = line:match("<name><!%[CDATA%[(.-)%]%]></name>")
        local hours = line:match("<hoursOnRecord>(.-)</hoursOnRecord>")
        if name then
            if name == "Balatro" then
                print("Horas jugadas a Balatro: " .. (hours or "0"))
                Picaporte.balatro_hours = tonumber(hours or "0")
                return
            end
        end
    end

    print("Balatro no encontrado en la lista de juegos.")
end

-- Get current temperature in Jazan, Saudi Arabia
function get_jazan_temperature()
    Picaporte.jazan_temperature = 33.1
    local json = require("json")
    local succ, https = pcall(require, "SMODS.https")
    if not succ then
        print("[JazanTemp] ❌ No se pudo cargar SMODS.https")
        return
    end

    local url = "https://api.open-meteo.com/v1/forecast?latitude=16.8894&longitude=42.5706&current_weather=true"

    local options = {
        method = "GET",
        headers = {
            ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
            ["Accept"] = "application/json"
        }
    }

    local status, body = https.request(url, options)

    if status ~= 200 or not body then
        print("[JazanTemp] ❌ Error en la petición HTTP, código: " .. tostring(status))
        return
    end

    local data = json.decode(body)
    if not data or not data.current_weather then
        print("[JazanTemp] ❌ Error al parsear JSON")
        return
    end

    local temp = data.current_weather.temperature
    print("[JazanTemp] 🌡️ Temperatura actual en Jazan: " .. temp .. "°C")
    Picaporte.jazan_temperature = temp
end