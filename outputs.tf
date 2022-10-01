output "latest" {
  value = local.release

  description = <<-END
 		The latest version including pre-release suffix

		This is the latest version number.
    END
}

output "tags" {
  value = merge(
    var.tags,
    { (local.s3d_part) = local.release },
    local.is_final ? {} : { ("${local.s3d_part}-status") = "pre-release" },
  )

  description = <<-END
		Tags with part version data

		Tags from input and a new tag for the new part with it's version.
    END
}
