output "release" {
  value = local.data.release

  description = <<-END
    the release.
    https://go.s3d.club/tf/changes#release
    END
}

output "tags" {
  value = local.tags

  description = <<-END
    the tags.
    https://go.s3d.club/tf/changes#tags
    END
}
