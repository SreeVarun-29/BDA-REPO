#!/usr/bin/env python3
import sys

product_sales = {}

for line in sys.stdin:
    line = line.strip()
    if not line:
        continue
    try:
        product, price = line.split('\t')
        price = float(price)
        if product in product_sales:
            product_sales[product] += price
        else:
            product_sales[product] = price
    except ValueError:
        continue

product_sales = sorted(product_sales.items(), key=lambda x: x[1], reverse=True)

print("TOP 5 PRODUCTS BY SALES:")
print("=" * 40)
for i, (product, sales) in enumerate(product_sales[:5], 1):
    print(f"{i}. {product}: ₹{sales:,.2f}")
