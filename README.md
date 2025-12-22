# ComfyUI (Docker)

Versión dockerizada de [ComfyUI](https://www.comfy.org/) para aislar y simplificar toda la instalación.

Es necesario lo siguiente:

- Docker instalado
- WSL2 instalado (Windows)
- WSL2 configurado para trabajar con CUDA/GPU (Windows)
- NVIDIA Container Toolkit instalado (compartir GPU con Docker)

### NVIDIA Container Toolkit

Para utilizar GPU del anfitron necesitas NVIDIA Container Toolkit. Aquí tienes las instrucciones para instalarlo: [Install NVIDIA Container Toolkit 1.18.1](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#with-apt-ubuntu-debian)

### Modelos

Para empezar, necesitarás un modelo «checkpoint». Uno muy bueno es [Juggernaut XL](https://civitai.com/models/133005/juggernaut-xl). Colócalo en la carpeta `models/checkpoints/`.

Luego, opcionalmente, puedes añadir modelos LoRA en `models/loras/` para mejorar las imágenes generadas.

Descarga la siguiente imagen y arrástrala a una ventana de ComfyUI. Tiene un workflow básico integrado con un prompt de ejemplo para generar la imagen:

![Imagen generada de ejemplo](example.png)

### Plugins instalados

- ComfyUI Manager: Instalador de plugins
- ComfyUI Custom Scripts: Mejoras de UI para ComfyUI
- ComfyUI Ollama: Plugin para utilizar Ollama con ComfyUI
- Rembg Background: Plugin para eliminar el fondo de imágenes
- LoraInfo: Plugin para obtener información de LoRAs
- LoadLoraWithTags: Plugin para cargar automáticamente tags de las LoRAs

### Getting Started

Tienes el script `start` que genera la imagen de docker (7~8GB), crea un contenedor y arranca ComfyUI.

- Usa las carpetas `models/` para compartir modelos o loras.
- En la carpeta `output/` se guardan las imágenes generadas.
- La URL de ComfyUI suele ser `http://127.0.0.1:8188/`.

Si te interesa profundizar, si usas `docker run`, recuerda:

- Usar `--gpus all` para usar la GPU local desde el contenedor.
- Usar `-p 8188:8188` para exponer el puerto `8188` del contenedor.
- Usar `-v local:container` para compartir volumenes del host.
