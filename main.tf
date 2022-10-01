data "external" "this" {
  program = ["s3d-flow-json"]

  working_dir = var.path
}

locals {
  data     = data.external.this.result
  is_final = local.data.is_final
  release  = local.data.release
  s3d_part = local.data.part
}
