#!/bin/bash

echo "=========================================="
echo "SALES DATA - TOP PRODUCTS"
echo "=========================================="

chmod +x mapper_top_products.py
chmod +x reducer_top_products.py
chmod +x mapper_city_products.py
chmod +x reducer_city_products.py

hdfs dfs -mkdir -p /user/$USER/sales_products/input
hdfs dfs -put sales_products_large.txt /user/$USER/sales_products/input/

hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
    -input /user/$USER/sales_products/input/sales_products_large.txt \
    -output /user/$USER/sales_products/output \
    -mapper "python3 mapper_top_products.py" \
    -reducer "python3 reducer_top_products.py" \
    -file mapper_top_products.py \
    -file reducer_top_products.py

echo -e "\n--- TOP PRODUCTS ---"
hdfs dfs -cat /user/$USER/sales_products/output/part-00000

echo -e "\n=========================================="
echo "SALES DATA - TOP PRODUCT PER CITY"
echo "=========================================="

hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
    -input /user/$USER/sales_products/input/sales_products_large.txt \
    -output /user/$USER/sales_products/output_city \
    -mapper "python3 mapper_city_products.py" \
    -reducer "python3 reducer_city_products.py" \
    -file mapper_city_products.py \
    -file reducer_city_products.py

echo -e "\n--- TOP PRODUCT PER CITY ---"
hdfs dfs -cat /user/$USER/sales_products/output_city/part-00000

echo -e "\n\nDone!"
