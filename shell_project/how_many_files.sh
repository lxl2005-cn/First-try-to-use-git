#!/bin/bash

# 脚本名称: how_many_files.sh
# 功能: 计算指定路径下的文件数量（非递归，不包含子目录）

# 检查是否提供了路径参数
if [ $# -ne 1 ]; then
    echo "错误: 请提供一个路径参数。"
    echo "用法: bash $0 <目录路径>"
    exit 1
fi

target_path="/home/lxl05/xflops"

# 检查提供的路径是否存在且是一个目录
if [ ! -d "$target_path" ]; then
    echo "错误: 路径 '$target_path' 不存在或不是一个目录。"
    exit 1
fi

# 计算该路径下的文件数量 (非递归)
# -maxdepth 1: 只搜索当前目录，不递归到子目录
# -type f: 只统计普通文件类型（不包括目录、链接等特殊文件）
file_count=$(find "$target_path" -maxdepth 1 -type f | wc -l)

# 输出结果
echo "路径 '$target_path' 下的文件数量为: $file_count"
