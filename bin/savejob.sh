#!/bin/sh

# Downloads a job and pushes it to git

if echo "$PWD" | grep -q "/bin$"; then
  cd ..
  PROJECT_PATH=$PWD
else
  PROJECT_PATH=$PWD
fi

# echo $PROJECT_PATH

JOB=$1
java -jar $PROJECT_PATH/bin/rundeck-cli-1.1.7-all.jar jobs list  -p TestProject1 --file $PROJECT_PATH/jobs/$JOB.yaml --format yaml --jobxact $JOB

if [ $? -eq 0 ]; then
    git commit $PROJECT_PATH/jobs/$JOB.yaml -m "Save $JOB"
    git push
fi
