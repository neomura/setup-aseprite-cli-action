# neomura/setup-aseprite-cli-action

GitHub Action to build and install the Aseprite CLI.

## License

While this repository is [MIT licensed](./license.md), it includes a Git submodule of the [Aseprite repository](https://github.com/aseprite/aseprite), which uses a proprietary license.

The owner and maintainer of Aseprite has [given their approval](https://community.aseprite.org/t/integrating-aseprite-with-travis-ci/1351) to the building and executing of the source code for CI purposes, but you should
make your own checks to ensure that your usage of this GitHub Action is valid within the Aseprite license agreement.

## Supported virtual environments

Supported virtual environments are listed in the [test workflow](./.github/workflows/test.yaml).

## Usage

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
    - uses: neomura/setup-aseprite-cli-action@v1.0.1

    # aseprite is now available on the path.
    - run: aseprite --help
```
