.PHONY: fmt checkov

fmt:
	terraform fmt -recursive . &&\
	terragrunt hclfmt

checkov:
	checkov --directory=.
