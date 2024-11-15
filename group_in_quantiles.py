import sys
import pandas as pd

def main():
    if len(sys.argv) != 2:
        print("Usage: python group_in_quantiles.py <number_of_quantiles>")
        sys.exit(1)
    
    num_quantiles = int(sys.argv[1])
    
    numbers = [float(line.strip()) for line in sys.stdin if line.strip().isdigit()]
    
    if len(numbers) == 0:
        print("No valid numbers found.")
        sys.exit(1)
    
    df = pd.DataFrame(numbers, columns=["value"])
    
    df["quantile"], bins = pd.qcut(df["value"], q=num_quantiles, labels=[f'q{i+1}' for i in range(num_quantiles)], retbins=True)
    
    df["range"] = pd.cut(df["value"], bins=bins, include_lowest=True)
    
    for _, row in df.iterrows():
        print(f"{row['value']}\t{row['quantile']}\t{row['quantile']} {row['range']}")

if __name__ == "__main__":
    main()

