#!/bin/sh

set -e

BASE_DIR="${PWD}"
OUTPUT="${BASE_DIR}/${LAMBDA_NAME}.zip"
VENV_DIR="/tmp/build"

virtualenv "${VENV_DIR}"
. "${VENV_DIR}/bin/activate"
pip3 install -r requirements.txt
deactivate

cd ${VENV_DIR}/lib/*/site-packages
zip --quiet -r "${OUTPUT}" *
cd "${BASE_DIR}"
zip -g "${OUTPUT}" *.py
