SMODS.Sound({key = "pee_sound", path = "pee_sound.ogg",})

SMODS.Shader({
    key = 'pee',
    path = 'pee.fs',
    send_vars = function(sprite, card)
        return {
            rain_texture = Picaporte.rain_image,
            pee = card and card.edition.pee_seed or {0.0, 0.0},
        }
    end,
})

SMODS.Edition{
	key = "pee_edition",
	order = 2,
    loc_txt = {
        name = "Meado",
        label = "Miado",
        text = {
            "{X:mult,C:white} -5% {}{C:blue} Fichas",
            "Huele raro"
        }
    },
	weight = 13,
	shader = "pee",
	in_shop = true,
	extra_cost = 3,
	config = { x_chips = 0.95, trigger = nil },
	sound = { sound = "sj_pee_sound", per = 1, vol = 0.3, },
    
    pee_seed = { math.random(), math.random() },

	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	loc_vars = function(self, info_queue)
		return { vars = { self.config.x_chips } }
	end,
	calculate = function(self, card, context)
		if (
				context.edition -- for when on jonklers
				and context.cardarea == G.jokers -- checks if should trigger
				and card.config.trigger -- fixes double trigger
			) or (
				context.main_scoring -- for when on playing cards
				and context.cardarea == G.play
			)
		then
			return { message = "c mea, -5%", x_chips = self.config.x_chips } -- updated value
		end
		if context.joker_main then
			card.config.trigger = true -- context.edition triggers twice, this makes it only trigger once (only for jonklers)
		end

		if context.after then
			card.config.trigger = nil
		end
	end,
}
   
    

return {
    name = "Misc.",
    items = { pee }
}