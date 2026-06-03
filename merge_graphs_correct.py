import re

def parse_dot_file(filename):
    with open(filename, 'r') as f:
        content = f.read()
    nodes = re.findall(r'(\w+)\s*\[', content)
    edges = re.findall(r'(\w+)\s*->\s*(\w+)', content)
    return set(nodes), edges

cfg_nodes, cfg_edges = parse_dot_file('cfg_output.dot')
cdg_nodes, cdg_edges = parse_dot_file('cdg_output.dot')
ddg_nodes, ddg_edges = parse_dot_file('ddg_output.dot')

print(f"CFG: {len(cfg_nodes)} nodes, {len(cfg_edges)} edges")
print(f"CDG: {len(cdg_nodes)} nodes, {len(cdg_edges)} edges")
print(f"DDG: {len(ddg_nodes)} nodes, {len(ddg_edges)} edges")

# CPG
with open('cpg_correct.dot', 'w') as f:
    f.write('digraph "CPG (CFG+CDG+DDG)" {\n')
    
    # CFG edges (black)
    for src, dst in cfg_edges:
        f.write(f'{src} -> {dst} [color=black, label="CFG"];\n')
    
    # CDG edges (green)
    for src, dst in cdg_edges:
        f.write(f'{src} -> {dst} [color=green, label="CDG"];\n')
    
    # DDG edges (red)
    for src, dst in ddg_edges:
        f.write(f'{src} -> {dst} [color=red, label="DDG"];\n')
    
    f.write('}\n')

print("\n✅ CPG created: cpg_correct.dot")
