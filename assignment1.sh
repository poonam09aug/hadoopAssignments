 #!/bin/bash          
# delete if exist
rm -rf project1Source
# create a fresh dir
mkdir project1Source
# loop for generating each file
 for i in $(seq 1 10000)
 do
   fileName="file"$i".txt"
  touch "project1Source/$fileName"
   # loop for generating each line
   for j in $(seq 1 2000);
   do
        row1=""
                # loop for generating each column
                for k in $(seq 1 50)
                do
                        row1="$row1,abc"$k
                        #echo $row1
                done
        #echo "/project1Source/$fileName"
echo $row1>>"project1Source/$fileName"
done
done
hadoop fs -mkdir /user/sharma1/project1Destination
hadoop fs -put project1Source/file*.txt /user/sharma1/project1Destination

echo "file  moved from local to hadoop fs"
