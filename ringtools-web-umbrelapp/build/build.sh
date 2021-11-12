#!/bin/sh

git clone git@github.com:dsbaars/srrof-lnd-pubsub-python.git
git clone https://github.com/dsbaars/srrof-ringtools-web.git

docker build -t umbrel-ringtools-web .
