
import os

content = []
fileWrite = open("pvs-result.txt", 'w')

for file in os.listdir("./pvs"):
    if file.endswith(".tasks"):
        print(os.path.join("./pvs", file))

    fileRead = open(os.path.join("./pvs", file),'r')
    for x in fileRead.readlines():
    	if "www.viva64.com/en/w" in x:
    		continue
    	if "is always" in x:
    		continue
    	if "each other are identical" in x:
    		continue
    	if "Incorrect format" in x:
    		continue
    	if "is assigned but is not" in x:
    		continue
    	content.append(x)

fileWrite.writelines(content)
fileWrite.close()