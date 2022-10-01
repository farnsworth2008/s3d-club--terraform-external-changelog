# This external requires that "s3d-flow-json" exists on the filesysem path.
#
# The "s3d-flow-json" provides data about the current module.
data "external" "this" {
  program = ["s3d-flow-json"]

  working_dir = var.path
}

locals {
  result = data.external.this.result

  data = {
    is_final = coalesce(local.result.is_final)
    latest   = coalesce(local.result.latest)
    module   = coalesce(local.result.module)
    release  = coalesce(local.result.release)
  }

  tags = merge(
    var.tags,
    { module = local.data.module },
    local.data.is_final ? {} : { ("${local.data.module}-status") = "pre-release" },
  )
}
