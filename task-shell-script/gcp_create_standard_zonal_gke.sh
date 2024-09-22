#!/bin/bash

# edit by sakana 2023/9/7
# 建立 GKE - Standard GKE cluster
# https://cloud.google.com/sdk/gcloud/reference/container/clusters/create

echo ""
echo "建立 GKE - Standard GKE cluster "
echo "預設使用 COS_CONTAINERD, 建立 Zonal Cluster  "
echo ""

# 設定使用專案
echo ""
read -e -p "Please enter project name: " -i "sakana" project_name
echo ""

# 設定 zone
echo ""
read -e -p "Please enter zone name: " -i "asia-east1-b" zone_name
echo ""

# 設定 Cluster 名稱
echo ""
read -e -p "Please enter cluster name: " -i "test-standard-cluster" cluster_name
echo ""

# 顯示目前可用 GKE 版本
echo ""
echo "顯示目前可用 GKE 版本"
echo ""
gcloud container get-server-config  --project $project_name --zone $zone_name --format json | jq '.channels'
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
read -e -p "Please enter GKE version: " -i "1.29" gke_version
echo ""

# 列出可用 machine type
echo ""
echo "列出可用 machine type"
echo ""
gcloud compute machine-types list --zones $zone_name --project $project_name
echo ""

# 設定 machine type
echo ""
echo "設定 machine type"
echo ""
read -e -p "Please enter machine type: " -i "n2-standard-2" machine_type
echo ""

# 設定 node 數量
echo ""
echo "設定 node 數量"
echo ""
read -e -p "Please enter node number: " -i "1" node_number
echo ""


# 建立 Standard GKE cluster
echo ""
echo "建立 Standard GKE cluster with Zonal Cluster"
echo "大概需要 5 - 10 分鐘建立"
gcloud container clusters create $cluster_name   --zone $zone_name --release-channel $release_channel_name --cluster-version $gke_version --machine-type $machine_type --num-nodes $node_number --project $project_name
echo ""

# 詢問是否要下載 GKE Credentials
echo ""
read -e -p "是否要下載 GKE Credentials? : " -i "no" get_credential
echo ""
[ $get_credential == yes ] && gcloud container clusters get-credentials $cluster_name --region $region_name --project $project_name
echo ""



