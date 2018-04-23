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
    if x == "\n":
        continue

    if x.endswith("ll]\n"):
        result.append(x)

    if flag and (not x.startswith("==================")):
        result.append(x)
        continue

    if x.startswith("==========") and (not flag):
        flag = True
        continue

    if x.startswith("=========") and flag:
        flag = False
        result.append("\n\n")



for item in result:
  output.write("%s" % item)
output.close()
