# Quants Folder

This folder contains information on quantizations of the parent folder's
namesake model. Both currently downloaded and planned quants belong here.

## Conventions

### Name

Name each quant folder after the quantization or version suffix.

For this model and only this model, the suffix is everything after `-it-` and
before `.gguf` in the GGUF filename. The `.md` extension is always excluded from
the folder name.

Example:

```text
gemma-4-26B-A4B-it-UD-Q5_K_M.gguf -> UD-Q5_K_M
```

Use the same suffix in the model-level markdown file and the quant folder name.
Do not use shortened fragments like `4-26B-...`, full GGUF filenames, or other
variants where the quant needs to be identified quickly.

Use best judgment for exceptions, such as non-standard quant names, quant
identifiers that are not at the end of the filename, or names that are otherwise
out of order.

Names of non-folder files are not regulated, but they should still be
identifiable. For example, avoid names like `test-apr-11-model1.md`.

### Updating This Folder 

- Update every relevant .md starting with deepest, most specific, moving 'upwards' in file depth towards less specific. This keeps everything updated with least changes
- Update relevant .md's every time 
  - something is changed in the long term, such as... 
    - downloading new models, 
    - deciding 'no' on a model, etc.
    - information, especially judgements like "best performing model",
    - exciting new model catches attention and is added to planned
  - *not* for minutiae such as
    - current llama.cpp or llama-server context settings
    - removing a model from consideration / deciding not to test - this can wait. That is, it is not mandatory that .md's be updated
- stick to conventions where it makes sense, but this is not a codebase. It's going to be mostly documents. 
- do not commit or push changes to this .md without asking

### Where Stuff Goes

- files related to specific quantization of the parent folder's namesake model
  - go under quant-specific folder.
  - new folder can (or must) be made whenever new quant version is downloaded.
  - derivations of already-listed (has a folder) quants: disregard and make new folder for recently downloaded quant, same naming convention.
