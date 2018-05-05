#! /bin/sh

echo "Using VBSAC_ptr"

cd VBSAC_tool/engine-3.0
pwd

echo "starting analysis using VBSAC_ptr"

resultfile="vbsac_ptr_result.txt"
if [ -f "$resultfile" ]; then
  rm $file
fi
touch vbsac_ptr_result.txt

start=$(date +%s.%N) 

for file in `find ../../benchmark_ptr -name "*.ll"`
do
	echo $file
	# echo $file > $resultfile
	bin/engine -config ptr_config/ap.top $file |& tee -a ../../$resultfile
done

end=$(date +%s.%N) 
start_s=$(echo $start | cut -d '.' -f 1)  
start_ns=$(echo $start | cut -d '.' -f 2)  
end_s=$(echo $end | cut -d '.' -f 1)  
end_ns=$(echo $end | cut -d '.' -f 2)  
time=$(( ( 10#$end_s - 10#$start_s ) * 1000 + ( 10#$end_ns / 1000000 - 10#$start_ns / 1000000 ) ))  
echo "Analysis Time: $time ms"  

rm -r output
cd ../..
echo "the result is saved in" $resultfile
