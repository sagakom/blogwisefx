#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e6b8acbed8499001439292b/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e6b8acbed8499001439292b
curl -s -X POST https://api.stackbit.com/project/5e6b8acbed8499001439292b/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e6b8acbed8499001439292b/webhook/build/publish > /dev/null
