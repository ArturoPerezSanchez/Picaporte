
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
