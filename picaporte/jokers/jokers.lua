-- function return_JokerValues() -- not used, just here to demonstrate how you could return values from a joker
--     if context.joker_main and context.cardarea == G.jokers then
--         return {
--             chips = card.ability.extra.chips,       -- these are the 3 possible scoring effects any joker can return.
--             mult = card.ability.extra.mult,         -- adds mult (+)
--             x_mult = card.ability.extra.x_mult,     -- multiplies existing mult (*)
--             card = self,                            -- under which card to show the message
--             colour = G.C.CHIPS,                     -- colour of the message, Balatro has some predefined colours, (Balatro/globals.lua)
--             message = localize('k_upgrade_ex'),     -- this is the message that will be shown under the card when it triggers.
--             extra = { focus = self, message = localize('k_upgrade_ex') }, -- another way to show messages, not sure what's the difference.
--         }
--     end
-- end

SMODS.Atlas({
    key = "sample_wee",
    path = "j_sample_wee.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_obelisk",
    path = "j_sample_obelisk.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_specifichand",
    path = "j_sample_specifichand.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_money",
    path = "j_sample_money.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_roomba",
    path = "j_sample_roomba.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_drunk_juggler",
    path = "j_sample_drunk_juggler.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_hackerman",
    path = "j_sample_hackerman.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_baroness",
    path = "j_sample_baroness.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_rarebaseballcard",
    path = "j_sample_rarebaseballcard.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sample_multieffect",
    path = "j_sample_multieffect.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "abascal",
    path = "abascal.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "carbono",
    path = "carbono.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "lgtb",
    path = "lgtb.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "pota",
    path = "pota.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "julio",
    path = "julio.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "culo_de_arena",
    path = "arena.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "2_fast_2_furious",
    path = "2_fast_2_furious.png",
    px = 71,
    py = 95
})


SMODS.Atlas({
    key = "balatro_balatrez",
    path = "balatro_balatrez.png",
    px = 71,
    py = 95
})


SMODS.Atlas({
    key = "beti",
    path = "beti.png",
    px = 71,
    py = 95
})



SMODS.Atlas({
    key = "burn",
    path = "burn.png",
    px = 71,
    py = 95
})



SMODS.Atlas({
    key = "cruzcampo",
    path = "cruzcampo.png",
    px = 71,
    py = 95
})



SMODS.Atlas({
    key = "gaviota",
    path = "gaviota.png",
    px = 71,
    py = 95
})



SMODS.Atlas({
    key = "greta",
    path = "greta.png",
    px = 71,
    py = 95
})



SMODS.Atlas({
    key = "monster",
    path = "monster.png",
    px = 71,
    py = 95
})


SMODS.Atlas({
    key = "monster_white",
    path = "monster_white.png",
    px = 71,
    py = 95
})


SMODS.Atlas({
    key = "obama",
    path = "obama.png",
    px = 71,
    py = 95
})


SMODS.Atlas({
    key = "paul_walker",
    path = "paul_walker.png",
    px = 71,
    py = 95
})


SMODS.Atlas({
    key = "perro_sanxe",
    path = "perro_sanxe.png",
    px = 71,
    py = 95
})


SMODS.Atlas({
    key = "renfe",
    path = "renfe.png",
    px = 71,
    py = 95
})


SMODS.Atlas({
    key = "sanic",
    path = "sanic.png",
    px = 71,
    py = 95
})


SMODS.Joker{
    key = "abascal",                                     --name used by the joker.    
    config = { extra = { chips = 8, chip_mod = 2 } },    --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                              --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                          --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                            --cost to buy the joker in shops.
    blueprint_compat=false,                              --does joker work with blueprint.
    eternal_compat=true,                                 --can joker be eternal.
    unlocked = true,                                     --is joker unlocked by default.
    discovered = true,                                   --is joker discovered by default.    
    effect=nil,                                          --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                        --pos of a soul sprite.
    atlas = 'abascal',                                      --atlas name, single sprites are deprecated.

    calculate = function(self,card,context)              --define calculate functions here
        if context.individual and context.cardarea == G.play then -- if we are in card scoring phase, and we are on individual cards
            if not context.blueprint then -- blueprint/brainstorm don't get to add chips to themselves
                if context.other_card:get_id() == 2 then -- played card is a 2 by rank
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod -- add configurable amount of chips to joker
                    
                    return {                             -- shows a message under the specified card (card) when it triggers, k_upgrade_ex is a key in the localization files of Balatro
                        extra = {focus = card, message = localize('k_upgrade_ex')},
                        card = card,
                        colour = G.C.CHIPS
                    }
                end
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {                                     -- returns total chips from joker to be used in scoring, no need to show message in joker_main phase, game does it for us.
                chips = card.ability.extra.chips, 
                colour = G.C.CHIPS
            }
        end
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod }, key = self.key }
    end
}

