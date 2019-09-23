#! /bin/bash
git clone -b monolith https://github.com/express42/reddit.git /opt/app
cd /opt/app && bundle install
puma -d