---
title: 'S3 CLI commands'
---
View prefix (trailing slash is meaningful).
```bash
$ aws s3 ls "s3://<bucket>/<prefix>/"
```

Download entire prefix (the `recursive` bit).
```bash
$ aws s3 cp "s3://<bucket>/<prefix>/" ~/path/to/directory/ --recursive
```

Log in to ECR
```bash
$ aws ecr get-login-password | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.eu-central-1.amazonaws.com
```
