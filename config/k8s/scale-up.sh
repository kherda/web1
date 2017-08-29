#!/usr/bin/env bash

kubectl -s scale rc --replicas=6 k8s-php-test
