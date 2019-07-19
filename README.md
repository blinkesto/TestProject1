# TestProject1

# Rundeck



## CLI 
Download the CLI from (https://github.com/rundeck/rundeck-cli/releases)

 
## Projects

### Create Empty Project From Template
```bash
java -jar bin/rundeck-cli-1.1.7-all.jar projects create -p TestProject2 --file project.properties --format properties

# Setup SCM
java -jar bin/rundeck-cli-1.1.7-all.jar projects scm setup --integration import --project TestProject2 --file TestProject1SCM.json --type git-import



```

### Export project
```bash
# main
java -jar rundeck-cli-1.1.7-all.jar projects configure get -p AnsibleTest > AnsibleTest.properties

# scm
java -jar bin/rundeck-cli-1.1.7-all.jar projects scm config --integration import --project AnsibleTest --file AnsibleTestSCM.json

```

### Import project
```bash
# main
java -jar rundeck-cli-1.1.7-all.jar projects configure set --file AnsibleTest.prop --format properties --project AnsibleTest

# scm
java -jar bin/rundeck-cli-1.1.7-all.jar projects scm setup --integration import --project TestProject1 --file TestProject1SCM.json --type git-import
```

### Delete 
```bash
java -jar rundeck-cli-1.1.7-all.jar projects delete --confirm --project AnsibleTest
```


## Jobs

### Export 
```bash
 java -jar bin/rundeck-cli-1.1.7-all.jar jobs list  -p TestProject1 --file run_test.yaml --format yaml --jobxact Run

```


### Import
```bash
# Either

# Load the job
java -jar rundeck-cli-1.1.7-all.jar jobs load -p AnsibleTest --duplicate update --file AnsibleTestJobs.yml  --format yaml

# Invoke import-jobs action from cli (DOES NOT WORK - https://github.com/rundeck/rundeck/issues/5064)
java -jar  bin/rundeck-cli-1.1.7-all.jar projects scm  perform --integration import --action import-jobs --allitems --project TestProject1 


# SCM is setup to automatically import (DOES NOT WORK - https://github.com/rundeck/rundeck/issues/4331)


```

## Actions
import-jobs
