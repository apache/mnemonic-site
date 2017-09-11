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

FROM ubuntu:16.04 
MAINTAINER Wen Tong (puresky7@gmail.com)

#set up your proxy below, refer to readme in the Docker folder
# ENV proxy_host "172.17.42.1"
# ENV proxy_port "8668"
#ENV proxy_host "172.17.42.1"
#ENV proxy_port "8668"

#ENV http_proxy "http://${proxy_host}:${proxy_port}"
#ENV https_proxy ${http_proxy}

#ENV HTTP_PROXY ${http_proxy}
#ENV HTTPS_PROXY ${http_proxy}
#ENV proxy ${http_proxy}

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get -y update && \
    apt-get install -y ruby-full ruby-dev git make gcc rubygems build-essential nodejs zlib1g-dev 

RUN gem install jekyll bundler nokogiri

RUN mkdir -p /ws && cd /ws && git clone https://git-wip-us.apache.org/repos/asf/incubator-mnemonic-site.git && \
    cd incubator-mnemonic-site && bundle install

ENV MNEMONIC_SITE_HOME /ws/incubator-mnemonic-site

WORKDIR /ws
CMD ["bash"]

