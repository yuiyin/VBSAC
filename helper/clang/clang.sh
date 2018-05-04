#! /bin/sh

echo "Using clang"

if ! [ -x "$(command -v clang)" ]; then
  echo 'Error: clang is not installed.' >&2
  exit 1
fi

clang --version
pwd

resultfile="clang_result.txt"
if [ -f "$resultfile" ]; then
  rm $file
fi
touch clang_result.txt

cd benchmark
pwd

echo "starting analysis using clang"
start=$(date +%s.%N) 

find . -name "*.o" | xargs rm

for file in `find . -name "*.c"`
do
	echo $file
	scan-build gcc -c $file |& tee -a ../$resultfile
done

find . -name "*.o" | xargs rm
end=$(date +%s.%N) 
start_s=$(echo $start | cut -d '.' -f 1)  
start_ns=$(echo $start | cut -d '.' -f 2)  
end_s=$(echo $end | cut -d '.' -f 1)  
end_ns=$(echo $end | cut -d '.' -f 2)  
time=$(( ( 10#$end_s - 10#$start_s ) * 1000 + ( 10#$end_ns / 1000000 - 10#$start_ns / 1000000 ) ))  
echo "Analysis Time: $time ms"  
echo "the result is saved in" $resultfile
