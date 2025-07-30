
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

--visually shake a card
function shakecard(self) 
    G.E_MANAGER:add_event(Event({
        func = function()
            self:juice_up(0.5, 0.5)
            return true
        end
    }))
end