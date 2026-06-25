#!/bin/bash
# Start Hadoop services

hdfs namenode -format
start-dfs.sh
start-yarn.sh
jps
