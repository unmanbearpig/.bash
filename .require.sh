#!/usr/local/bin/bash
for filename in $(ls *.sh); do
	source $filename
done
