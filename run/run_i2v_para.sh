#!/bin/bash
# SkyReelsModel: If using i2v, switch to Skywork/SkyReels-V1-Hunyuan-I2V.
# quant: Enable FP8 weight-only quantization
# offload: Enable offload model
# high_cpu_memory: Enable pinned memory to reduce the overhead of model offloading.
# gpu_num: Number of GPUs used.

# 检查是否传入了 CUDA 设备号
if [ -z "$1" ]; then
  # 如果没有传入，默认使用设备号 0
  CUDA_DEVICE=0
else
  # 如果传入了设备号，使用传入的值
  CUDA_DEVICE=$1
fi
# 设置 CUDA 可见设备
export CUDA_VISIBLE_DEVICES=$CUDA_DEVICE

# 计算 GPU_NUM
if [[ "$CUDA_DEVICE" =~ , ]]; then
  # 如果设备号中包含逗号，说明是多个设备
  GPU_NUM=$(echo "$CUDA_DEVICE" | awk -F, '{print NF}')
else
  # 如果设备号中没有逗号，说明是单个设备
  GPU_NUM=1
fi

# 设置 GPU_NUM 环境变量
export GPU_NUM=${GPU_NUM}

export SkyReelsModel="${MHOME}/Models/SkyReels-V1-I2V"
export HunyuanVideo="${MHOME}/Models/HunyuanVideo"
python3 video_generate.py \
    --model_id ${SkyReelsModel} \
    --guidance_scale 6.0 \
    --height 544 \
    --width 960 \
    --num_frames 49 \
    --prompt "FPS-24, A cat wearing sunglasses and working as a lifeguard at a pool" \
    --image "./assets/images/11.png" \
    --embedded_guidance_scale 1.0 \
    --quant \
    --offload \
    --high_cpu_memory \
    --gpu_num ${GPU_NUM} \
    --base_model_id ${HunyuanVideo}
