#! /bin/sh

echo "Using infer"

if ! [ -x "$(command -v infer)" ]; then
  echo 'Error: infer is not installed.' >&2
  exit 1
fi

infer --version
pwd

resultfile="infer_result.txt"
if [ -f "$resultfile" ]; then
  rm $file
fi
touch infer_result.txt

cd benchmark_ptr
pwd

echo "starting analysis using infer"
start=$(date +%s.%N) 

find . -name "*.o" | xargs rm

for file in `find . -name "*.c"`
do
	echo $file
	infer run -- gcc -c $file |& tee -a ../$resultfile
done

find . -name "*.o" | xargs rm
rm -r benchmark_ptr/infer-out
end=$(date +%s.%N) 
start_s=$(echo $start | cut -d '.' -f 1)  
start_ns=$(echo $start | cut -d '.' -f 2)  
end_s=$(echo $end | cut -d '.' -f 1)  
end_ns=$(echo $end | cut -d '.' -f 2)  
time=$(( ( 10#$end_s - 10#$start_s ) * 1000 + ( 10#$end_ns / 1000000 - 10#$start_ns / 1000000 ) ))  
echo "Analysis Time: $time ms"  
echo "the result is saved in" $resultfile
