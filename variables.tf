variable "path" {
  type = string

  description = <<-END
    the path for the module that will be inspected _(supply `path.module`)_.
    https://go.s3d.club/tf/changes#path
    END
}

variable "tags" {
  type = map(string)

  description = <<-END
    the tags that will be part of the output.
    https://go.s3d.club/tf/changes#tags
    END
}
