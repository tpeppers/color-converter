#!/bin/sh

# To run with forever daemon do the following:
# npm install forever -g
# forever start -o out.log -e err.log --killTree --minUptime 1000 --spinSleepTime 1000 -c /bin/bash ./start.sh

# Currently using the Hailstone Agent from the host machine dev environment.
# What would be a better way of getting the Agent either into the image or referenced from the host machine?
# export NODE_PATH=~/vscode/hailstone/iast-dev/out/agent/nodejs

# These should be fine set at their default values.
# If we want a user to be able to set them, we could update the Jenkins Plugin so 
# they could be configured as necessary.
export IASTAGENT_LOGGING_STDERR_LEVEL=debug
export IASTAGENT_LOGGING_FILE_ENABLED=true
export IASTAGENT_LOGGING_FILE_PATHNAME=iastdebug.txt
export IASTAGENT_LOGGING_FILE_LEVEL=debug
export IASTAGENT_ANNOTATIONHANDLER_JSONFILE_ENABLED=true
export IASTAGENT_ANNOTATIONHANDLER_JSONFILE_PATHNAME=iastoutput.ndjson
export IASTAGENT_ANNOTATIONHANDLER_JSONFILE_LEVEL=info

# The BUILD_TAG comes from the Jenkins environment, however you can enable the following line
# if you want to run the script manually and mock a Jenkins build execution.
# export BUILD_TAG=jenkins-agent-server-test-pipeline-9000

node -r /agent_nodejs_linux64 app/server.js
