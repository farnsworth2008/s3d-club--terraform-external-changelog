output "release" {
  value = local.release

  description = <<-EOT
    A map with tags providing information about the module.
    EOT
}

output "tags" {
  value = local.tags

  description = <<-EOT
    A map with tags providing information about the module.
    EOT
}
