# neomura > setup aseprite cli action

github action to build and install aseprite cli

## license

while this repository is [mit licensed](./license.md), it includes a git
submodule of the [aseprite repository](https://github.com/aseprite/aseprite),
which uses a proprietary license.

the owner and maintainer of aseprite has [given their approval](https://community.aseprite.org/t/integrating-aseprite-with-travis-ci/1351)
to the building and executing of the source code for ci purposes, but you should
make your own checks to ensure that your usage of this github action is valid
within the aseprite license agreement.

## supported virtual environments

supported virtual environments are listed in the
[test workflow](./.github/workflows/test.yaml).
