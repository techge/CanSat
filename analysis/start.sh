#!/bin/bash

# create backup
cp capture.csv capture.csv_bkp

# delete first and last line of capture as they may got cut
tail -n +2 capture.csv_bkp | head -n -1 > capture.csv

./createPlots.R
