#!/bin/sh

CLI_PATH=../bin/rundeck-cli-1.1.7-all.jar
PROJECT_NAME=TestProject1

java -jar $CLI_PATH projects create -p $PROJECT_NAME --file project.properties --format properties
