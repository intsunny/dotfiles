#!/usr/bin/env sh -x

# I really hate POSIX shell scripting.
# This script was tested on dash, and Apple's 3.X bash.

for i in envtool_support/functions/* ; do
    . $i
done

while getopts "t" OPTIONS; do
    case "${OPTIONS}" in
        t)
	    run_tests
            ;;
    esac
done
