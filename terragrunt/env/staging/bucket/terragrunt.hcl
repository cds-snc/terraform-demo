terraform {
  source = "../../../aws//bucket"
}

inputs = {
  bucket_name = "cds-terragrunt-demo-bucket"
}

include {
  path = find_in_parent_folders()
}