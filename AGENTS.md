# Agent Notes

Addition to existing AGENTS.md/system instructions; do not replace them.

If a lower-level AGENTS.md conflicts with this file, follow the lower-level rule
only for that conflict and only in its scope. Otherwise, keep using this file plus
the higher-level instructions.

This repo tracks Acer model-serving performance, hardware notes, model downloads,
quant notes, and benchmark observations. It is mainly documentation.

Guidance:

- Preserve user notes and rough intent.
- Fix obvious non-spelling errors when editing nearby text.
- Prefer clear, lightweight markdown.
- Avoid broad rewrites unless explicitly asked.
- Change at most one markdown heading section at a time unless approved.
- Do not commit or push unless explicitly asked.
- For model/quant naming conflicts, follow the closest applicable lower-level
  README or AGENTS.md.

Navigation outside the repo:

- Local LLMs live on `acer`; access with `tailscale ssh ai-admin@acer`.
- You *MUST* ask for Acer's sudo password if it is not in the session log.
- *NEVER* write the sudo password to any file outside chat/session.
- Lab navigation lives in `sysdir-v2`, on gdnovak's GitHub, the MacBook, and Acer.
  - Read it for lab navigation and usage instructions.
  - Update it only when asked with `update sysdir` or similar; skip minor changes.
