#!/bin/bash

# edit by sakana 2023/4/5
# 刪除 GKE cluster
# https://cloud.google.com/sdk/gcloud/reference/container/clusters/delete

echo ""
echo "刪除 GKE cluster"
echo ""

# 設定 Region
echo ""
read -e -p "Please enter Region name: " -i "asia-east1" region_name
echo ""

# 設定使用專案
echo ""
read -e -p "Please enter project name: " -i "sakana" project_name
echo ""

# 設定 Cluster 名稱
echo ""
read -e -p "Please enter cluster name: " -i "test-cluster" cluster_name
echo ""

# 刪除 GKE cluster
echo ""
echo "刪除 GKE clusterr"
echo "大概需要 5 - 10 分鐘建立"
gcloud container clusters delete $cluster_name   --region $region_name --project $project_name
