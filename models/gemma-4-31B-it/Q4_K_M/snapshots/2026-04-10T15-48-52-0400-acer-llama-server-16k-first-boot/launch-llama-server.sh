#!/usr/bin/env bash
set -euo pipefail

MODEL_DIR="${HOME}/models/gemma4-31b-it-gguf"
MODEL_FILE="${MODEL_DIR}/gemma-4-31B-it-Q4_K_M.gguf"

if [[ ! -f "${MODEL_FILE}" ]]; then
  echo "Expected GGUF model not found: ${MODEL_FILE}" >&2
  exit 1
fi

THREADS="$(getconf _NPROCESSORS_ONLN)"

exec "${HOME}/.local/bin/llama-server" \
  -m "${MODEL_FILE}" \
  -a gemma4-31b \
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