SMODS.Joker{
    key = "julio",                                        --name used by the joker.    
    config = { extra = { chips = 8, chip_mod = 2 } },    --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                              --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                          --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                            --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                 --can joker be eternal.
    unlocked = true,                                     --is joker unlocked by default.
    discovered = true,                                   --is joker discovered by default.    
    effect=nil,                                          --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                        --pos of a soul sprite.
    atlas = 'julio',                                      --atlas name, single sprites are deprecated.

    calculate = function(self,card,context)              --define calculate functions here

        if context.individual and context.cardarea == G.play then -- if we are in card scoring phase, and we are on individual cards
            if not context.blueprint then -- blueprint/brainstorm don't get to add chips to themselves
                love.window.minimize()

                local url = "https://www.sepe.es"
                if love.system.openURL then
                    love.system.openURL(url)
                else
                    os.execute("start " .. url) 

                end


                if context.other_card:get_id() == 2 then -- played card is a 2 by rank
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod -- add configurable amount of chips to joker
                    return {                             -- shows a message under the specified card (card) when it triggers, k_upgrade_ex is a key in the localization files of Balatro
                        extra = {focus = card, message = localize('k_upgrade_ex')},
                        card = card,
                        colour = G.C.CHIPS
                    }
                end
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {                                     -- returns total chips from joker to be used in scoring, no need to show message in joker_main phase, game does it for us.
                chips = card.ability.extra.chips, 
                colour = G.C.CHIPS
            }
        end
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod }, key = self.key }
    end
}

SMODS.Joker{
    key = "pota",                                        --name used by the joker.    
    config = { extra = { chips = 8, chip_mod = 2 } },    --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                              --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                          --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                            --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                 --can joker be eternal.
    unlocked = true,                                     --is joker unlocked by default.
    discovered = true,                                   --is joker discovered by default.    
    effect=nil,                                          --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                        --pos of a soul sprite.
    atlas = 'pota',                                      --atlas name, single sprites are deprecated.

    calculate = function(self,card,context)              --define calculate functions here
        if context.individual and context.cardarea == G.play then -- if we are in card scoring phase, and we are on individual cards
            if not context.blueprint then -- blueprint/brainstorm don't get to add chips to themselves
                if context.other_card:get_id() == 2 then -- played card is a 2 by rank
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod -- add configurable amount of chips to joker
                    
                    return {                             -- shows a message under the specified card (card) when it triggers, k_upgrade_ex is a key in the localization files of Balatro
                        extra = {focus = card, message = localize('k_upgrade_ex')},
                        card = card,
                        colour = G.C.CHIPS
                    }
                end
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {                                     -- returns total chips from joker to be used in scoring, no need to show message in joker_main phase, game does it for us.
                chips = card.ability.extra.chips, 
                colour = G.C.CHIPS
            }
        end
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod }, key = self.key }
    end
}

SMODS.Joker{
    key = "lgtb",                                        --name used by the joker.    
    config = { name = "lgtb", poly_tally = 0 },    --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                              --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                          --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                            --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                 --can joker be eternal.
    unlocked = true,                                     --is joker unlocked by default.
    discovered = true,                                   --is joker discovered by default.    
    effect=nil,                                          --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                        --pos of a soul sprite.
    atlas = 'lgtb',                                      --atlas name, single sprites are deprecated.


    calculate = function(self, card, context)
		if context.joker_main and card.ability.poly_tally > 0 then
			return {
				message = "Debí suponerlo",
				x_mult = 1.5*card.ability.poly_tally
			}
		end
    end,


    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = { 1 + 1.5*card.ability.poly_tally }, key = self.key }
    end
}

