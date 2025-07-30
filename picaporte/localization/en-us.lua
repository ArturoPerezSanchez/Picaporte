return {
    descriptions = {
        Joker = {
            j_sj_sample_wee = {
                name = "Sample Wee",
                text = {
                    "This Joker gains",
                    "{C:chips}+#2#{} Chips when each",
                    "played {C:attention}2{} is scored",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                },
            },
            j_sj_sample_obelisk = {
                name = "Sample Obelisk",
                text = {
                    {
                        "This Joker gives {X:mult,C:white} X#1# {} Mult",
                        "for each time you've played this {C:attention}hand",
                    }
                },
            },
            j_sj_sample_specifichand = {
                name = "Sample Specific Hand",
                text = {
                    {
                        "If the hand played is #1#,",
                        "Gives {X:mult,C:white} X#2# {} Mult"
                    }
                },
            },
            j_sj_sample_money = {
                name = "Sample Money",
                text = {
                    {
                        "Earn (Ante x 2) {C:money}${} at",
                        "end of round, also here's some text effects:",
                        "{C:money} money{}, {C:chips} chips{}, {C:mult} mult{}, {C:red} red{}, {C:blue} blue{}, {C:green} green{}",
                        "{C:attention} attention{}, {C:purple} purple{}, {C:inactive} inactive{}",
                        "{C:spades} spades{}, {C:hearts} hearts{}, {C:clubs} clubs{}, {C:diamonds} diamonds{}",
                        "{C:tarot} tarot{}, {C:planet} planet{}, {C:spectral} spectral{}",
                        "{C:edition} edition{}, {C:dark_edition} dark edition{}, {C:legendary} legendary{}, {C:enhanced} enhanced{}",
                    }
                },
            },
            j_sj_sample_roomba = {
                name = "Sample Roomba",
                text = {
                    {
                        "Attempts to remove edition",
                        "from another Joker",
                        "at the end of each round",
                        "{C:inactive}(Foil, Holo, Polychrome)"
                    }
                },
            },
            j_sj_sample_drunk_juggler = {
                name = "Sample Drunk Juggler",
                text = {
                    {
                        "{C:red}+#1#{} discard,",
                        "also here's some {X:legendary,C:white}text effects{}:",
                        "{s:0.5} scaled down by 0.5",
                        "{C:attention,T:tag_double}#2#",
                    }
                },
            },
            j_sj_sample_hackerman = {
                name = "Sample Hackerman",
                text = {
                    {
                        "Retrigger",
                        "each played",
                        "{C:attention}6{}, {C:attention}7{}, {C:attention}8{}, or {C:attention}9{}",
                    }
                },
            },
            j_sj_sample_baroness = {
                name = "Sample Baroness",
                text = {
                    {
                        "Each {C:attention}Queen{}",
                        "held in hand",
                        "gives {X:mult,C:white} X#1# {} Mult",
                    }
                },
            },
            j_sj_sample_rarebaseballcard = {
                name = "Sample Rare Baseball Card",
                text = {
                    {
                        "{X:mult,C:white}Rare{} Jokers",
                        "each give {X:mult,C:white} X#1# {} Mult",
                    }
                },
            },
            j_sj_sample_multieffect = {
                name = "Sample Multi-Effect",
                text = {
                    {
                        "Each played {C:attention}10{}",
                        "gives {C:chips}+#1#{} Chips and",
                        "{C:mult}+#2#{} Mult when scored",
                    }
                },
            },
            j_sj_muriel_joker = {
                name = "la mamá de " .. os.getenv("USERNAME") or "muriel",
                text = {
                    {
                        "Es tan gorda que ocupa 2 slots",
                        "Otorga {C:chips}+#1#{} Fichas y",
                        "{C:mult}+#2#{} Multi",
                    }
                },
            },
            j_sj_culo_de_arena = {
                name = "Tengo arena",
                text = {
                    {
                        "Al aceptar la ciega",
                        "caga un chorrón de arena",
                        "{C:inactive}(Polychrome)"
                    }
                },
            },
            j_sj_julio = {
                name = "Formulario de trabajo",
                text = {
                    {
                        "Espanta a Julio"
                    }
                },
            },
            j_sj_pota = {
                name = "Cena del Julio",
                text = {
                    {
                        "Que asco"
                    }
                },
            },
            j_sj_lgtb = {
                name = "lgtb?",
                text = {
                    {
                        "Debi suponerlo",
                        "Obtiene {X:mult,C:white} X1.5 {}  Multi  por cada carta {C:edition} policroma {}",
                        "{C:inactive}(Actual {X:mult,C:white} X#1# {C:inactive} multi)"
                    }
                },
            },
            j_sj_abascal = {
                name = "Abascal meao",
                text = {
                    {
                        "c mea"
                    }
                },
            },
            j_sj_carbono = {
                name = "Inánimada barra de carbono",
                text = {
                    {
                        "Empleada del mes",
                    }
                },
            }
        }
    },
    misc = {

            -- do note that when using messages such as: 
            -- message = localize{type='variable',key='a_xmult',vars={current_xmult}},
            -- that the key 'a_xmult' will use provided values from vars={} in that order to replace #1#, #2# etc... in the localization file.


        dictionary = {
            a_chips="+#1#",
            a_chips_minus="-#1#",
            a_hands="+#1# Hands",
            a_handsize="+#1# Hand Size",
            a_handsize_minus="-#1# Hand Size",
            a_mult="+#1# Mult",
            a_mult_minus="-#1# Mult",
            a_remaining="#1# Remaining",
            a_sold_tally="#1#/#2# Sold",
            a_xmult="X#1# Mult",
            a_xmult_minus="-X#1# Mult",
        }
    }
}