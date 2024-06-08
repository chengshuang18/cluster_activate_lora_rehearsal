# source /workspace/S/zhangyang/miniconda3/bin/activate cluster_lora
# conda info -e
# cd /lustre/S/zhangyang/chengshuang/CL/cluster_activate_lora

cluster=1024
cluster_constructure_method="sequential"
activation_combined=False
method="cluster_activate"

seeds=(42 1024 2048)
ini_thresholds=(0 0.66)

for seed in "${seeds[@]}"; do
  for ini_threshold in "${ini_thresholds[@]}"; do
    mkdir -p output/t5_large/cluster_activate/sequential/order_5/logs/${seed}
    echo "bash scripts/t5_large/cluster_activate/order_5.sh ${cluster} ${ini_threshold} ${cluster_constructure_method} ${activation_combined} ${seed} ${method} > output/t5_large/cluster_activate/sequential/order_5/logs/${seed}/train_and_infer_${ini_threshold}.log  2>&1"
    bash scripts/t5_large/cluster_activate/order_5.sh ${cluster} ${ini_threshold} ${cluster_constructure_method} ${activation_combined} ${seed} ${method} > output/t5_large/cluster_activate/sequential/order_5/logs/${seed}/train_and_infer_${ini_threshold}.log  2>&1

    mkdir -p output/t5_large/cluster_activate/sequential/order_6/logs/${seed}
    echo "bash scripts/t5_large/cluster_activate/order_6.sh ${cluster} ${ini_threshold} ${cluster_constructure_method} ${activation_combined} ${seed} ${method} > output/t5_large/cluster_activate/sequential/order_6/logs/${seed}/train_and_infer_${ini_threshold}.log  2>&1"
    bash scripts/t5_large/cluster_activate/order_6.sh ${cluster} ${ini_threshold} ${cluster_constructure_method} ${activation_combined} ${seed} ${method} > output/t5_large/cluster_activate/sequential/order_6/logs/${seed}/train_and_infer_${ini_threshold}.log  2>&1
  done
done
