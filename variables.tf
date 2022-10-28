variable "path" {
  type = string

  description = <<-EOT
    the path of the calling module.
    EOT
}

variable "tags" {
  type = map(string)

  description = <<-EOT
    the tags that will be part of the output.
    EOT
}
