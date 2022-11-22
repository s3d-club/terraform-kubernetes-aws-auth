# K8 AWS Auth Map Module
This module defines the configuration we recommend for the AWS Map module.

## Associated Documents
Please read our [LICENSE][lice], [CONTRIBUTING][cont], and [CHANGES][chge]
documents before working in this project and anytime they are updated.

## Overview
This module works in conjunction with the [S3D EKS][eks0] module but could also
be used for other cases where Kubernetes AWS Auth maps are managed.

Other approaches for Terraform and Kubernetes involve large and complex **EKS**
modules. From what we have seen, gigantic `EKS everything` modules are a bad
idea. These modules become difficult to configure, maintain, and audit over
time with frustrating issues where the number of configuration options and the
types of problems grow exponentially. We perfer our approach of focused modules
especially in this case where the EKS module is tied to the AWS provider while
this module works with the Kubernetes provider.

We are also not trying to be all things to all people with a ton of options. We
have an opinonated view for the **proper** way to configure EKS and do not wish
to present options we feel don't make sense.

[eks0]: /docs/source/aws-eks/overview
[chge]: ./CHANGES.md
[cont]: ./CONTRIBUTING.md
[lice]: ./LICENSE.md
