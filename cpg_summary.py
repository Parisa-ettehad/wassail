import re

def parse_dot_file(filename):
    with open(filename, 'r') as f:
        content = f.read()
    
    nodes = re.findall(r'(\w+)\s*\[', content)
    edges = re.findall(r'(\w+)\s*->\s*(\w+)', content)
    
    return set(nodes), edges

# سه گراف رو بخون
cfg_nodes, cfg_edges = parse_dot_file('cfg_output.dot')
cdg_nodes, cdg_edges = parse_dot_file('cdg_output.dot')
cg_nodes, cg_edges = parse_dot_file('callgraph_output.dot')

print("=" * 60)
print("📊 CODE PROPERTY GRAPH (CPG) SUMMARY")
print("=" * 60)
print(f"\n🔹 Control Flow Graph (CFG):")
print(f"   - Nodes: {len(cfg_nodes)}")
print(f"   - Edges: {len(cfg_edges)}")
print(f"   - Color in CPG: BLACK")

print(f"\n🔹 Control-Dependency Graph (CDG):")
print(f"   - Nodes: {len(cdg_nodes)}")
print(f"   - Edges: {len(cdg_edges)}")
print(f"   - Color in CPG: GREEN")

print(f"\n🔹 Call Graph (CG):")
print(f"   - Nodes: {len(cg_nodes)}")
print(f"   - Edges: {len(cg_edges)}")
print(f"   - Color in CPG: BLUE")

total_nodes = len(cfg_nodes | cdg_nodes | cg_nodes)
total_edges = len(cfg_edges) + len(cdg_edges) + len(cg_edges)

print(f"\n📈 COMBINED CPG:")
print(f"   - Total Unique Nodes: {total_nodes}")
print(f"   - Total Edges: {total_edges}")
print(f"   - Files: cpg_combined.dot, cpg_combined.png")

print("\n✅ CPG ساخته شد با موفقیت!")
print("=" * 60)
