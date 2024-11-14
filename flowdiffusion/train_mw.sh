CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 accelerate launch  --config_file accerlate_config.yaml train_mw.py \
--batch_size 6 \
-c 22