# -*- coding: utf-8 -*-

import yaml

## YAML Header
stream = open("post01","r")
header = yaml.load(stream)
print header

headeroutput = """# {0}
*Autores: Algunos*
"""

outfile = open("post","w")
outfile.write(headeroutput)
