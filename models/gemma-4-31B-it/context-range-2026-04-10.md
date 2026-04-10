# Context Range 2026-04-10

Model: `gemma-4-31B-it-Q4_K_M.gguf`

## Summary

- Lowest tested fast tier: `2048 / 1024`
- Lowest tier I would actually use: `4096 / 1024`
- Comfortable floor: `8192 / 1024`
- Best-known practical tier: `24576 / 512`
- Highest quick-turn tier that still answered a short prompt: `40960 / 128`

## Notes

- `16384 / 1024` served and handled both short and long stress prompts.
- `24576 / 1024` started, but a long stress request was unstable.
- `24576 / 512` served cleanly and answered short prompts reliably.
- `32768 / 256` served, but the run was contaminated by overlapping stress jobs.
- `40960 / 128` served and answered short prompts.
- Long near-limit prompts are more sensitive than short prompts and are a worse fit test
  for this model than simple serve-plus-short-prompt checks.
