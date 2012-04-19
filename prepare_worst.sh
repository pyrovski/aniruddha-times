#!/bin/bash

sed -re 's/;;;//g' apptimes.worst.csv  | sed -e :a -e N -e 's/\n/\:/' -e ta | tr -s ':' | tr ':' '\n' > wtable

