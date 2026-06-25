#!/bin/bash

echo "=========================================="
echo "  Hadoop WordCount Experiment"
echo "=========================================="

# Step 1: Create HDFS input directory
echo "[1/5] Creating HDFS input directory..."
hdfs dfs -mkdir -p /input

# Step 2: Upload file to HDFS
echo "[2/5] Uploading sample.txt to HDFS..."
hdfs dfs -put -f sample.txt /input

# Step 3: Verify upload
echo "[3/5] Verifying HDFS input..."
hdfs dfs -ls /input
hdfs dfs -cat /input/sample.txt

# Step 4: Run WordCount MapReduce job
echo "[4/5] Running WordCount MapReduce job..."
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar wordcount /input /output

# Step 5: View results
echo "[5/5] Viewing WordCount output..."
hdfs dfs -cat /output/part-r-00000

echo "=========================================="
echo "  WordCount Experiment Complete!"
echo "=========================================="
