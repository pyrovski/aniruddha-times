#!/bin/bash
cat header > table
find  data/ -name '*-*'| xargs -I{} ./entry.sh {} >> table