#!/bin/bash -ex
registry=caspru/site-php5
docker build -t $registry . && docker push $registry

