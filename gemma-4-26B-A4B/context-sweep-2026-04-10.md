# Acer Gemma 4 Context Sweep - April 10, 2026

Completed the sweep and restored the original service. Acer is back on:

```bash
--ctx-size 16384 --batch-size 1024 --ubatch-size 1024 --parallel 1
```

Current restored process was PID `1893559` at verification time, model alias `gemma4-26b`, port `8080`, same GGUF path. VRAM after restore:

```text
14750 MiB used, 1089 MiB free
```

## What I Tested

I used the current Gemma 4 26B UD-Q4_K_M GGUF with:

- short exact-answer prompts
- opencode-style coding/review prompts
- JSON-only structured-output prompts
- long retrieval prompts around 22k to 30k tokens
- near-context-limit final-instruction prompts
- 24k at batch `1024`
- 32k at batches `1024`, `512`, and `256`

No server crashes. No OOMs. No hangs.

## 16k Baseline

Current 16k service works for normal and medium opencode-style use.

Observed:

| Case | Result |
|---|---|
| opencode patch prompt, ~3.3k prompt tokens | OK, answered in `2.9s` |
| prior real logs around ~10k prompt tokens | OK, no truncation |
| synthetic 19.5k prompt | rejected cleanly: exceeds `16384` |
| synthetic 27k prompt | rejected cleanly: exceeds `16384` |

Important behavior edge: short "reply exactly" and JSON prompts can spend the whole `max_tokens` budget in `reasoning_content` and return empty final `content` if `max_tokens` is too low. With higher `max_tokens`, exact-answer prompts usually complete.

## 24k

Command shape tested:

```bash
--ctx-size 24576 \
--batch-size 1024 \
--ubatch-size 1024 \
--parallel 1
```

Startup was clean. VRAM at idle:

```text
14616 MiB used, 1223 MiB free
```

Results:

| Case | Prompt Tokens | Time | Result |
|---|---:|---:|---|
| short exact | 25 | `2.37s` | OK: `ALIVE-24K` |
| opencode large patch | 4,402 | `2.72s` | OK |
| JSON-only | 43 | `3.06s` | Bad behavior: all reasoning, empty content |
| long retrieval | 22,546 | `10.12s` | Fit, but max_tokens too low, all reasoning |
| near-limit final instruction | 21,037 | `8.56s` | OK: `READY-24576` |

24k looks safe with the current batch settings.

## 32k

All 32k variants started and passed the heavy tests.

Idle VRAM:

| Batch | VRAM Used | VRAM Free |
|---:|---:|---:|
| 1024 | 14790 MiB | 1049 MiB |
| 512 | 14616 MiB | 1223 MiB |
| 256 | 14660 MiB | 1179 MiB |

32k results:

| Batch | Case | Prompt Tokens | Time | Result |
|---:|---|---:|---:|---|
| 1024 | short exact | 25 | `1.52s` | OK |
| 1024 | opencode patch | 5,931 | `3.89s` | OK |
| 1024 | JSON-only | 43 | `5.57s` | empty content, reasoning only |
| 1024 | long retrieval | 30,051 | `14.48s` | OK: `color cerulean, code ACER-32K` |
| 1024 | near-limit final instruction | 30,842 | `12.25s` | OK: `READY-32768.` |
| 512 | long retrieval | 30,051 | `18.63s` | OK |
| 512 | near-limit final instruction | 30,842 | `15.44s` | OK |
| 256 | long retrieval | 30,051 | `23.75s` | OK |
| 256 | near-limit final instruction | 30,842 | `21.84s` | OK |

## Takeaway

I would now revise the earlier caution: 32k is not just "plausible"; it worked cleanly in these tests.

Best practical settings:

```bash
--ctx-size 32768 \
--batch-size 1024 \
--ubatch-size 1024 \
--parallel 1
```

That was the fastest 32k setting and still left about 1 GB VRAM free at idle. It is tight, but it passed the edge prompts.

More conservative 32k setting:

```bash
--ctx-size 32768 \
--batch-size 512 \
--ubatch-size 512 \
--parallel 1
```

This buys a little VRAM margin, but long prompt processing was about 25-30% slower in the synthetic tests.

I would not bother with `batch=256` unless you are chasing stability after seeing real OOMs. It was clearly slower and did not meaningfully improve idle VRAM over `512`.

The biggest non-context issue I found is the `reasoning_content` behavior: JSON-only and low-token exact-answer prompts can burn output tokens on hidden/structured reasoning and return empty `content`. For opencode-style usage and long retrieval, it mostly behaved fine as long as `max_tokens` was high enough.
