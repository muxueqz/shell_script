#!/usr/bin/env bash
# Beginning of the script:

# Handle argument.
if [ -n "$@" ]
then
    ARGS=$@
    echo "Result:"
    # python -c "print(${ARGS})"
    lua -e "print(${ARGS})"
fi
# vim:sw=4:ts=4:et:
