import os           # Librería para manejar archivos del sistema como crear directorios y archivos
import subprocess   # Librería para abrir aplicaciones

# Obtiene la ruta del escritorio del usuario actual de forma dinámica
desktop_path = os.path.join(os.path.expanduser("~"), 'Desktop')

# Crea la estructura de carpetas
folder_path = os.path.join(desktop_path, 'NewDirectory')
os.makedirs(folder_path, exist_ok=True)

# Crea el archivo de texto y escribe el contenido
file_path = os.path.join(folder_path, 'text.txt')
with open(file_path, 'w') as file:
    file.write("Creado con python")

# Abre el archivo .txt después de crearlo
subprocess.Popen(['notepad.exe', file_path])

# Abre la calculadora
subprocess.Popen('calc.exe')