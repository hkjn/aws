#!/bin/bash
#
# Fetch "docker login" command for AWS EC2 Container Registry (ECR).
#
die() {
	echo "FATAL: $@" >&2
	exit 1
}
[ "$AWS_ACCESS_KEY_ID" ] || die "Missing AWS_ACCESS_KEY_ID"
[ "$AWS_SECRET_ACCESS_KEY" ] || die "Missing AWS_SECRET_ACCESS_KEY"
[ "$AWS_DEFAULT_REGION" ] || die "Missing AWS_DEFAULT_REGION"
IMAGE=${IMAGE:-"478220311237.dkr.ecr.us-east-1.amazonaws.com/hkjn/aws"}
docker run --rm -t -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
                   -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                   -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                   $IMAGE aws ecr get-login
