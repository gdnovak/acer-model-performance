# Agent Notes

Addition to existing AGENTS.md/system instructions; do not replace them with these
instructions.

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

Navigation outside of repo:

- Local LLMs are stored on host 'acer' which is accessed with 'tailscale ssh ai-admin@acer' 
- You *MUST* ask for acer's sudo password if not in session log 
- *NEVER* write sudo password to file outside of chat/session.
- Repo on gdnovak's github (owner of all machines we will use), the macbook, and the acer called sysdir-v2.
  - Read for instructions for using or navigating the lab. 
  - Keep it updated according to its convention - unnecessary for minor changes. User will say 'update sysdir' or similar.
