output "tags" {
  value = local.tags

  description = <<-EOT
    a map with tags that describe the content of `CHANGES.md`.
    https://go.s3d.club/tf/changes#tags
    EOT
}
