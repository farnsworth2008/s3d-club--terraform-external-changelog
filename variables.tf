variable "path" {
  type = string

  description = <<-EOT
    the path of the caller _(supply `path.module`)_.
    https://go.s3d.club/tf/changes#path
    EOT
}

variable "tags" {
  type = map(string)

  description = <<-EOT
    the tags that will be part of the output.
    https://go.s3d.club/tf/changes#tags
    EOT
}
