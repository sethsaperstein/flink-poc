#!/bin/bash

set -e

S3_BUCKET_NAME=sandbox-seth-test
S3_KEY=flink-poc-0.1.jar
S3_VERSION=8kCE9F.oRVc9mtUSPCUPu2iCmrBZ2kOJ

echo "Start my initialization script..."

echo "Installing packages..."
apt-get update
apt-get install -y zip unzip sudo
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo "Downloading user jar file..."
mkdir ${FLINK_HOME}/app
echo "aws s3api get-object --bucket ${S3_BUCKET_NAME} --key ${S3_KEY} --version-id ${S3_VERSION} ${FLINK_HOME}/app/flink-app.jar"
aws s3api get-object --bucket ${S3_BUCKET_NAME} --key ${S3_KEY} --version-id ${S3_VERSION} ${FLINK_HOME}/app/flink-app.jar

sleep 600
#exec /docker-entrypoint.sh "$@"
