#! /bin/sh

echo "Using PVS-Studio"

if ! [ -x "$(command -v pvs-studio)" ]; then
  echo 'Error: pvs-studio is not installed.' >&2
  exit 1
fi

pvs-studio --version
pwd

find . -name "*.i" | xargs rm
find . -name "*.log" | xargs rm
find . -name "*.tasks" | xargs rm

resultfile="pvs-original"
if [ -d "$resultfile" ]; then
  rm -r $resultfile
fi

echo "copying cfg files"
cp pvs_single.sh PVS-Studio.cfg benchmark/itc/190/
cp pvs_single.sh PVS-Studio.cfg benchmark/itc/191/
cp pvs_single.sh PVS-Studio.cfg benchmark/itc/369/
cp pvs_single.sh PVS-Studio.cfg benchmark/itc/401/
cp pvs_single.sh PVS-Studio.cfg benchmark/itc/415/
cp pvs_single.sh PVS-Studio.cfg benchmark/itc/457/
cp pvs_single.sh PVS-Studio.cfg benchmark/itc/476/
cp pvs_single.sh PVS-Studio.cfg benchmark/Juliet_Test_Suite/190/
cp pvs_single.sh PVS-Studio.cfg benchmark/Juliet_Test_Suite/190/
cp pvs_single.sh PVS-Studio.cfg benchmark/Juliet_Test_Suite/191/
cp pvs_single.sh PVS-Studio.cfg benchmark/Juliet_Test_Suite/369/
cp pvs_single.sh PVS-Studio.cfg benchmark/Juliet_Test_Suite/401/
cp pvs_single.sh PVS-Studio.cfg benchmark/Juliet_Test_Suite/415/
cp pvs_single.sh PVS-Studio.cfg benchmark/Juliet_Test_Suite/416/
cp pvs_single.sh PVS-Studio.cfg benchmark/Juliet_Test_Suite/457/
cp pvs_single.sh PVS-Studio.cfg benchmark/Juliet_Test_Suite/476/

start=$(date +%s.%N) 

cd benchmark
pwd

echo "analyzing itc"
cd itc

cd 190
bash pvs_single.sh
cd ..

cd 191
bash pvs_single.sh
cd ..

cd 369
bash pvs_single.sh
cd ..

cd 401
bash pvs_single.sh
cd ..

cd 415
bash pvs_single.sh
cd ..

cd 457
bash pvs_single.sh
cd ..

cd 476
bash pvs_single.sh
cd ..

# open juliet
cd ../Juliet_Test_Suite

cd 190
bash pvs_single.sh
cd ..

cd 191
bash pvs_single.sh
cd ..

cd 369
bash pvs_single.sh
cd ..

cd 401
bash pvs_single.sh
cd ..

cd 415
bash pvs_single.sh
cd ..

cd 416
bash pvs_single.sh
cd ..

cd 457
bash pvs_single.sh
cd ..

cd 476
bash pvs_single.sh
cd ..

# back to VBSAC
cd ../..

end=$(date +%s.%N) 
start_s=$(echo $start | cut -d '.' -f 1)  
start_ns=$(echo $start | cut -d '.' -f 2)  
end_s=$(echo $end | cut -d '.' -f 1)  
end_ns=$(echo $end | cut -d '.' -f 2)  
time=$(( ( 10#$end_s - 10#$start_s ) * 1000 + ( 10#$end_ns / 1000000 - 10#$start_ns / 1000000 ) ))  
echo "Analysis Time: $time ms"  

find . -name "*.i" | xargs rm
find . -name "*.log" | xargs rm

mkdir pvs-original
find . -name "*.tasks" | xargs -i mv {} pvs-original/

python3 pvs_summary.py

echo "the result is saved in" pvs-original
