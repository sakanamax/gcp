#!/bin/bash

# edit by sakana 2023/4/5
# 建立 GKE - Autopilot GKE cluster
# https://cloud.google.com/sdk/gcloud/reference/container/clusters/create-auto

echo ""
echo "建立 GKE - Autopilot GKE cluster"
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

# 顯示目前可用 GKE 版本
echo ""
echo "顯示目前可用 GKE 版本"
echo ""
gcloud container get-server-config  --project $project_name --format json | jq '.channels'
echo ""

# 設定 Release Channel
echo ""
echo "設定 Release Channel"
echo ""
read -e -p "Please enter Release Channel: " -i "regular" release_channel_name
echo ""

# 設定 GKE 版本
echo ""
echo "設定 GKE 版本"
echo ""
read -e -p "Please enter GKE version: " -i "1.28" gke_version
echo ""

# 建立 Autopilot GKE cluster
echo ""
echo "建立 Autopilot GKE cluster"
echo "大概需要 5 - 10 分鐘建立"
gcloud container clusters create-auto $cluster_name   --region $region_name --release-channel $release_channel_name --cluster-version $gke_version --project $project_name
echo ""

# 詢問是否要下載 GKE Credentials
echo ""
read -e -p "是否要下載 GKE Credentials? : " -i "no" get_credential
echo ""
[ $get_credential == yes ] && gcloud container clusters get-credentials $cluster_name --region $region_name --project $project_name
echo ""



