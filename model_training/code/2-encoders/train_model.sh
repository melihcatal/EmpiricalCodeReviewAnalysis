#!/usr/bin/env bash
onmt-main --model custom_2encoders_transformer.py --gpu_allow_growth --config data.yml --auto_config train --with_eval  --num_gpus 8