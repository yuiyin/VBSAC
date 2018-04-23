#!/usr/bin/python3
import sys

path = str(sys.argv[1])
output = open(sys.argv[2], 'w')
print(path)

with open(path) as f:
    content = f.readlines()

print(len(content))

flag = False
result = []
for x in content:

    if x.startswith("./") and (not ("never read" in x)):
        if x.endswith("c\n"):
            continue
        result.append(x)

for item in result:
  output.write("%s" % item)
output.close()
