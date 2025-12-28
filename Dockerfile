FROM python:3.12-slim AS build
WORKDIR /ComfyUI

ENV PIP_ROOT_USER_ACTION=ignore
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PIP_NO_CACHE_DIR=1

# Build stage
RUN apt update && apt upgrade && apt install -y curl git
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /ComfyUI/ && \
    git clone https://github.com/ltdrdata/ComfyUI-Manager /ComfyUI/custom_nodes/comfyui-manager/ && \
    git clone https://github.com/Extraltodeus/LoadLoraWithTags /ComfyUI/custom_nodes/LoadLoraWithTags/ && \
    git clone https://github.com/Jcd1230/rembg-comfyui-node /ComfyUI/custom_nodes/rembg-comfyui-node/ && \
    git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts /ComfyUI/custom_nodes/ComfyUI-Custom-Scripts/ && \
    git clone https://github.com/jitcoder/lora-info /ComfyUI/custom_nodes/lora-info/ && \
    git clone https://github.com/stavsap/comfyui-ollama /ComfyUI/custom_nodes/comfyui-ollama/ && \
    git clone https://github.com/city96/ComfyUI-GGUF /ComfyUI/custom_nodes/ComfyUI-GGUF/
RUN pip install -r /ComfyUI/requirements.txt
RUN pip install ollama rembg onnxruntime uv gguf

# Cleanup
RUN rm -rf /var/lib/apt/lists/*

RUN echo "python /ComfyUI/main.py --lowvram --disable-smart-memory --listen 0.0.0.0" >/start && chmod +x /start

CMD ["sh", "/start"]
