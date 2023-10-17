#!/usr/bin/env bash

set -x

if [[ -z "${CARDANO_NODE_DATA_FOLDER}" ]]; then
  echo "Missing required CARDANO_NODE_DATA_FOLDER, pass it as first param"
  exit 1
fi

if [ ! -d "${CARDANO_NODE_DATA_FOLDER}/db" ]; then
  echo "db missing, downloading"
  rm -fr "${CARDANO_NODE_DATA_FOLDER}/*"
  mithril-client snapshot download latest --download-dir "${CARDANO_NODE_DATA_FOLDER}"
else
  echo "data folder already exists. Skipping..."
fi

exit 0
