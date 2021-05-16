---
layout: page
title: Mnemonic Release Workflow
---

To release a new version of Mnemonic, please refer to following steps.

* 1.Get familiar with Apache [releasing process](https://infra.apache.org/release-publishing.html){:target="_blank"}

* 2.Verify the whole project.

* 3.Vote on preparing a release candidate.

* 4.(One time setup) Generate a [OpenPGP key](https://infra.apache.org/openpgp.html#generate-key){:target="_blank"} if the release manager has not yet got one.

* 5.(One time setup) Configure the deployment repositories of Maven and copy the following snippet to settings.xml under &lt;home folder&gt;/.m2/

    <code class="xml">
        &lt;settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 https://maven.apache.org/xsd/settings-1.0.0.xsd"&gt;
            &lt;profiles&gt;
                &lt;profile&gt;
                    &lt;id&gt;apache-release&lt;/id&gt;
                    &lt;properties&gt;
                        &lt;altSnapshotDeploymentRepository&gt;snapshots::default::file:///${env.HOME}/ws/maven-repository/snapshots&lt;/altSnapshotDeploymentRepository&gt;
                        &lt;altReleaseDeploymentRepository&gt;releases::default::file:///${env.HOME}/ws/maven-repository/releases&lt;/altReleaseDeploymentRepository&gt;
                    &lt;/properties&gt;
                &lt;/profile&gt;
            &lt;/profiles&gt;
        &lt;/settings&gt;
    </code>

* 6.Make sure the OpenJDK has been deployed in release machine.

* 7.Configure the signing key in git toolchain (see example below).

    ```
    $ git config --global user.signingkey <your gpg key id>
    ```
* 8.Use release.sh script to prepare a release candidate (see example below).
    
    ```
    $ tools/release.sh candidate 0.14.0 rc1 no
    ```
* 9.Make sure the tickets belong to current release that got marked in the field of fixed version.

* 10.Collect the change log of current version from [Apache JIRA](https://issues.apache.org/jira/projects/MNEMONIC/versions/)

* 11.Check in the generated release candidate artifacts to Apache stage repository, add to change log file, and update the key file with new generated key if not included.

* 12.Vote on the release candidate.

* 13.Check the latest candidate to Apache release repository as formal new version release.

* 14.Perform formal release in git (see example below).
    
    ```
    $ tools/release.sh bump 0.14.0 rc1 0.15.0
    ```

* 15.Announce the new release version with the link of release repository.

* 16.Update the download page in project website.