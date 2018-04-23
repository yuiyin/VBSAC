#! /bin/sh

rm *.o

for file in `find . -name "*.c"`
do
	echo $file
	infer run -- gcc -c $file
done