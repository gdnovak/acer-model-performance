# Acer Model Performance

Benchmark and operational notes for local model performance on the Acer Nitro 60.

## Purpose

This repository is for tracking model-serving performance on the Acer machine.

Currently running main services are `llama-server` and `tailscale serve`.

## Hardware

### Acer Nitro 60

Specs:

| Field | Value |
| --- | --- |
| Official name | Acer Nitro 60 |
| Sold model | N60-641-UB22 |
| System product name | N60-641 |
| Hostname | `acer` |
| Motherboard | Gigabyte B760M C V3 |
| CPU | Intel Core i7-14700F |
| GPU | NVIDIA GeForce RTX 5070 Ti |
| VRAM | 16 GB GDDR7 |
| RAM | 32 GB DDR5, 2 x 16 GB |
| Storage | 2 TB NVMe SSD, AGI2T0G43AI818 |

RAM details:

- 4 total slots
- 2 populated slots
- 2 empty slots
- reported maximum capacity: 128 GB
- installed DIMMs: Kingston `KF560C30-16`, 16 GB each, DDR5 UDIMM, configured at
  4800 MT/s

### 2017 Razer Blade

TBD if relevant - may host auxiliary edge AIs, such as Gemma 4 E4B or similar.

- 2 x NVIDIA GTX 1060 with 6 GB VRAM each.
- 16 GB DDR4 RAM, I think.
- Outdated Intel i7.
