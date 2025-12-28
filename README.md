# ComfyUI (Docker)

Versión dockerizada de [ComfyUI](https://www.comfy.org/) para aislar y simplificar toda la instalación.

Es necesario lo siguiente:

- 1️⃣ [Docker](https://docs.docker.com/desktop/setup/install/windows-install/) instalado
- 2️⃣ [WSL2](https://terminaldelinux.com/terminal/wsl/instalacion-wsl/) instalado (Windows)
- 3️⃣ [Drivers de NVIDIA](https://www.nvidia.com/es-es/drivers/) instalados
- 4️⃣ [CUDA Toolkit 13.1](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Debian&target_version=13&target_type=deb_local) para usar GPU en WSL2 (Windows)
- 5️⃣ [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#with-apt-ubuntu-debian) instalado (compartir GPU con Docker)

### Modelos (imagen)

Para empezar, necesitarás un modelo «checkpoint». Uno muy bueno es [Juggernaut XL](https://civitai.com/models/133005/juggernaut-xl). Debes colocarlo en la carpeta `models/checkpoints/`.

![Imagen generada de ejemplo](example.png)

### Modelos (video)

Para empezar, necesitarás un modelo de difusión y un lora. Un buen punto de partida podría ser:

- [WAN2.2 I2V A15B (GGUF)](https://huggingface.co/QuantStack/Wan2.2-I2V-A14B-GGUF)
- [Lora WAN 2.2 Lightning](https://huggingface.co/Kijai/WanVideo_comfy/tree/main/LoRAs/Wan22-Lightning/old)
- [VAE para WAN2.2](https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged)

**Pulsa para ver el video generado a partir de la imagen**:
[![Imagen generada de ejemplo](example.png)](example.mp4)

En ambos casos (imagen y video) opcionalmente puedes añadir modelos LoRA en `models/loras/` para mejorar los ficheros multimedia generados.

Descarga la imagen o el video y arrástralo a una ventana de ComfyUI. Tiene un workflow básico integrado con un prompt de ejemplo para trabajar con ellos.

### Plugins instalados

- ComfyUI Manager: Instalador de plugins
- ComfyUI Custom Scripts: Mejoras de UI para ComfyUI
- ComfyUI Ollama: Plugin para utilizar Ollama con ComfyUI
- Rembg Background: Plugin para eliminar el fondo de imágenes
- LoraInfo: Plugin para obtener información de LoRAs
- LoadLoraWithTags: Plugin para cargar automáticamente tags de las LoRAs
- ComfyUI GGUF: Soporte de cuantización usando modelos GGUF

### Getting Started

El script `start` genera la imagen de docker (recomendado tener al menos unos 15GB libres en WSL2), crea un contenedor y arranca ComfyUI en modo bajo consumo de memoria.

- Usa las carpetas `models/` para compartir modelos o loras.
- En la carpeta `output/` se guardan las imágenes generadas.
- La URL de ComfyUI suele ser `http://127.0.0.1:8188/`.

Si te interesa profundizar, si usas `docker run`, recuerda:

- Usar `--gpus all` para usar la GPU local desde el contenedor.
- Usar `-p 8188:8188` para exponer el puerto `8188` del contenedor.
- Usar `-v local:container` para compartir volumenes del host.
