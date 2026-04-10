# CHANGING MODELS

## SNAPSHOT GUIDE

  1. Backup current launcher before any switch
  
  > cp -p ~/bin/launch-llama-server.sh ~/bin/launch-llama-server.sh.backup-$(date+%Y%m%d-%H%M%S)

  2. Point launcher to new model + settings
  
cat > ~/bin/launch-llama-server.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
MODEL_DIR="${HOME}/models/<model-folder>"
MODEL_FILE="${MODEL_DIR}/<file.gguf>"
THREADS="$(getconf _NPROCESSORS_ONLN)"

exec "${HOME}/.local/bin/llama-server" \
  -m "${MODEL_FILE}" \
  -a <model-alias> \
  --host 127.0.0.1 \
  --port 8080 \
  --ctx-size 16384 \
  --n-gpu-layers auto \
  --fit on \
  --flash-attn on \
  --threads "${THREADS}" \
  --batch-size 512 \
  --ubatch-size 512 \
  --parallel 1
EOF
chmod +x ~/bin/launch-llama-server.sh



## CHANGING TO NEW MODEL

### PRECAUTIONS

  Two cautions:

  1. Do not put multiple .gguf files in the same folder if your launcher auto-
  picks “first gguf”.
  2. **SAVE THE OLD LAUNCHER before switching:**
  
  >  cp -p ~/bin/launch-llama-server.sh ~/bin/launch-llama-server.sh.backup-$(date+%Y%m%d-%H%M%S)
  
### DOWNLOAD NEW MODEL

  **To download another GGUF to Acer, put it under a new model folder in:
  
  > /home/ai-admin/models:

  >  mkdir -p ~/models/my-new-model-gguf
  > hf download <hf-user-or-org>/<repo> <filename.gguf> --local-dir ~/models/NAME-gguf

  Example (note the arg):

  > hf download fractaldactal/gemma-4-31B-it-GGUF gemma-4-31B-it-Q4_K_M.gguf --local-dir ~/models/gemma4-31b-it-gguf

### EDIT LLAMA-SERVER LAUNCHER 

  Point launcher at new model by editing ~/bin/launch-llama-server.sh

  HOW TO EDIT LAUNCHER:

  #!/usr/bin/env bash
  set -euo pipefail
  MODEL_DIR="${HOME}/models/my-new-model-gguf"
  MODEL_FILE="${MODEL_DIR}/filename.gguf"
  THREADS="$(getconf _NPROCESSORS_ONLN)"

  exec "${HOME}/.local/bin/llama-server" \
    -m "${MODEL_FILE}" \
    -a mymodelalias \
    --host 127.0.0.1 \
    --port 8080 \
    --ctx-size 16384 \
    --n-gpu-layers auto \
    --fit on \
    --flash-attn on \
    --threads "${THREADS}" \
    --batch-size 512 \
    --ubatch-size 512 \
      --parallel 1

  Then restart:

  > systemctl --user restart llama-server
  > curl -sf http://127.0.0.1:8080/props | jq

  *On your cleanup question: you do not need to manually “clean out” the old
  server first. Restarting llama-server with the new launcher replaces the old
  process, unloads the old model, and loads the new one. In practice:*

  >  systemctl --user restart llama-server

  is the model switch.



