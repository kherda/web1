#!/usr/bin/env bash

kubectl -s scale rc --replicas=1 k8s-php-test
