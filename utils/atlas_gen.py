import os
from PIL import Image

# Ruta de la carpeta con los archivos de entrada
input_folder = 'images'


# Recorrer todos los archivos en la carpeta de entrada
for filename in os.listdir(input_folder):
    # Comprobar si es un archivo de imagen (por ejemplo, .jpg, .jpeg, .png)
    if filename.lower().endswith(('.png', '.jpg', '.jpeg')):


        print(f"""
SMODS.Joker{{
    key = "{filename[:-4]}_joker",                       
    config = {{ extra = {{ chips = 8, chip_mod = 2 }} }},     --variables used for abilities and effects.
    pos = {{ x = 0, y = 0 }},                               --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 1,                                           --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 2,                                             --cost to buy the joker in shops.
    blueprint_compat=false,                               --does joker work with blueprint.
    eternal_compat=true,                                  --can joker be eternal.
    unlocked = true,                                      --is joker unlocked by default.
    discovered = true,                                    --is joker discovered by default.    
    effect=nil,                                           --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                         --pos of a soul sprite.
    atlas = '{filename[:-4]}',                            
    loc_txt = {{
        name = '{filename[:-4].replace("_", " ")}',
        text = {{
            'Es levioooosa',
            'No leviosaaaaa',
        }}
    }},

}}
""")



#         print(f"""
# SMODS.Atlas({{
#     key = "{filename[:-4]}",
#     path = "{filename[:-4]}.png",
#     px = 71,
#     py = 95
# }})

# """)
