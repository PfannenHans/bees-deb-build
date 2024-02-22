# Bees .deb builder

Simple Dockerfile and scripts to build a `.deb` package of [bees](https://github.com/Zygo/bees/tree/master).

## Prerequisites

Have docker or podman-docker installed.

## Usage

Run the script `./build-package.sh`.  
The built `.deb` package is stored in the repository root.  
To build another version modify the variables at the top of `the build-package.sh` script.
