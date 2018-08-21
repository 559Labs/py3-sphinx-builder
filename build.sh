#!/bin/bash -e

# Set up the environment variables with defaults
SPHINX_SRC_DIR=${SPHINX_SRC_DIR:=/sphinx/src}
SPHINX_BUILD_DIR=${SPHINX_BUILD_DIR:=/sphinx/build}
SPHINX_BUILDER=${SPHINX_BUILDER:=html}
PIP_REQUIREMENTS_FILE=${PIP_REQUIREMENTS_FILE:=/sphinx/requirements.txt}

# Install via the requirements file. 
if [[ -e ${PIP_REQUIREMENTS_FILE} ]]; then
  pip install -r ${PIP_REQUIREMENTS_FILE}
fi

cd ${SPHINX_SRC_DIR}

sphinx-build -b ${SPHINX_BUILDER} . ${SPHINX_BUILD_DIR}
if [[ ${SPHINX_BUILDER} == "pdf" ]]; then
  cd ${SPHINX_BUILD_DIR} && make all-pdf
elif [[ ${SPHINX_BUILDER} == "pdfja" ]]; then
  cd ${SPHINX_BUILD_DIR} && make all-pdf-ja
fi
