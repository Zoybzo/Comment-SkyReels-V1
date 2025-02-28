#!/bin/bash

SkyReelsModel = "Skywork/SkyReels-V1-Hunyuan-T2V"
python3 video_generate.py \
    --model_id ${SkyReelsModel} \
    --task_type t2v \
    --guidance_scale 6.0 \
    --height 544 \
    --width 960 \
    --num_frames 97 \
    --prompt "FPS-24, A cat wearing sunglasses and working as a lifeguard at a pool" \
    --embedded_guidance_scale 1.0
