import re

def parse_dot_file(filename):
    """read Dot file and extract edges/nodes"""
    with open(filename, 'r') as f:
        content = f.read()
    
    # find nodes     
    nodes = re.findall(r'(\w+)\s*\[', content)
    
    # find Edges 
    edges = re.findall(r'(\w+)\s*->\s*(\w+)', content)
    
    return set(nodes), edges

cfg_nodes, cfg_edges = parse_dot_file('cfg_output.dot')
cdg_nodes, cdg_edges = parse_dot_file('cdg_output.dot')
cg_nodes, cg_edges = parse_dot_file('callgraph_output.dot')

print(f"CFG: {len(cfg_nodes)} nodes, {len(cfg_edges)} edges")
print(f"CDG: {len(cdg_nodes)} nodes, {len(cdg_edges)} edges")
print(f"Call Graph: {len(cg_nodes)} nodes, {len(cg_edges)} edges")

# CPG 
cpg_file = open('cpg_combined.dot', 'w')
cpg_file.write('digraph "CPG" {\n')

# CFG edges (black)
for src, dst in cfg_edges:
    cpg_file.write(f'{src} -> {dst} [color=black, label="CFG"];\n')

# CDG edges (green)
for src, dst in cdg_edges:
    cpg_file.write(f'{src} -> {dst} [color=green, label="CDG"];\n')

# Call Graph edges (blue)
for src, dst in cg_edges:
    cpg_file.write(f'{src} -> {dst} [color=blue, label="CG"];\n')

cpg_file.write('}\n')
cpg_file.close()

print("\n✅ CPG created: cpg_combined.dot")
