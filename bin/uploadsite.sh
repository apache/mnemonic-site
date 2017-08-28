#!/usr/bin/env bash

#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if [ -z "${MNEMONIC_SITE_HOME}" ]; then
  export MNEMONIC_SITE_HOME="$(cd "$(dirname "$0")"/..; pwd)"
fi

continueprompt() {
    while true; do
        read -p "Do you wish to continue [y/n] ? " yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit 2;;
            * ) echo "Please answer yes or no.";;
            esac
        done
}

pushd "$MNEMONIC_SITE_HOME" || 
    { echo "the environment variable \$MNEMONIC_SITE_HOME contains invalid home directory of Mnemonic site project."; exit 11; }

[[ -n "$(git status --porcelain)" ]] &&
    echo "please commit all changes first." && exit 20

echo "Are you sure that the updated site has been generated to public folder ?"
continueprompt

git show-ref --quiet refs/heads/asf-site || git branch asf-site origin/asf-site

git worktree add site asf-site 2>&1 > /dev/null 
if [ $? -ne 0 ]; then
    echo "Purging the site folder..."
    rm -rf site/ 2>&1 > /dev/null
    git worktree prune
    git worktree add site asf-site ||
        { echo "Cannot create site folder, please remove the site folder first."; exit 22; }
fi

pushd site/

git reset origin/asf-site --hard

popd

rm -rf site/*

cp -r public/* site/ ||
    { echo "Failed to copy generated site"; exit 33; }

CMT=$(git log -1 --oneline)

pushd site/

git add .

git commit -m "${CMT}" ||
    { echo "Failed to commit generated site"; exit 44; }

git push
if [ $? -eq 0 ]; then
    echo "Please visit the following website to publish"
    echo "https://cms.apache.org/incubator/publish"
else
    echo "Failed to push generated site to upstream"
fi

popd

rm -rf site/
git worktree prune

popd


