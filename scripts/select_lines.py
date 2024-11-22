import sys

def load_patterns(file_path):
    """Load patterns from the given file into a set."""
    with open(file_path, 'r') as file:
        patterns = set(line.strip() for line in file)
    return patterns

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python select_lines.py <query_file>")
        sys.exit(1)

    query_file = sys.argv[1]
    patterns = load_patterns(query_file)
    
    for pattern in patterns:
        print(pattern)

