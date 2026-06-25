#!/bin/bash

# HDFS Basic Operations Demo Script

# Start Hadoop services (already running in your case, but good to have)
# start-dfs.sh
# start-yarn.sh

# Create HDFS directory
hdfs dfs -mkdir -p /demo

# Put file into HDFS
hdfs dfs -put sample.txt /demo

# List HDFS directory
echo "=== Listing /demo ==="
hdfs dfs -ls /demo

# Cat file from HDFS
echo "=== Content of /demo/sample.txt ==="
hdfs dfs -cat /demo/sample.txt

# Get file from HDFS to local
hdfs dfs -get /demo/sample.txt sample_downloaded.txt
echo "=== Downloaded file content ==="
cat sample_downloaded.txt

# Remove file from HDFS
hdfs dfs -rm /demo/sample.txt

# Remove directory from HDFS
hdfs dfs -rmdir /demo

echo "=== HDFS operations completed ==="
