#! /bin/sh

echo "Using cppcheck"

if ! [ -x "$(command -v cppcheck)" ]; then
  echo 'Error: cppcheck is not installed.' >&2
  exit 1
fi

cppcheck --version

pwd
cd benchmark
pwd

echo "starting analysis using cppcheck"
start=$(date +%s.%N) 
cppcheck . |& tee ../cppcheck_result.txt
end=$(date +%s.%N) 
start_s=$(echo $start | cut -d '.' -f 1)  
start_ns=$(echo $start | cut -d '.' -f 2)  
end_s=$(echo $end | cut -d '.' -f 1)  
end_ns=$(echo $end | cut -d '.' -f 2)  
time=$(( ( 10#$end_s - 10#$start_s ) * 1000 + ( 10#$end_ns / 1000000 - 10#$start_ns / 1000000 ) ))  
echo "Analysis Time: $time ms"  
echo "the result is saved in cppcheck_result.txt"
