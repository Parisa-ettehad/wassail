import re
import json

with open('cpg_combined.dot', 'r') as f:
    content = f.read()

nodes = re.findall(r'(\w+)\s*\[', content)
edges = re.findall(r'(\w+)\s*->\s*(\w+)\s*\[([^\]]*)\]', content)

cpg = {
    "nodes": list(set(nodes)),
    "edges": [{"from": src, "to": dst, "attrs": attr} for src, dst, attr in edges]
}

with open('cpg_combined.json', 'w') as f:
    json.dump(cpg, f, indent=2)

print("✅ CPG JSON ساخته شد: cpg_combined.json")
