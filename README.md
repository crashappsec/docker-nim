# Nim Docker image

This is a Nim Docker image for the x86_64 and arm64 architectures,
as the official Nim Docker image is only for x86_64.
It also builds the arm64 image natively on an arm64 runner to speed up
the build - otherwise the multiplatform Docker build is pretty slow.
