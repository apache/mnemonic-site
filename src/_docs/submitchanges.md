---
layout: docs
title: Submit Changes
permalink: /docs/submitchanges.html
---


After [Development Setup](devsetup.html), you can follow the steps below to submit your code/comments and document changes.

***

* Step 1 - Sync your forked Mnemonic project from upstream. <I>[Show Me How](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/syncing-a-fork){:target="_blank"}</I>

  **<I> Please keep the master branch untouched, otherwise we can't keep it exactly synced. </I>**

```bash
  $ git fetch upstream
  $ git checkout master
  $ git merge upstream/master
  $ git push
```

* Step 2 - Take over an interested issue/task by clicking the “Start Progress” button in the Apache issue web portal. <I>[Project Issue Portal](https://issues.apache.org/jira/projects/MNEMONIC/){:target="_blank"}</I>

* Step 3 - Create a new branch for your selected issue/task.

```bash
  $ git checkout master
  $ git checkout -b issue-[issue id]
```

* Step 4 - Apply patch files if any.

```bash
  $ git apply [patch file]
```

* Step 5 - Fix/implement the selected issue/task on the specific branch.Please ensure you are working on the create branch, e.g. issue-548, using the following command to confirm it

```bash
  $ git status
```

* Step 6 - Stage your new code or code changes before stopping work on it.

```bash
  $ git add [your changed/new files]
```

* Step 7 - Rebase your local works from upstream if it takes a long time. Commit your bugfix or feature code once the issue/task got addressed. Stage all your changed/new files first, please refer to step 6 above. If any conflict occurred, please refer to the <I>[following way to resolve it.](https://docs.github.com/en/free-pro-team@latest/github/using-git/resolving-merge-conflicts-after-a-git-rebase){:target="_blank"}</I>

```bash
  $ git commit -s -m “MNEMONIC-[issue id]: [issue description]”
  $ git rebase upstream/master
```

* Step 8 - Verify your code changes again

```bash
  $ git diff HEAD^…
```

* Step 9 - Push your new branch and commit to your own github repo.

```bash
  $ git push --set-upstream origin issue-XXX
```

* Step 10 - Submit a PR. Visit the Mnemonic repo. in your own Github account, you can see a message about the new/changed branch, you can submit the PR via click the link in the message. <I>[Show Me How](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request){:target="_blank"}</I> 

* Step 11 - Once PR got submitted, Please click “Resolve Issue” button in <I>[Apache issue web portal.](https://confluence.atlassian.com/adminjiraserver/working-with-workflows-938847362.html){:target="_blank"}</I>.

* Step 12 - Normally, wait for 2-5 calendar days for reviewers to take comments on the PR. Address all comments as possible. Once the PR got verified by reviewers, Please click “Close Issue” button in Apache issue web portal.