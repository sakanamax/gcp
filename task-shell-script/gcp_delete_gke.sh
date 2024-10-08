#!/bin/bash

# edit by sakana 2023/9/7
# 刪除 GKE cluster
# https://cloud.google.com/sdk/gcloud/reference/container/clusters/delete

echo ""
echo "刪除 GKE cluster"
echo ""


# 設定使用專案
echo ""
read -e -p "Please enter project name: " -i "sakana" project_name
echo ""

# 列出目前 Cluster
echo ""
echo "列出目前 Cluster"
echo ""
gcloud container clusters list --project $project_name
echo ""


# 設定 要刪除的Cluster 名稱
echo ""
echo "設定 要刪除的Cluster 名稱"
echo ""
read -e -p "Please enter cluster name: " -i "test-cluster" cluster_name
echo ""

# 設定 Location
echo ""
echo "設定 Location"
echo ""
read -e -p "Please enter Location: " -i "asia-east1" location_name
echo ""


# 刪除 GKE cluster
echo ""
echo "刪除 GKE clusterr"
echo "大概需要 5 - 10 分鐘刪除"
gcloud container clusters delete $cluster_name --location $location_name  --project $project_name
