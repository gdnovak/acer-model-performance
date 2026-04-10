# Acer llama-server 32k

Tested working settings for `UD-Q4_K_M` on Acer.

## Settings

```text
host: acer
model_alias: gemma4-26b
model_path: /home/ai-admin/models/gemma4-26b-a4b-it-gguf/gemma-4-26B-A4B-it-UD-Q4_K_M.gguf
llama.cpp build: b1-25eec6f
ctx_size: 32768
batch_size: 1024
ubatch_size: 1024
parallel: 1
flash_attn: on
n_gpu_layers: auto
fit: on
threads: 28
port: 8080
gpu: NVIDIA GeForce RTX 5070 Ti
vram_observed: 16303 MiB total, 14890 MiB used, 949 MiB free
driver: 580.126.18
```
