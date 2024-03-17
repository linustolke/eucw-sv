#!/bin/sh

# Downloads all the files from the agcw website.
#
# This works slowly, not to impact the site too much. If more speed is
# needed tune the wait time.

# Peculiarities:

# When downloading a directory (url ending with /) wget saves it in
# the file named index.html and does rewriting of urls to match this.
# The next download it uses the rewritten contens meaning that the
# subsequent request will be for /index.html. The autosar site sends
# errors for requests to /index.html. The quickest fix is to remove
# all index.html files before downloading. Then wget will not use the
# rewritten urls but instead the newly fetched urls and the recursive
# descent works.

mkdir -p eucw.org
cd eucw.org && wget -N \
     --wait=10 --random-wait \
     -x -nH -r -k -np \
     http://eucw.org/
