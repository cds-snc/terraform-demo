<p align="center">
  <h1 align="center">💻 Terraform Demo</h1>
  <p align="center">
  &middot;
    <a href="https://github.com/cds-snc/terraform-demo"><strong>Resources and Accessibility</strong></a>
  &middot;
    <a href="https://github.com/cds-snc/terraform-demo"><strong>Terraform Boilerplate</strong></a>
  &middot;
  </p>
</p>

# Resources and Accessibility
> We are committed to providing learning resources that are accessible to all. If you see a resource that is not compliant, please let us know at ashar.ahmed@cds-snc.ca.

<a href="https://docs.google.com/presentation/d/1fAJBXQuxhNtrjaaIYOSN2YDJl92bhPgyf4VKySnzDIk/edit#slide=id.gfa3975480b_0_3">Slides</a>

<a href="https://learn.hashicorp.com/tutorials/terraform/">HashiCorp Learn</a>

<a href="https://learn.acloud.guru/">A Cloud Guru</a>

# Terraform Boilerplate 

## Tools Needed

- A scratch AWS account 
- AWS CLI (install using <a href="https://formulae.brew.sh/formula/awscli">Homebrew on macOS</a>)
- Terraform (install using <a href="https://learn.hashicorp.com/tutorials/terraform/install-cli">Brew Cask</a>)
- <a href="https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest">s3-bucket</a> Terraform module



## How to set it up

After you have a scratch AWS account setup, the first step to getting started with Terraform is to use the AWS module within Terraform to create an S3 bucket.

Once this bucket is created, we can create a DynamoDB table and use this DynamoDB table instance to 'lock state' to prevent state corruption.

Continue...



## Integrating Terragrunt and future

<a href="https://terragrunt.gruntwork.io/docs/features/keep-your-remote-state-configuration-dry/">Terragrunt Docs</a>

We can use a 'partial configuration' instead of specifying the same configuration over and over again in Terraform flles, which lets us adhere to a principle of DRY -- **"Don't Repeat Yourself"**.
