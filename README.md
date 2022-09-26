# S3D Kubernetes AWS Auth Map Module
This module defines the configuration we recommend for the AWS Map module.

## Other Documents
Please read our [LICENSE][lice], [CONTRIBUTING][cont], [CODE-OF-CONDUCT][code],
and [CHANGES][chge] documents before working in this project and anytime they
are update.

## Overview
This module works in conjunction with the [S3D EKS][eks0] module. Although
while the modules work togehter there is some ability for them to grow
independently.

Other approaches for Terraform and Kubernetes involve large and complex **EKS**
modules. From what we have seen gigantic `EKS everything` modules are a bad
idea. These modules become difficult to configure and maintain over time with
frustrating issues where the number of configuration options and the types of
problems grow exponentially. We perfer our approach of focused modules
especially in this case where the EKS module is tied to the AWS provider while
this module works with the Kubernetes provider.

We are also not trying to be all things to all people with a ton of options. We
have an opinonated view for the **proper** way to configure EKS and do not wish
to present options we feel don't make sense.

## Usage
### Required Inputs
**TODO** add inputs

### Optional Inputs
**TODO** add optional inputs

### Outputs
**TODO** add outputs

[eks0]: /docs/source/aws-eks/overview
[chge]: ./CHANGES.md
[code]: ./CODE-OF-CONDUCT.md
[cont]: ./CONTRIBUTING.md
[lice]: ./LICENSE.md
