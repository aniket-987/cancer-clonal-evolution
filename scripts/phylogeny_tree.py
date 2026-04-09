def print_evolution_tree():
    tree = """
    Founder Clone (VAF ~50%)
    │
    ├── Subclone A (chr7 Gain) -> Relapse Specific
    │   └── Resistant Clone A1 (TP53 mutation)
    │
    └── Subclone B (chr17 Del) -> Treatment Sensitive (Extinct)
    """
    print(tree)

if __name__ == "__main__":
    print_evolution_tree()