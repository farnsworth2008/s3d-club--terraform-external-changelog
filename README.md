# Changes Module
A Teraform module that reads from the `CHANGES.md` file.

## Additional Documents
Please read our [LICENSE][lice], [CONTRIBUTING][cont], [CODE-OF-CONDUCT][code],
and [CHANGES][chge] documents before working in this project and anytime they
are updated.

## Overview
This module reads the "CHANGES.md" file to produce a tag that reflects a module
version.

## Usage Notes
This module wrapper around the "s3d-flow-json" script to implement a tagging
model we feel helps provide insight into the status of our Terraform managed
resources.

The "s3d-flow-json" script reads the "CHANGES.md" file and provides "json"
output. The following is an example of the data structure that the script
produces.

```json
{
  "is_final": "false",
  "latest": "0.1.1-1042",
  "module": "terraform-aws-ec2",
  "release": "0.1.1"
}
```

If the script fails to execute, scripting within the external produces a valid
json result because we feel this is not a fatal failure since the lost
information is only the resource tags. We also find that the output of tags
with the string of "ERROR" is easier to troubleshoot.

Using this module, resources are tagged with version information for the
module(s) that define them.  The process is additive such that an ec2 instance
that exists as a result of several modules interacting is tagged with all
modules in the chain that defined it.

Example output:

```json
{
  "tf-test-foohat-info-site": "0.1.732",
  "tf-test-root-foohat-site-group": "0.0.922",
  "tf-ec2": "0.1.1",
  "tf-site": "0.1.4"
}
```

## Implementation notes
### Using `local.data` to structure output
This module is a wrapper around the `s3d-flow-json` script. In the current
implementation, the script reads the `CHANGES.md` to determine version
information and issues a GIt command to determine the module name. The output
of the script is JSON.

At a future point, the implementation of the module will change. We may for
example implement a Terraform provider so we can provide this data without
resorting to using the `external` provider or future versions of Terraform may
provide the functionality we require.

Regardles of implementation, the module must provide sturctured output. If
`s3d-flow-json` provides  _extra_ name value pairs we ignore them. If for some
reason, `s3d-flow-json` fails to provide a required value, an error string is
provided.  The structure ensures that only outputs listed in `local.data` will
be supplied as module outputs.

[chge]: ./CHANGES.md
[code]: ./CODE-OF-CONDUCT.md
[cont]: ./CONTRIBUTING.md
[lice]: ./LICENSE.md
