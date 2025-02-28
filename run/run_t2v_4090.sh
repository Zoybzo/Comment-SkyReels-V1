#!/bin/bash
# SkyReelsModel: If using i2v, switch to Skywork/SkyReels-V1-Hunyuan-I2V.
# quant: Enable FP8 weight-only quantization
# offload: Enable offload model
# high_cpu_memory: Enable pinned memory to reduce the overhead of model offloading.
# parameters_level: Further reduce GPU VRAM usage.
# task_type:The task type is designated to support both t2v and i2v. For the execution of an i2v task, it is necessary to input --image.
export SkyReelsModel="Skywork/SkyReels-V1-Hunyuan-T2V"
python3 video_generate.py \
    --model_id ${SkyReelsModel} \
    --task_type t2v \
    --guidance_scale 6.0 \
    --height 544 \
    --width 960 \
    --num_frames 97 \
    --prompt "FPS-24, A cat wearing sunglasses and working as a lifeguard at a pool" \
    --embedded_guidance_scale 1.0 \
    --quant \
    --offload \
    --high_cpu_memory \
    --parameters_level
