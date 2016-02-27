#
# Tools for interacting with Amazon Web Services.
#
# Specify credentials for the IAM user at run-time:
# $ docker run -e AWS_ACCESS_KEY_ID=foo \
#              -e AWS_SECRET_ACCESS_KEY=bar \
#              -e AWS_DEFAULT_REGION=eu-west-1 \
#              [this image] \
#              aws ec2 describe-instances
FROM alpine@sha256:0aa42fce99757089b277abe3698dca6325ed37281a65607b772aac2a8e72af29

MAINTAINER Henrik Jonsson <me@hkjn.me>

ENV USER user

# Install AWS CLI tools.
# Note: It would be nice to use python3 package here, but there's no
# python3-pip package in Alpine at time of writing.
RUN apk --no-cache add python py-pip && \
    pip install --upgrade pip && \
    pip install awscli && \
    adduser -D $USER

USER $USER
