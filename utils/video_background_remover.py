import cv2
import numpy as np
from rembg import remove

# Función para procesar cada fotograma
def process_frame(frame):
    # Convierte el fotograma de BGR a RGB
    rgb_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
    
    # Elimina el fondo del fotograma usando rembg
    output = remove(rgb_frame)
    
    # Convierte el resultado de vuelta a formato BGR
    output_bgr = cv2.cvtColor(output, cv2.COLOR_RGB2BGR)
    
    return output_bgr

# Abrir el video de entrada
video_input = 'input_video.mp4'
cap = cv2.VideoCapture(video_input)

# Obtener las propiedades del video (resolución y FPS)
fps = cap.get(cv2.CAP_PROP_FPS)
width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

# Obtener el número total de fotogramas del video
total_frames = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))

# Crear el objeto VideoWriter para guardar el video con el fondo eliminado
video_output = 'output_video.mp4'
fourcc = cv2.VideoWriter_fourcc(*'mp4v')
out = cv2.VideoWriter(video_output, fourcc, fps, (width, height))

frame_count = 0  # Contador de fotogramas procesados

while cap.isOpened():
    ret, frame = cap.read()
    if not ret:
        break

    # Procesa el fotograma para eliminar el fondo
    processed_frame = process_frame(frame)

    # Escribe el fotograma procesado en el archivo de salida
    out.write(processed_frame)

    # Actualiza el contador de fotogramas
    frame_count += 1

    # Muestra el progreso cada 10 fotogramas
    if frame_count % 10 == 0:
        progress = (frame_count / total_frames) * 100
        print(f'Progreso: {progress:.2f}% ({frame_count}/{total_frames} fotogramas procesados)')

# Cierra el video
cap.release()
out.release()
cv2.destroyAllWindows()

print("El fondo ha sido eliminado y el video se ha guardado como 'output_video.mp4'")
