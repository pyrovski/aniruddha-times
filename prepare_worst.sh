#!/bin/bash

sed -re 's/;;;//g' temp1  | sed -e :a -e N -e 's/\n/\:/' -e ta | tr -s ':' | tr ':' '\n' > wtable

