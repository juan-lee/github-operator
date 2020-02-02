#!/bin/bash

set -euo pipefail

dockerd-entrypoint.sh &

# TODO(juan-lee): figure out how to run with lower privileges.
export RUNNER_ALLOW_RUNASROOT=1

./config.sh --url "${GITHUB_URL}" --token "${GITHUB_TOKEN}" --name "${RUNNER_NAME}" --work "_work"

./run.sh
