import os
from PIL import Image

# Ruta de la carpeta con los archivos de entrada
input_folder = 'images'
# Ruta de la carpeta de salida donde se guardarán las imágenes redimensionadas
output_folder1 = os.path.join(input_folder, '../x1')
output_folder2 = os.path.join(input_folder, '../x2')

# Crear la carpeta de salida si no existe
if not os.path.exists(output_folder1):
    os.makedirs(output_folder1)
if not os.path.exists(output_folder2):
    os.makedirs(output_folder2)


# Recorrer todos los archivos en la carpeta de entrada
for filename in os.listdir(input_folder):
    # Comprobar si es un archivo de imagen (por ejemplo, .jpg, .jpeg, .png)
    if filename.lower().endswith(('.png', '.jpg', '.jpeg')):
        # Ruta completa del archivo de entrada
        input_path = os.path.join(input_folder, filename)
        
        # Abrir la imagen
        with Image.open(input_path) as img:
            # Redimensionar la imagen a 72x95 manteniendo la proporción (sin cortar)
            img_resized = img.resize((71, 95), Image.Resampling.LANCZOS)
            
            # Ruta de salida para guardar la imagen redimensionada
            output_path = os.path.join(output_folder1, f'{os.path.splitext(filename)[0]}.png')
            
            # Guardar la imagen redimensionada en formato PNG
            img_resized.save(output_path)


            img_resized = img.resize((142, 190), Image.Resampling.LANCZOS)
            
            # Ruta de salida para guardar la imagen redimensionada
            output_path = os.path.join(output_folder2, f'{os.path.splitext(filename)[0]}.png')
            
            # Guardar la imagen redimensionada en formato PNG
            img_resized.save(output_path)




        print(f'Imagen guardada: {output_path}')
