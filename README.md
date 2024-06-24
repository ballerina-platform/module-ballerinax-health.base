Ballerina Health Base
==========================

![Daily Build](https://github.com/ballerina-platform/module-ballerinax-health.base/actions/workflows/daily-build-base.yml/badge.svg)


The Ballerina health base includes some common capabilities used in other health packages. 

Following are the sub modules of the package.
- health.base.auth

    This module contains an authentication provider that supports client assertion JWTs. Using this module, access token requests to token endpoints can be sent with a client assertion. The module handles also the caching and management of access tokens.

- health.base.error

    This module contains defined errors and related error handling utilities used by health packages.

- health.base.message

    This module contains base messaging related implementations and utilities used by other health packages.

## Building from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 11. You can install either [OpenJDK](https://adoptopenjdk.net/) or [Oracle](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html).

    > **Note:** Set the JAVA_HOME environment variable to the path name of the directory into which you installed JDK.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/). 

### Building the source

Execute the commands below to build from the source.

- To build the package:
    ```shell
    bal pack ./base
    ```

## Contributing to Ballerina

As an open source project, Ballerina welcomes contributions from the community. 

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* Discuss the code changes of the Ballerina project in [ballerina-dev@googlegroups.com](mailto:ballerina-dev@googlegroups.com).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
