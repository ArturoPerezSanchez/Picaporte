-- Hook love.update
local old_update = love.update or function() end
function love.update(dt)
    old_update(dt)

    check_spawn_snape(dt)

    update_frames(dt)
end

-- Hook love.draw
local old_draw = love.draw or function() end
function love.draw()
    old_draw()
    draw_current_frames()
end

-- Hook card.update 
local old_card_update = Card.update
function Card:update(dt)
    old_card_update(self, dt)
    
    if self.ability.name == "lgtb" then 
        self.ability.poly_tally = 0
        for k, v in pairs(G.playing_cards or {}) do
            if v and v.edition and v.edition.key == "e_polychrome" then
                self.ability.poly_tally = self.ability.poly_tally + 1
            end
        end
        if G.jokers and G.jokers.cards then
            for k, v in pairs(G.jokers.cards) do
                if v and v.edition and v.edition.key == "e_polychrome" then
                    self.ability.poly_tally = self.ability.poly_tally + 1
                end
            end
        end
    end
end

-- Hook check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)

  local is_muriel = card.ability and card.ability.needs_double_slot

  if card.ability.set ~= 'Voucher' and
     card.ability.set ~= 'Enhanced' and
     card.ability.set ~= 'Default' and
     not (
        card.ability.set == 'Joker' and
        #G.jokers.cards < G.jokers.config.card_limit
          + ((card.edition and card.edition.negative) and 1 or 0)
          - (is_muriel and 1 or 0)
     ) and
     not (
        card.ability.consumeable and
        #G.consumeables.cards < G.consumeables.config.card_limit
          + ((card.edition and card.edition.negative) and 1 or 0)
     )
  then
    alert_no_space(card, card.ability.consumeable and G.consumeables or G.jokers)
    return false
  end

  return true
end

-- Hook set_ability
local old_card_set_ability = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    old_card_set_ability(self, center, initial, delay_sprites)
    local X, Y, W, H = self.T.x, self.T.y, self.T.w, self.T.h
    self.config.center = center
    if center.name == "j_sj_muriel_joker" and (center.discovered or self.bypass_discovery_center) then 
        self.T.w = W*2
    end
end

local upd = Game.update
function Game:update(dt)
    upd(self, dt)

    -- tick based events
    if Picaporte.ticks == nil then Picaporte.ticks = 0 end
    if Picaporte.dtcounter == nil then Picaporte.dtcounter = 0 end
    Picaporte.dtcounter = Picaporte.dtcounter+dt
    Picaporte.dt = dt

    while Picaporte.dtcounter >= 0.010 do
        Picaporte.ticks = Picaporte.ticks + 1
        Picaporte.dtcounter = Picaporte.dtcounter - 0.010
        if jokerExists("j_sj_culo_de_arena") then decrementingTickEvent("j_sj_culo_de_arena",0) end

    end

end


-- Hook card.draw 
-- local old_card_draw = Card.draw
-- function Card:draw(layer)

--     if self.config and self.config.center and self.config.center.key == "j_sj_muriel_joker" then
--         love.graphics.push()

--         local draw_x = self.VT.x * G.TILESIZE * G.TILESCALE
--         local draw_y = self.VT.y * G.TILESIZE * G.TILESCALE

--         love.graphics.translate(draw_x, draw_y)
--         love.graphics.scale(2, 1)

--         love.graphics.translate(-draw_x - 20, -draw_y)

--         old_card_draw(self, layer)

--         love.graphics.pop()
--     else
--         old_card_draw(self, layer)
--     end
-- end