you can run it by doing the following:

```
cd terragrunt/env/staging
terragrunt run-all init
terragrunt run-all plan
terragrunt run-all apply
```

alternatively you can also choose to execute only one module (in this case it’s the same as above since there’s only one module anyway):

```
cd terragrunt/env/staging/bucket
terragrunt init
terragrunt plan
terragrunt apply
```