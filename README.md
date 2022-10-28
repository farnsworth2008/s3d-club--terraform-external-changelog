# Changes Module
A Teraform module for mangement of tags related to module versions.

## Additional Documents
Please read our [LICENSE][lice], [CONTRIBUTING][cont], [CODE-OF-CONDUCT][code],
and [CHANGES][chge] documents before working in this project and anytime they
are updated.

## Overview
This module reads the `CHANGES.md` file and Git history obtain tags that are
useful for tracking resources.

## Usage Notes
This module includes scripting for an `external` data resource.  The scriping
depends on `git`, `sed`, and other tools that should exist in the environment.

[chge]: ./CHANGES.md
[code]: ./CODE-OF-CONDUCT.md
[cont]: ./CONTRIBUTING.md
[lice]: ./LICENSE.md
