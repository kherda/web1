#!/usr/bin/env bash

kubectl rolling-update --update-period="15s" k8s-php-test --image=bitgandtter/k8s_php_test:latest
