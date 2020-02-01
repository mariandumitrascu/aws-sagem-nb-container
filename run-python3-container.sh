#!/bin/bash

docker run -t --name=sagemaker-notebook-container && \
        -p 8888:8888 && \
        -e AWS_PROFILE=default && \
        -e JUPYTER_ENABLE_LAB=yes && \
        -e GRANT_SUDO=yes && \
        -v ~/.aws:/home/ec2-user/.aws:ro && \                                 # For AWS Credentials
        -v ~/.ssh:/home/ec2-user/.ssh:ro && \                                 # For Git Credentials
        -v /var/run/docker.sock:/var/run/docker.sock:ro && \                  # For Docker CLI
        -v /Users/marian.dumitrascu/Dropbox/Learn/AWS-ML-Certification/md-aws-ml-labs:/home/ec2-user/SageMaker && \     # For saving work in a host directory
        -v .:/home/ec2-user/SageMaker/sagemaker-notebook-container  && \      # For testing
        dataquadrant/sagemaker-notebook:all_python3
        

# Alternatively:
# docker-compose up sagemaker-notebook-container