from PIL import Image
import os

def overlay_front_on_images(images_folder='images', overlay_file='front.png', output_folder='output'):
    # Asegura que la carpeta de salida exista
    os.makedirs(output_folder, exist_ok=True)

    # Carga la imagen del overlay (front.png)
    overlay = Image.open(overlay_file).convert("RGBA")

    for filename in os.listdir(images_folder):
        if not filename.lower().endswith(('.png', '.jpg', '.jpeg', '.bmp', '.gif')):
            continue  # Ignora archivos que no sean imagen

        image_path = os.path.join(images_folder, filename)
        base_image = Image.open(image_path).convert("RGBA")

        # Redimensiona el overlay al tamaño de la imagen base
        resized_overlay = overlay.resize(base_image.size, Image.LANCZOS)

        # Superpone la imagen con transparencia
        combined = Image.alpha_composite(base_image, resized_overlay)

        # Guarda la imagen resultante en la carpeta de salida
        output_path = os.path.join(output_folder, filename)
        combined.convert("RGB").save(output_path)
        print(filename)
    print("Proceso completado.")

overlay_front_on_images()