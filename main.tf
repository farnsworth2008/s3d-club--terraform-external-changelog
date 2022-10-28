# This external requires that "s3d-flow-json" exists on the filesysem path.
#
# The "s3d-flow-json" script provides data about the current module.
data "external" "this" {
  program = ["bash", "-c", <<-EOT
    out="$(${path.module}/s3d-flow-json)" || {
      log="$(pwd)/$(uuidgen).log"
      echo "$out" >> "$log"
      out=""
      out="$out{"
      out="$out  \"error\": \"error in $log\""
      out="$out}"
    }
    echo "$out"
    EOT
  ]

  working_dir = var.path
}

locals {
  # See comments in "README.md".
  data = {
    is_final = try(local.result.is_final, false)
    latest   = try(local.result.latest, local.result.error)
    module   = try(local.result.module, local.result.error)
    release  = try(local.result.release, local.result.error)
  }

  # Determine of the module is the root module.
  is_root = var.path == path.root

  # The module name here is the way we want it named for the our tag. In this
  # name "terraform-aws-" and "terraform-" are converted to "tf-". For modules
  # that are not based on the "aws" provider we wil end up with names that may
  # turn out like "tf-external-foo" as our tag names.
  #
  # The root module gets a special name with "root-" as a prefix.
  module_name = replace(
    local.is_root ? "root-${local.module_short_name}" : local.module_short_name,
    "_",
    "-",
  )

  # See comment about "module_name".
  module_short_name = (
    replace(replace(local.data.module, "terraform-aws-", ""), "terraform-", "")
  )

  # The result of "s3d-flow-json"
  result = data.external.this.result

  # The tags here are the ones this module provides as output. These tags
  # include the input tags as well as a tag based on the current module.
  tags = merge(var.tags, {
    (join("-", [local.tag_prefix, local.module_name])) = local.data.release
  })

  # We include "test" as part of our prefix if the module is a pre-release
  # version.
  tag_prefix = (
    local.data.is_final ? "tf" : "tf-test"
  )
}
