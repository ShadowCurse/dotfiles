#!/bin/bash
nvidia-settings -a "[gpu:0]/GPUGraphicsClockOffset[3]=50" -a "[gpu:0]/GPUMemoryTransferRateOffset[3]=1000" &
nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=60" 
