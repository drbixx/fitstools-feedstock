#!/bin/sh

set -e

for cli_tool in \
  addfits \
  addkeys \
  addphotonnoise \
  anticosmicfits \
  binfits \
  bintablefits \
  clipfits \
  comparefits \
  convolvefits \
  cosmicfits \
  dividefits \
  expandfits \
  extractfits \
  extractkeys \
  fillfits \
  fits2jpeg \
  fitshist \
  flatfits \
  headfits \
  joinfits \
  jpeg2fits \
  maskfits \
  meanfits \
  multiplyfits \
  rmnan \
  rotrevfits \
  smoothfits \
  statfits \
  subtractfits \
  sumfits \
  sumintfits \
  templatefits; do
    echo -n "Testing ${cli_tool} ... "
    # Check if the file exists.
    test -f ${CONDA_PREFIX}/bin/${cli_tool}
    # Some fitstools return 0 without arguments, others return 1.
    # So just grep for the expected first line.
    (${cli_tool} --help || ${cli_tool}) 2>&1 | grep -q "Usage: ${cli_tool}"
    echo "OK"
done