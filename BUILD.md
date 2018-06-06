# Apache mnemonic docs site

This directory contains the code for the Apache mnemonic web site,
[mnemonic.apache.org](https://mnemonic.apache.org/).

## Setup

1. `git clone https://git-wip-us.apache.org/repos/asf/mnemonic.git -b asf-site target`
2. `sudo gem install bundler`
3. `sudo gem install github-pages jekyll`
4. `bundle install`

## Running locally

You can preview your contributions before opening a pull request by running from within the directory:

1. `bundle exec jekyll serve`

## Preparing for publish

1. `rm -rf public`
2. `bundle exec jekyll build`

## Publish to Apache website

1. commit all changes
2. `bin/uploadsite.sh`
3. push commits to upstream
