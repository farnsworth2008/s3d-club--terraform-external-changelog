variable "path" {
  type = string

  description = <<-END
		Path to directory where `CHANGELOG.md` exists

		In our normal pattern, this is set with `path.module`.
		END
}

variable "tags" {
  type = map(string)

  description = <<-END
    Tags for resources

    Tags in the **output** of this module will include all these **input** tags
    merged with the the [part_name](https://go.s3d.club/tf/part_name) and version
    of this module.

		An overview of our approach to tagging is
		[HERE](https://go.s3d.club/tf/tagging).
    END
}
