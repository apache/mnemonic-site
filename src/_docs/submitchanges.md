---
layout: docs
title: Submit Changes
permalink: /docs/submitchanges.html
---

After [Development Setup](devsetup.html), you can follow the steps below to
submit your code/comments and document changes.

* Make sure the changes are linked to your [Apache JIRA](https://issues.apache.org/jira/projects/MNEMONIC){:target="_blank"} ticket
* Review your changes according to the JIRA ticket in question
* Building project in the Docker container
```bash
  ## for Docker container
  # cd /ws/mnemonic
  # mvn clean install
```
* Resolve any problems found by building process
* Run your test cases specific to your changes, please refer to bin/test.conf
* Resolve any problems found by your test cases
* Add your test cases to *bin/test.conf*
* Commit the changes to your local repository in IDE<br/>
  for Intellij IDEA, please refer to [Committing Changes to a Local Git Repository](https://www.jetbrains.com/help/idea/commit-and-push-changes.html#commit){:target="_blank"}<br/>
  Please use JIRA id and title to fill up the comment of commit<br/>
  for example
```bash
  ## for host
  # git commit -m "MNEMONIC-301: Improve the documentation of architecture page"
```
* Run all test cases if your changes could impact existing functionalities<br/>
Note: Please make sure enough available space for test data generation (>30G)
```bash
  ## for Docker container
  # cd /ws/mnemonic
  # bin/runall.sh
```
* Resolve any problems found by test cases and then **amend** your previous commit in IDE<br/>
  for Intellij IDEA, please refer to [Committing Changes to a Local Git Repository](https://www.jetbrains.com/help/idea/commit-and-push-changes.html#commit){:target="_blank"}
```bash
  ## for host
  # git commit --amend
```
* Make sure there is only 1 local commit for each JIRA ticket, otherwise please squash them into one
* Rebase your codebase before pushing local commits to your remote repository
  1. fetch update from remote [Fetching Changes](https://www.jetbrains.com/help/idea/sync-with-a-remote-repository.html#fetch){:target="_blank"}
  ```bash
    ## for host
    # git fetch -a
  ```
  2. Rebase your changes onto upstream/master [Rebasing Branches](https://www.jetbrains.com/help/idea/apply-changes-from-one-branch-to-another.html#rebase-branch){:target="_blank"}
  ```bash
    ## for host
    # git rebase upstream/master
  ```
* Push local commits to your remote repository [Pushing Changes](https://www.jetbrains.com/help/idea/commit-and-push-changes.html#push){:target="_blank"}
```bash
  ## for host
  # git push origin
  ## NOTE: use force push if your amended commit has already been pushed
``` 
* Create a PR in Github [Creating a pull request](https://help.github.com/articles/creating-a-pull-request/){:target="_blank"}
* Fix any issues come from community review
* Change the JIRA ticket status to RESOLVED if the button exists
