# Gemma 4 26B A4B

Google Gemma 4 mixture-of-experts model.

Best model family I have tried as of 2026-04-10 (opinion).

## Model Description

Gemma 4 26B A4B is the medium Mixture-of-Experts (MoE) member of the Gemma 4 family.

It has about 4B active parameters (A4B) and about 26B total parameters.

Key capabilities and architecture notes:

- Reasoning-focused instruction model with configurable thinking modes.
- Text and image input; text output.
- 256K-token advertised context window, subject to local serving limits.
- Native system-role and function-calling support for agentic workflows.
- Hybrid attention with sliding-window layers plus periodic global attention.
- Strong coding, reasoning, and multimodal benchmark positioning for its size.

## Further Reading

- Hugging Face: https://huggingface.co/google/gemma-4-26B-A4B-it
- Google Gemma documentation: https://ai.google.dev/gemma/docs/core
- Official GitHub organization: https://github.com/google-gemma

## Downloaded

- `UD-Q5_K_M`
  - llama.cpp, served with llama-server.
  - Loaded on Acer as of 2026-04-10 11:43.
  - Best model so far.
  - Notes should live under this model folder's matching quant-suffix folder.

- Ollama variant, exact tag TBD.
  - Good first impression, but not yet studied enough to rank.

## Planned Downloads

### Definitely Testing

- Higher quants: Q5, Q6, Q8.
- Other compelling versions or quants, especially ones optimized for Nvidia Blackwell / RTX 5070 Ti, improved reasoning, or better Transformers support.

### Testing Time-Permitting

- Low-end quants of Gemma 4 31B IT.

### What To Look For

- Nvidia or Blackwell / RTX 5070 Ti focused optimizations.
- RAM / CPU offload optimizations.
- Strong non-llama.cpp variants worth testing even if they need a different runtime.

## Quant Naming

At this model-file level, refer to GGUF quantizations by the quant suffix only.
For example, use `UD-Q5_K_M`, not `gemma-4-26B-A4B-it-UD-Q5_K_M.gguf`,
`4-26B-A4B-it-UD-Q5_K_M`, or any other longer variant. Use the same suffix for
the matching folder directly under this model folder so both agents and humans
can identify the quant quickly.