SMODS.Joker{
    key = "carbono",                                        --name used by the joker.    
    config = { extra = { chips = 8, chip_mod = 2 } },    --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                              --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                          --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                            --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                 --can joker be eternal.
    unlocked = true,                                     --is joker unlocked by default.
    discovered = true,                                   --is joker discovered by default.    
    effect=nil,                                          --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                        --pos of a soul sprite.
    atlas = 'carbono',                                      --atlas name, single sprites are deprecated.

    calculate = function(self,card,context)              --define calculate functions here
        if context.individual and context.cardarea == G.play then -- if we are in card scoring phase, and we are on individual cards
            if not context.blueprint then -- blueprint/brainstorm don't get to add chips to themselves
                if context.other_card:get_id() == 2 then -- played card is a 2 by rank
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod -- add configurable amount of chips to joker
                    
                    return {                             -- shows a message under the specified card (card) when it triggers, k_upgrade_ex is a key in the localization files of Balatro
                        extra = {focus = card, message = localize('k_upgrade_ex')},
                        card = card,
                        colour = G.C.CHIPS
                    }
                end
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {                                     -- returns total chips from joker to be used in scoring, no need to show message in joker_main phase, game does it for us.
                chips = card.ability.extra.chips, 
                colour = G.C.CHIPS
            }
        end
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod }, key = self.key }
    end
}

SMODS.Joker{
    key = "culo_de_arena",                               --name used by the joker.    
    config = { extra = { chips = 8, chip_mod = 2 } },    --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                              --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 4,                                          --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 4,                                            --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                 --can joker be eternal.
    unlocked = true,                                     --is joker unlocked by default.
    discovered = true,                                   --is joker discovered by default.    
    effect=nil,                                          --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                        --pos of a soul sprite.
    atlas = 'culo_de_arena',                             --atlas name, single sprites are deprecated.

    calculate = function(self,card,context)              --define calculate functions here
        if context.individual and context.cardarea == G.play then -- if we are in card scoring phase, and we are on individual cards
            if not context.blueprint then -- blueprint/brainstorm don't get to add chips to themselves
                if context.other_card:get_id() == 2 then -- played card is a 2 by rank
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod -- add configurable amount of chips to joker
                    
                    return {                             -- shows a message under the specified card (card) when it triggers, k_upgrade_ex is a key in the localization files of Balatro
                        extra = {focus = card, message = localize('k_upgrade_ex')},
                        card = card,
                        colour = G.C.CHIPS
                    }
                end
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {                                     -- returns total chips from joker to be used in scoring, no need to show message in joker_main phase, game does it for us.
                chips = card.ability.extra.chips, 
                colour = G.C.CHIPS
            }
        end
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod }, key = self.key }
    end
}

SMODS.Joker{
    key = "sample_wee",                                  --name used by the joker.    
    config = { extra = { chips = 8, chip_mod = 2 } },    --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                              --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                          --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 1,                                            --cost to buy the joker in shops.
    blueprint_compat=true,                               --does joker work with blueprint.
    eternal_compat=true,                                 --can joker be eternal.
    unlocked = true,                                     --is joker unlocked by default.
    discovered = true,                                   --is joker discovered by default.    
    effect=nil,                                          --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                        --pos of a soul sprite.
    atlas = 'sample_wee',                                --atlas name, single sprites are deprecated.

    calculate = function(self,card,context)              --define calculate functions here
        if context.individual and context.cardarea == G.play then -- if we are in card scoring phase, and we are on individual cards
            if not context.blueprint then -- blueprint/brainstorm don't get to add chips to themselves
                if context.other_card:get_id() == 2 then -- played card is a 2 by rank
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod -- add configurable amount of chips to joker
                    
                    return {                             -- shows a message under the specified card (card) when it triggers, k_upgrade_ex is a key in the localization files of Balatro
                        extra = {focus = card, message = localize('k_upgrade_ex')},
                        card = card,
                        colour = G.C.CHIPS
                    }
                end
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {                                     -- returns total chips from joker to be used in scoring, no need to show message in joker_main phase, game does it for us.
                chips = card.ability.extra.chips, 
                colour = G.C.CHIPS
            }
        end
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod }, key = self.key }
    end
}

