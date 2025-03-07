#!/bin/bash

export SkyReelsModel="${MHOME}/Models/SkyReels-V1-I2V"
export HunyuanVideo="${MHOME}/Models/HunyuanVideo"
python3 video_generate.py \
    --model_id ${SkyReelsModel} \
    --task_type i2v \
    --guidance_scale 6.0 \
    --height 544 \
    --width 960 \
    --num_frames 49 \
    --prompt "FPS-24, A man is working with his boss, now his boss is talking with him in the office." \
    --image "./assets/images/11.png" \
    --embedded_guidance_scale 1.0 \
    --base_model_id ${HunyuanVideo}
