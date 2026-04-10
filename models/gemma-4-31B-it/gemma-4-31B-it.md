# Gemma 4 31B IT

Google Gemma 4 31B instruction model.

## Source

- Hugging Face: https://huggingface.co/fractaldactal/gemma-4-31B-it-GGUF
- Base model: https://huggingface.co/google/gemma-4-31B-it

## Downloaded / Testing

- `Q4_K_M`
  - File: `gemma-4-31B-it-Q4_K_M.gguf`
  - Size: 18.32 GB / 17.07 GiB.
  - Download target on Acer: `/home/ai-admin/models/gemma4-31b-it-gguf/`.
  - Status: downloaded on 2026-04-10 and serving on Acer for context/batch testing.

## Notes

- First 31B-class Gemma test on Acer.
- Chosen to find the practical size limit before testing smaller or more compressed 31B quants.
- Use the latest snapshot under `Q4_K_M/snapshots/` to restore the last tested Acer state.
- Current best-known practical Acer serve: `ctx 24576`, `batch 512`, `ubatch 512`.
- Highest quick-turn serve that answered a short prompt: `ctx 40960`, `batch 128`.
