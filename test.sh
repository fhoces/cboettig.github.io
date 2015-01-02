#!/bin/bash

set -e
source /home/cboettig/.notebook-env.sh
docker run --rm -it cboettig/labnotebook R --version
