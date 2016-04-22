#!/bin/bash

FILE="testfile.md"

# Splits a file in two (three):
#  1. (REMOVED) a first empty file until the first YAML delimiter
#  2. the YAML header. The 1 offset keeps the final delimiter in this block
#  3. the body of the post
# The output files are named with a prefix
csplit --keep-files --elide-empty-files $FILE '/---/1' '/---/' --prefix="post"

python blog.py

cat post02 >> post
