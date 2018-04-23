#! /bin/sh

rm *.o

for file in `find . -name "*.c"`
do
	echo $file
	scan-build gcc -c $file
done