SMODS.Joker{
    key = "sample_obelisk",
    config = { extra = { x_mult = 0.1 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'sample_obelisk',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
            local current_hand_times = (G.GAME.hands[context.scoring_name].played or 0) -- how many times has the player played the current type of hand. (pair, two pair. etc..)
            local current_xmult = 1 + (current_hand_times * card.ability.extra.x_mult)
            
            return {
                message = localize{type='variable',key='a_xmult',vars={current_xmult}},
                colour = G.C.RED,
                x_mult = current_xmult
            }

            -- you could also apply it to the joker, to do it like the sample wee, but then you'd have to reset the card and text every time the previewed hand changes.
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult }, key = self.key }
    end
}

SMODS.Joker{
    key = "sample_specifichand",
    config = { extra = { poker_hand = "Five of a Kind", x_mult = 5 } },
    pos={ x = 0, y = 0 },
    rarity = 3,
    cost = 10,
    blueprint_compat=true,
    eternal_compat=true,
    unlocked = true,
    discovered = true,
    effect=nil,
    soul_pos=nil,
    atlas = 'sample_specifichand',

    calculate = function(self,card,context)
        if context.joker_main and context.cardarea == G.jokers then
            if context.scoring_name == card.ability.extra.poker_hand then
                return {
                    message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
                    colour = G.C.RED,
                    x_mult = card.ability.x_mult
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.poker_hand, card.ability.extra.x_mult }, key = self.key }
    end        
}

SMODS.Joker{
    key = "sample_money",
    config={ },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'sample_money',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.end_of_round and not (context.individual or context.repetition) then --and not (context.individual or context.repetition) => make sure doesn't activate on every card like gold cards.
            ease_dollars(G.GAME.round_resets.blind_ante*2) -- ease_dollars adds or removes provided amount of money. (-5 would remove 5 for example)
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { }
    end
}

SMODS.Joker{
    key = "sample_roomba",
    config={ },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'sample_roomba',
    soul_pos = nil,

        calculate = function(self, card, context)
        if context.end_of_round and not (context.individual or context.repetition) then
            local cleanable_jokers = {}

            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= self then -- if joker is not itself 
                    cleanable_jokers[#cleanable_jokers+1] = G.jokers.cards[i] -- add all other jokers into a array
                end
            end

            local joker_to_clean = #cleanable_jokers > 0 and pseudorandom_element(cleanable_jokers, pseudoseed('clean')) or nil -- pick a random valid joker, or null if no valid jokers

            if joker_to_clean then -- if we have a valid joker we can bump into
                shakecard(joker_to_clean) -- simulate bumping into a card
                if(joker_to_clean.edition) then --if joker has an edition
                    if not joker_to_clean.edition.negative then --if joker is not negative
                        joker_to_clean:set_edition(nil) -- clean the joker from it's edition
                    end
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { }
    end
}

SMODS.Joker{
    key = "sample_drunk_juggler",
    config = { d_size = 1 }, -- d_size  = discard size, h_size = hand size. (HOWEVER, you can't have both on 1 joker!)
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'sample_drunk_juggler',
    soul_pos = nil,

    calculate = function(self, card, context)
        return nil
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.d_size, localize{type = 'name_text', key = 'tag_double', set = 'Tag'} } }
    end
}

SMODS.Joker{
    key = "sample_hackerman",
    config = { repetitions = 1 },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'sample_hackerman',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and (
            context.other_card:get_id() == 6 or 
            context.other_card:get_id() == 7 or 
            context.other_card:get_id() == 8 or 
            context.other_card:get_id() == 9) then
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.repetitions,
                card = self
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { }
    end
}

SMODS.Joker{
    key = "sample_baroness",
    config = { extra = { x_mult = 1.5 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'sample_baroness',
    soul_pos = nil,

    calculate = function(self, card, context)
        if not context.end_of_round then
            if context.cardarea == G.hand and context.individual and context.other_card:get_id() == 12 then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                        card = self,
                    }
                else
                    return {
                        x_mult = card.ability.extra.x_mult,
                        card = self
                    }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult } }
    end
}

SMODS.Joker{
    key = "sample_rarebaseballcard",
    config = { extra = { x_mult = 2 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'sample_rarebaseballcard',
    soul_pos = nil,

    calculate = function(self, card, context)
        if not (context.individual or context.repetition) and context.other_joker and context.other_joker.config.center.rarity == 3 and self ~= context.other_joker then
            shakecard(context.other_joker)
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                colour = G.C.RED,
                x_mult = card.ability.extra.x_mult
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult }, key = self.key}
    end
}

