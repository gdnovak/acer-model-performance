#!/usr/bin/env bash
set -euo pipefail

MODEL_DIR="${HOME}/models/gemma4-26b-a4b-it-gguf"
MODEL_FILE="$(find "${MODEL_DIR}" -maxdepth 1 -type f -name '*.gguf' | head -n 1)"

if [[ -z "${MODEL_FILE}" ]]; then
  echo "No GGUF model found in ${MODEL_DIR}" >&2
  exit 1
fi

THREADS="$(getconf _NPROCESSORS_ONLN)"

exec "${HOME}/.local/bin/llama-server" \
  -m "${MODEL_FILE}" \
  -a gemma4-26b \
  --host 127.0.0.1 \
  --port 8080 \
  --ctx-size 32768 \
  --n-gpu-layers auto \
  --fit on \
  --flash-attn on \
  --threads "${THREADS}" \
  --batch-size 1024 \
  --ubatch-size 1024 \
  --parallel 1
