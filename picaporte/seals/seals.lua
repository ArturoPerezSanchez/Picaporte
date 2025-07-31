
SMODS.Seal {
    name = "sepe",
    key = "sepe",
    badge_colour = HEX("00FF00"),
	config = { mult = 1, chips = 10, money = 1, x_mult = 1.1, job = 1  },
    loc_txt = {
        -- Badge name (displayed on card description when seal is applied)
        label = 'Sello del sepe',
        -- Tooltip description
        name = 'Sepe sello',
        text = {
            '{C:mult}+#1#{} Mult',
            '{C:chips}+#2#{} Chips',
            '{C:money}+$#3#{}',
            '{X:mult,C:white}X#4#{} Mult',
            '{X:mult,C:white}X#5#{} Job',
        }
    },


    sound = { sound = 'yahimod_whatsapp', per = 1, vol = 0.4 },

    loc_vars = function(self, info_queue)
        return { vars = {self.config.mult, self.config.chips, self.config.money, self.config.x_mult, self.config.job, } }
    end,
    atlas = "sepe",
    pos = {x=0, y=0},

    -- self - this seal prototype
    -- card - card this seal is applied to
    calculate = function(self, card, context)
        -- main_scoring context is used whenever the card is scored
        
        local _whatsappcounter = 0
        local _whatsappcounter2 = 0

        if G.hand.highlighted[1] then
            for i = 1, #G.hand.highlighted do
                if G.hand.highlighted[i].seal == "yahimod_whatsapp_seal" then _whatsappcounter = _whatsappcounter + 1 end
            end
        end
        
        if G.play.cards[1] then
            for i = 1, #G.play.cards do
                if G.play.cards[i].seal == "yahimod_whatsapp_seal" then _whatsappcounter2 = _whatsappcounter2 + 1 end
            end
        end

        if _whatsappcounter >= 5 or _whatsappcounter2 >= 5 then
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            blocking = false,
            blockable = false,
            delay = 0.7,
            func = function()
                G.GAME.current_round.current_hand.handname = "Group Chat"
                if G.GAME.current_round.current_hand.handname == "Group Chat" then return true end
            end
            }))
        end

        if context.main_scoring and context.cardarea == G.play then
            if string.find(G.GAME.current_round.current_hand.handname,"Group Chat") then check_for_unlock({ type = "ach_groupchat" }) end
            return {
                G.E_MANAGER:add_event(Event({func = function()
                play_sound('yahimod_whatsapp')
                return true end })),
                
                message = "(1) New Message",
                mult = self.config.mult,
                chips = self.config.chips,
                dollars = self.config.money,
                x_mult = self.config.x_mult
            }
        end
    end,
}

SMODS.Seal {
    name = "whatsapp_seal",
    key = "whatsapp_seal",
    badge_colour = HEX("00FF00"),
	config = { mult = 1, chips = 10, money = 1, x_mult = 1.1  },
    loc_txt = {
        -- Badge name (displayed on card description when seal is applied)
        label = 'Whatsapp Seal',
        -- Tooltip description
        name = 'Whatsapp Seal',
        text = {
            '{C:mult}+#1#{} Mult',
            '{C:chips}+#2#{} Chips',
            '{C:money}+$#3#{}',
            '{X:mult,C:white}X#4#{} Mult',
        }
    },


    sound = { sound = 'yahimod_whatsapp', per = 1, vol = 0.4 },

    loc_vars = function(self, info_queue)
        return { vars = {self.config.mult, self.config.chips, self.config.money, self.config.x_mult, } }
    end,
    atlas = "whatsapp_seal",
    pos = {x=0, y=0},

    -- self - this seal prototype
    -- card - card this seal is applied to
    calculate = function(self, card, context)
        -- main_scoring context is used whenever the card is scored
        
        local _whatsappcounter = 0
        local _whatsappcounter2 = 0

        if G.hand.highlighted[1] then
            for i = 1, #G.hand.highlighted do
                if G.hand.highlighted[i].seal == "yahimod_whatsapp_seal" then _whatsappcounter = _whatsappcounter + 1 end
            end
        end
        
        if G.play.cards[1] then
            for i = 1, #G.play.cards do
                if G.play.cards[i].seal == "yahimod_whatsapp_seal" then _whatsappcounter2 = _whatsappcounter2 + 1 end
            end
        end

        if _whatsappcounter >= 5 or _whatsappcounter2 >= 5 then
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            blocking = false,
            blockable = false,
            delay = 0.7,
            func = function()
                G.GAME.current_round.current_hand.handname = "Group Chat"
                if G.GAME.current_round.current_hand.handname == "Group Chat" then return true end
            end
            }))
        end

        if context.main_scoring and context.cardarea == G.play then
            if string.find(G.GAME.current_round.current_hand.handname,"Group Chat") then check_for_unlock({ type = "ach_groupchat" }) end
            return {
                G.E_MANAGER:add_event(Event({func = function()
                play_sound('yahimod_whatsapp')
                return true end })),
                
                message = "(1) New Message",
                mult = self.config.mult,
                chips = self.config.chips,
                dollars = self.config.money,
                x_mult = self.config.x_mult
            }
        end
    end,
}