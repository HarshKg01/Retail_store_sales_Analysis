import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv(r"C:\Users\KIIT0001\Desktop\Retail_Sales_Project\sales_data.csv")

print("\n--- FIRST 5 ROWS ---")
print(df.head())

print("\n--- DATA INFO ---")
df.info()

print("\n--- DATA DESCRIPTION ---")
print(df.describe())

# Create Total Sales column
df['total_sales'] = df['quantity'] * df['price']

# Convert date column
df['order_date'] = pd.to_datetime(df['order_date'], dayfirst=True)

# Total Revenue
print("\nTotal Revenue:", df['total_sales'].sum())

# Top Selling Product
top_product = df.groupby('product')['quantity'].sum().idxmax()
print("\nTop Selling Product:", top_product)

# City-wise Sales
print("\nCity-wise Sales:")
print(df.groupby('city')['total_sales'].sum())

# Category-wise Sales
print("\nCategory-wise Sales:")
print(df.groupby('category')['total_sales'].sum())

# Highest Value Order
print("\nHighest Value Order:")
print(df.loc[df['total_sales'].idxmax()])

# 1. BAR CHART → Product vs Total Sales
plt.figure(figsize=(8,5))
df.groupby('product')['total_sales'].sum().plot(kind='bar')
plt.title("Product vs Total Sales")
plt.xlabel("Product")
plt.ylabel("Total Sales")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

# 2. PIE CHART → Category Distribution
plt.figure(figsize=(6,6))
df.groupby('category')['total_sales'].sum().plot(
    kind='pie', autopct='%1.1f%%'
)
plt.title("Category-wise Sales Distribution")
plt.ylabel("")
plt.tight_layout()
plt.show()

# 3. LINE CHART → Sales Trend Over Time
plt.figure(figsize=(8,5))
df.groupby('order_date')['total_sales'].sum().plot(kind='line')
plt.title("Sales Trend Over Time")
plt.xlabel("Date")
plt.ylabel("Total Sales")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
