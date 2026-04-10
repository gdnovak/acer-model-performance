# Models Folder

This folder contains child folders with model-specific information. Deeper levels may
contain quant-specific or other similarly specific notes.

## Conventions

### Naming

#### Top-Level Folders

How to name top-level elements of `acer-model-performance/models/`:

- Name top-level folder after unique model name. This *is*
  - "Qwopus" (for models like https://huggingface.co/Jackrong/Qwopus3.5-27B-v3-FP8)
    - Qwen 3.5 has *a lot* of fine-tunings, quantizations, and derivatives.
    - Example: Qwopus3.5-27B-v3-x, Qwopus3.5-27B-v2-y, and Qwen3.5-27B...
      - could share parent folder named 'Qwen3.5' containing their model-specific folders
      - But, Qwopus3.5-27B-v3-x and Qwopus3.5-27B-v2-y should not have folder Qwen3.5 while OG model Qwen3.5-27B-it has another top-level folder called "Qwen3.5-27B-it". 
  - is *not*:
    - info irrelevant to identifying model. Exs: date, agent/harness, etc.
- Use common sense. This is not a codebase or systems-critical source of truth.
- If misdirected by names, suggest change to folder/file or convention. 
- Unique model name is *not*...
  - the name with no version or more specific identifiers unless *very* unique
  - ultra specific in the top-level. Ex: 'Qwen3.5-27B-UD-Q6_K_XL.gguf'
  - specific in ways unrelated to model such as 'fri-apr-10-qwen3.5'

**GOLDEN RULE: if two top-level folders names conflict or are so similar 
they are difficult to distinguish at first glance, they probably should 
be in a top-level parent folder named with the above conventions.**

[NOTE: above conventions way too big, please propose more concise definition(s) and condense it]

#### Non-Top-Level Folders

- must be...
  - more specific than top-level folder parent
  - descriptive of model(s) within
- need not be
  - as intentional as above. 
    - ex: 'Qwopus' is good enough for folder containing aforementioned 'qwopus3.5-27B' versions
      IFF Qwopus is a child folder of parent that implies necessary identifiers of children,
    - sub-ex:'Qwen3.5-27B' parent infers its child 'Qwopus' folder is version 3.5 size 27B.
    - ex: 'Qwen' does not identify child folders specifically enough to leave out version, size

[NOTE: add version and size to mandatory labels for top level folders in previous section]

#### All Other Naming

- be as creatively descriptive as possible. Use date/time stamps only when *very* relevant
- Again, cannot stress enough, this is not a codebase. It's nothing to spend serious time on

### Folder Structure

[insert guidelines based on gemma-4-26B-A4B folder and especially its README]
 
### Updating

[same as above, read models/gemma-4-26b-a4b/gemma-4-26b-a4b.md and base on that INCLUDING CREATION OF MODEL md FILE]


CONVENTION SECTION NEEDS MAJOR CLEAN UP BEFORE CONTINUING - CODEX
DO NOT MAKE SWEEPING CHANGES WITHOUT EXPLICIT INSTRUCTIONS TO DO SO. CHANGE AT MOST MARKDOWN HEADER SECTION
AT A TIME!
