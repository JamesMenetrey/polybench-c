#!/bin/bash
SCRIPT_PATH=$(dirname $(realpath $0))

# exit when any command fails
set -e

cd /polybench
utilities/makefile-gen.pl .
utilities/compile-all.sh