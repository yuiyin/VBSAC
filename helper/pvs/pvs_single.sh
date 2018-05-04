#! /bin/sh

rm *.o
rm *.i *.log *.tasks

for NAME in `find . -name "*.c"`
do
	echo $NAME
	gcc -c $NAME -E -o $NAME.o.PVS-Studio.i
	gcc -c $NAME -O3 -o $NAME.o
	pvs-studio --cfg PVS-Studio.cfg --source-file $NAME --i-file $NAME.o.PVS-Studio.i --output-file $NAME.log
	gcc  $NAME.o
	plog-converter -a 'GA:1,2' -t tasklist $NAME.log -o $NAME.log.project.tasks
done

rm *.o *.i *.log
