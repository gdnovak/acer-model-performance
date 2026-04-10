# Acer llama-server 24576

Tested working settings for `Q4_K_M` on Acer.

## Settings

```text
host: acer
model_alias: gemma4-31b
model_path: /home/ai-admin/models/gemma4-31b-it-gguf/gemma-4-31B-it-Q4_K_M.gguf
llama.cpp build: b1-25eec6f
ctx_size: 24576
batch_size: 512
ubatch_size: 512
parallel: 1
flash_attn: on
n_gpu_layers: auto
fit: on
threads: 28
port: 8080
gpu: NVIDIA GeForce RTX 5070 Ti
vram_observed: 16303 MiB total, 14806 MiB used, 1033 MiB free
driver: 580.126.18
opencode_model: llama.cpp/gemma4-31b
opencode_context_limit: 24576
```

## Restore

Copy `launch-llama-server.sh` to `~/bin/launch-llama-server.sh` on Acer and restart
`llama-server`.