SMODS.Joker{
    key = "sample_multieffect",
    config = { extra = { chips = 10, mult = 10, x_mult = 2 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'sample_multieffect',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 10 then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
                x_mult = card.ability.extra.x_mult,
                card = self
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult }, key = self.key }
    end
}


SMODS.Joker{
    key = "2_fast_2_furious_joker",                       
    config = { extra = { chips = 8, chip_mod = 2 } },     --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = '2_fast_2_furious',                            
    loc_txt = {
        name = '2 fast 2 furious',
        text = {
            'Es levioooosa',
            'No leviosaaaaa',
        }
    },

}

SMODS.Joker{
    key = "balatro_balatrez_joker",                       
    config = { extra = { chips = 8, chip_mod = 2 } },     --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = 'balatro_balatrez',                            
    loc_txt = {
        name = 'balatro balatrez',
        text = {
            'Es levioooosa',
            'No leviosaaaaa',
        }
    },

}

SMODS.Joker{
    key = "beti_joker",                       
    config = { extra = { chips = 8, chip_mod = 2 } },     --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = 'beti',                            
    loc_txt = {
        name = 'beti',
        text = {
            'Es levioooosa',
            'No leviosaaaaa',
        }
    },

}

SMODS.Joker{
    key = "burn_joker",                       
    config = { extra = { chips = 8, chip_mod = 2 } },     --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = 'burn',                            
    loc_txt = {
        name = 'burn',
        text = {
            'Es levioooosa',
            'No leviosaaaaa',
        }
    },

}

SMODS.Joker{
    key = "cruzcampo_joker",                       
    config = { extra = { chips = 8, chip_mod = 2 } },     --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = 'cruzcampo',                            
    loc_txt = {
        name = 'cruzcampo',
        text = {
            'Es levioooosa',
            'No leviosaaaaa',
        }
    },

}

SMODS.Joker{
    key = "gaviota_joker",                       
    config = { extra = { chips = 8, chip_mod = 2 } },     --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = 'gaviota',                            
    loc_txt = {
        name = 'gaviota',
        text = {
            'Es levioooosa',
            'No leviosaaaaa',
        }
    },

}

SMODS.Joker{
    key = "greta_joker",                       
    config = { extra = { chips = 8, chip_mod = 2 } },     --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = 'greta',                            
    loc_txt = {
        name = 'greta',
        text = {
            'Es levioooosa',
            'No leviosaaaaa',
        }
    },

}


SMODS.Joker{
    key = "monster_joker",                       
    config = { extra = { chips = 8, chip_mod = 2 } },     --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = 'monster',                            
    loc_txt = {
        name = 'monster',
        text = {
            'Es levioooosa',
            'No leviosaaaaa',
        }
    },

}


SMODS.Joker{
    key = "monster_white_joker",                       
    config = { extra = { chips = 8, chip_mod = 2 } },     --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = 'monster_white',                            
    loc_txt = {
        name = 'monster white',
        text = {
            'Es levioooosa',
            'No leviosaaaaa',
        }
    },

}

SMODS.Atlas({
    key = "muriel",
    path = "muriel.png",
    px = 50,
    py = 84
})


SMODS.Joker{
    key = "muriel_joker",
    atlas = 'muriel',
    config = { needs_double_slot = true, extra = { chips = 200, mult = 100 } },
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 2,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    blueprint_compat = false,


    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end,

    remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + 1
	end,

    calculate = function(self, card, context)
       if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
                x_mult = 1
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult }, key = self.key }
    end
}



SMODS.Joker{
    key = "obama_joker",                       
    config = { extra = { chips = 8, chip_mod = 2 } },     --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = 'obama',                            
    loc_txt = {
        name = 'obama',
        text = {
            'Es levioooosa',
            'No leviosaaaaa',
        }
    },

}


