variable "path" {
  type = string

  description = <<-END
    Path
    https://go.s3d.club/tf/changes#path
    END
}

variable "tags" {
  type = map(string)

  description = <<-END
    Tags
    https://go.s3d.club/tf/changes#path
    END
}
