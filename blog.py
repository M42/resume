import yaml

# Parsing YAML header from a blog post
def parseYaml(file):
    stream = open(file,"r")

    counter = 0
    for line in stream:
        if line == "---":
            counter = counter+1 # Isn't there a more elegant way to do this?
            if counter == 2:
                break
        header = append(header,line)
    
    header = yaml.load(stream)

    return header.items, body
