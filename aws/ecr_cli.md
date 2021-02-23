---
title: 'ECR CLI commands'
---
ECR for Elastic Container Registry (_basically a private dockerhub)._

Log in to ECR
```bash
$ aws ecr get-login-password | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.eu-central-1.amazonaws.com
```

Pull image (same as dockerhub)
```bash
docker pull <aws_account_id>.dkr.ecr.eu-central-1.amazonaws.com/<image_name>:<tag>
```
