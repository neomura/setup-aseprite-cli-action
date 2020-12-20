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

## usage

```yaml
on: [push]

jobs:
  example:
    runs-on: ubuntu-latest
    steps:

    # load your repository.
    - uses: actions/checkout@v2

    # install MSVC - only needed on Windows.
    - uses: ilammy/msvc-dev-cmd@v1

    # install this github action.
    - uses: neomura/setup-aseprite-cli-action@v1.0.0

    # aseprite is now available on the path.
    - run: aseprite --help
```
