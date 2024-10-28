# 🐍 Manipulación de Archivos, Directorios y Ejecución de Programas en Python

Esta guía explora cómo usar Python para:

1. 📄 Crear y escribir en archivos.
2. 📖 Leer archivos y mostrar el contenido en la terminal.
3. 📁 Crear, eliminar y modificar directorios.
4. 🌐 Manejar rutas de manera flexible.
5. ⚙️ Ejecutar aplicaciones del sistema desde Python.

---

## 1. 📝 Manipulación de Archivos en Python

### 🖊️ Creación y Escritura en Archivos

Para crear y escribir en un archivo, utiliza el siguiente código:

````python
with open('archivo.txt', 'w') as file:
    file.write("Contenido del archivo")
```

Modos de apertura de archivos:
**'w'**: Crea un archivo nuevo o sobrescribe uno existente.
**'a'**: Añade contenido al final de un archivo existente.
**'r'**: Lee el archivo.
**'x'**: Crea un archivo nuevo (fallará si el archivo ya existe).

### 📖 Leer Archivos

```python
with open('archivo.txt', 'r') as file:
    contenido = file.read()
    print(contenido)
````

### Leer línea por línea:

```python
with open('archivo.txt', 'r') as file:
    for linea in file:
        print(linea.strip())  # Elimina saltos de adicionales
```

## 2. 📂 Manejo de Directorios

### ➕ Crear Directorios

Para crear un directorio, utiliza:

```python
import os
os.makedirs('nombre_del_directorio', exist_ok=True)
```

**exist_ok=True** evita errores si el directorio ya existe.

### 📍 Cambiar de Directorio

```python
os.chdir('ruta_a_directorio')
```

### 🗑️ Eliminar Archivos y Directorios

Eliminar un archivo:

```python
os.remove('archivo.txt')
```

Eliminar un directorio vacío:

```python
os.rmdir('nombre_del_directorio')
```

Eliminar un directorio con contenido:

```python
import shutil
shutil.rmtree('nombre_del_directorio')
```

## 3. 🛠️ Manejo de Rutas en Python

Usa `os.path` y `pathlib` para manejar rutas de manera flexible.

### 🔗 Unir Rutas

```python
import os
ruta = os.path.join('carpeta', 'subcarpeta', 'archivo.txt')
```

### 🏠 Obtener Ruta Absoluta

```python
ruta_absoluta = os.path.abspath('archivo.txt')
```

### 👤 Obtener Directorio del Usuario

```python
import os
ruta_usuario = os.path.expanduser("~")  # Devuelve la ruta al directorio principal del usuario
```

### 🖇️ Pathlib para Manipulación de Rutas

El módulo `pathlib` es una alternativa moderna para manejar rutas:

```python
from pathlib import Path

# Ruta al Escritorio
escritorio = Path.home() / 'Desktop'
ruta_archivo = escritorio / 'PythonProgram' / 'archivo.txt'
```

## 4. 🚀 Ejecutar Aplicaciones del Sistema

Usa subprocess para abrir aplicaciones del sistema operativo.

### 📟 Ejemplo: Abrir la Calculadora en Windows

```python
import subprocess
subprocess.Popen('calc.exe')
```

### 📝 Ejemplo: Abrir Bloc de Notas

```python
subprocess.Popen(['notepad.exe', 'archivo.txt'])
```

> **Nota:** En Linux o macOS, usa el nombre de la aplicación o su ruta. Ejemplo en Linux: `subprocess.Popen(['gedit', 'archivo.txt'])`.

## 📚 Ejemplo Completo

Este ejemplo muestra cómo crear un directorio llamado `test1` en el escritorio, crear un archivo `texto1.txt` en él, leer su contenido en la terminal, y repetir el proceso para `texto2.txt` en la carpeta actual.

Codigo

```python
import os

# 1. Crear una carpeta "test1" en el escritorio
escritorio_path = os.path.join(os.path.expanduser("~"), 'Desktop', 'test1')
os.makedirs(escritorio_path, exist_ok=True)

# 2. Crear y escribir en el archivo texto1.txt en el escritorio
file_path1 = os.path.join(escritorio_path, 'texto1.txt')
with open(file_path1, 'w') as file1:
    file1.write("texto1")

# Leer y mostrar el contenido de texto1.txt en la terminal
with open(file_path1, 'r') as file1:
    print("Contenido de texto1.txt:", file1.read())

# 3. Crear y escribir en el archivo texto2.txt en el directorio actual
file_path2 = 'texto2.txt'
with open(file_path2, 'w') as file2:
    file2.write("texto2")

# Leer y mostrar el contenido de texto2.txt en la terminal
with open(file_path2, 'r') as file2:
    print("Contenido de texto2.txt:", file2.read())
```

## 🔗 Referencias de la Documentación

Para aprender más, consulta la documentación oficial de Python en los siguientes enlaces:

- 📄 [Manejo de archivos](https://docs.python.org/3/tutorial/inputoutput.html#reading-and-writing-files) (Python Docs)
- 📁 [Manejo de directorios y archivos con os y shutil](https://docs.python.org/3/library/os.html) (Python Docs)
- 📂 [Manejo de rutas con pathlib](https://docs.python.org/3/library/pathlib.html) (Python Docs)
- ⚙️ [Ejecutar programas y comandos del sistema con subprocess](https://docs.python.org/3/library/subprocess.html) (Python Docs)