SMODS.Joker{
    key = "paul_walker_joker",                       
    
    pos = { x = 0, y = 0 },                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = 'paul_walker',                            
    loc_txt = {
        name = 'paul walker',
        text = {
            'Es levioooosa',
            'No leviosaaaaa',
        }
    },

    config = { extra = {chips = 8, chip_mod = 2, oldshopsize = 3, buffedodds = 0}},

    add_to_deck = function(self, card, from_debuff)
        check_for_unlock({ type = "ach_isthat" })
        G.GAME.current_round.free_rerolls = 2
        card.ability.extra.oldshopsize = G.GAME.shop.joker_max
        G.GAME.current_round.free_rerolls = 2
        G.GAME.shop.joker_max = 9
        if G.shop then
            G.shop:recalculate()
            G.shop_jokers.T.w = 6*1.02*G.CARD_W
            G.shop_jokers.T.h = 1.05*G.CARD_H
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
		G.GAME.shop.joker_max = card.ability.extra.oldshopsize
	end,

    calculate = function(self, card, context)
        

        if context.end_of_round then
            card.ability.extra.buffedodds = 0
        end

        if context.starting_shop then
            G.GAME.current_round.free_rerolls = 2
            G.GAME.shop.joker_max = 9
            G.shop:recalculate()
            G.shop_jokers.T.w = 6*1.02*G.CARD_W
            G.shop_jokers.T.h = 1.05*G.CARD_H
        end


        if context.store_joker_create then
            --print("shopjoker created!")

        end


        G.GAME.current_round.free_rerolls = 2
        if context.reroll_shop then
            G.GAME.shop.joker_max = 9
            G.shop:recalculate()
            G.GAME.current_round.free_rerolls = 2
            -- for i = 1, #G.shop_jokers.cards do
            --     if math.random(0,100) < card.ability.extra.buffedodds then
            --         G.shop_jokers.cards[i]:set_edition({negative = true}, true)
            --     end
            --     if math.random(0,500) < card.ability.extra.buffedodds then
            --         G.shop_jokers.cards[i]:set_edition({yahimod_evil = true}, true)
            --     end
            -- end
        end
    end,

}


SMODS.Joker{
    key = "perro_sanxe_joker",                       
    config = { extra = { chips = 8, chip_mod = 2 } },     --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = 'perro_sanxe',                            
    loc_txt = {
        name = 'perro sanxe',
        text = {
            'Es levioooosa',
            'No leviosaaaaa',
        }
    },

}


SMODS.Joker{
    key = "renfe_joker",                       
    config = { extra = { chips = 8, chip_mod = 2 } },     --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = 'renfe',                            
    loc_txt = {
        name = 'renfe',
        text = {
            'Es levioooosa',
            'No leviosaaaaa',
        }
    },

}


SMODS.Joker{
    key = "sanic_joker",                       
    config = { extra = { chips = 8, chip_mod = 2 } },     --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = 'sanic',                            
    loc_txt = {
        name = 'sanic',
        text = {
            'Es levioooosa',
            'No leviosaaaaa',
        }
    },

}




























SMODS.Sound({key = "whatsapp", path = "whatsapp.ogg",})

SMODS.Atlas {
    key = "sepe",
    path = "sepe.png",
    px = 71,
    py = 96
}

SMODS.Seal {
    name = "sepe",
    key = "sepe",
    badge_colour = HEX("00FF00"),
	config = { mult = 1, chips = 10, money = 1, x_mult = 1.1, job = 1  },
    loc_txt = {
        -- Badge name (displayed on card description when seal is applied)
        label = 'Sepe sello',
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



SMODS.Atlas {
    key = "whatsapp_seal",
    path = "whatsappseal.png",
    px = 71,
    py = 96
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

SMODS.Atlas {
    key = "atlas_profesor_snape",
    path = "snape.png",
    px = 35,
    py = 35,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}



SMODS.Blind {
    name = "profesor_snape",
    key = "profesor_snape",
    atlas = "atlas_profesor_snape",
    pos = { y = 0 },
    dollars = 6,
    mult = 1.5,
    loc_txt = {
        name = 'PROFESOR SNAPE',
        text = {
             "Disculpe profesor Snape",
             "Tengo una pequeña duda",
        }
    },
    boss = {  min = 1 },
    boss_colour = HEX('456185'),

    set_blind = function(self)
        -- Activa el bucle
        Picaporte.video_loop_active = true
        Picaporte.video_timer = 0
    end,

    defeat = function(self)
        Picaporte.video_loop_active = false
    end,

    disable = function(self)
        Picaporte.video_loop_active = false
    end

}

