#! /bin/sh

echo "compile c to ll"

for file in `find . -name "*.c"`
do
	echo $file
	clang -S -g -emit-llvm $file
done
