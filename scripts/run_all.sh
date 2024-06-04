source /workspace/S/zhangyang/miniconda3/bin/activate cluster_lora
conda info -e
cd /lustre/S/zhangyang/chengshuang/CL/cluster_activate_lora
export NCCL_DEBUG=INFO

# echo "bash scripts/run_order4.sh"
# bash scripts/run_order4.sh

echo "bash scripts/run_order5.sh"
bash scripts/run_order5.sh

echo "bash scripts/run_order6.sh"
bash scripts/run_order6.sh

