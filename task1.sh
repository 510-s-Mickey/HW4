#!/bin/bash
# The easiest way is

pgrep -f infinite.sh | xargs -I {} sh -c 'kill {}'
