#!/bin/bash -e

curl https://storage.googleapis.com/golang/go<%= @version %>.linux-amd64.tar.gz > go<%= @version %>.linux-amd64.tar.gz
tar xzf go<%= @version %>.linux-amd64.tar.gz
rm -rf /usr/local/go
mv go /usr/local/
