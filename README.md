# 💻 Terraform Demo</h1>

## 📖 Resources and Accessibility ♿
> We are committed to providing learning resources that are accessible to all. If you see a resource that is not compliant, please let us know by [creating an issue](https://github.com/cds-snc/terraform-demo/issues).

- [Slides](https://docs.google.com/presentation/d/1fAJBXQuxhNtrjaaIYOSN2YDJl92bhPgyf4VKySnzDIk/edit#slide=id.gfa3975480b_0_3)
- [HashiCorp Developer](https://developer.hashicorp.com/terraform/tutorials)
- [A Cloud Guru](https://learn.acloud.guru/)
- [New Relic](https://www.hashicorp.com/partners/tech/new-relic)
- [CDS Terraform Modules](https://github.com/cds-snc/terraform-modules)
- [CDS's Terraform Plan module](https://github.com/cds-snc/terraform-plan)

## 🏖️ Terraform Boilerplate 🗄️

### 🧰 Tools Needed 🛠️

- An AWS account 
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli#install-terraform)

### ✔️ How to set it up 🦾

After you have a scratch AWS account setup and connected with AWS CLI, the first step to getting started with Terraform is to use the AWS module to create an S3 bucket.

Once this bucket is created, we can create a DynamoDB table and use this DynamoDB table instance to 'lock state' to prevent state corruption.


### 🤖 Integrating Terragrunt and future 🔮

[Terragrunt Docs](https://terragrunt.gruntwork.io/docs/features/keep-your-remote-state-configuration-dry/)

We will use a 'partial configuration' instead of specifying the same configuration over and over again in Terraform files, which lets us 'keep things DRY' -- **"Don't Repeat Yourself"**.

### 🐳 Using a DevContainer 🛠️

A DevContainer allows you to standardize your development environment using Colima. To use the provided DevContainer:

1. Ensure you have [Colima](https://github.com/abiosoft/colima) installed on your machine.
2. Install [Visual Studio Code](https://code.visualstudio.com/) and the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).
3. Open this project in VS Code.
4. When prompted, reopen the project in the DevContainer. Alternatively, press `F1`, search for "Dev Containers: Reopen in Container," and select it.
5. Once the container is built and running, you can start working with all the required tools pre-installed.

This setup ensures consistency across development environments and simplifies onboarding for new contributors.
