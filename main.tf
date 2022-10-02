# This external requires that "s3d-flow-json" exists on the filesysem path.
#
# The "s3d-flow-json" provides data about the current module.
data "external" "this" {
  program = ["s3d-flow-json"]

  working_dir = var.path
}

locals {
  result  = data.external.this.result
  is_root = var.path == path.root

  # See comments about this in "README.md"
  data = {
    is_final = coalesce(local.result.is_final)
    latest   = coalesce(local.result.latest)
    module   = coalesce(local.result.module)
    release  = coalesce(local.result.release)
  }

  # The module name here is the way we want it named for the our tag. In this
  # name "terraform-aws-" and "terraform-" are converted to "tf-". For modules
  # that are not based on the "aws" provider we wil end up with names that may
  # turn out like "tf-external-foo" as our tag names.
  #
  # The root module gets a special name with "root-" as a prefix.
  module_name = (
    local.is_root ? "root-${local.module_short_name}" : local.module_short_name
  )

  # See comment about "module_name".
  module_short_name = (
    replace(replace(local.data.module, "terraform-aws-", ""), "terraform-", "")
  )

  tags = merge(
    var.tags,
    local.data.is_final ? {
      ("tf-release-${local.module_name}") = local.data.release
      } : {
      ("tf-pre-release-${local.module_name}") = local.data.release
    },
  )
}
