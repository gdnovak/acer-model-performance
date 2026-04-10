# Q4_K_M

`gemma-4-31B-it-Q4_K_M.gguf` from `fractaldactal/gemma-4-31B-it-GGUF`.

Status: downloaded to Acer and serving successfully.

Download target:

```text
/home/ai-admin/models/gemma4-31b-it-gguf/gemma-4-31B-it-Q4_K_M.gguf
```

Snapshots in `snapshots/` should record tested settings if this quant serves successfully.

Current best-known practical Acer serve:

```text
ctx_size: 24576
batch_size: 512
ubatch_size: 512
```

Current tested range notes:

- Lower fast tier: `4096 / 1024`
- Comfortable floor: `8192 / 1024`
- Best-known practical tier: `24576 / 512`
- Highest quick-turn short-prompt tier seen: `40960 / 128`
