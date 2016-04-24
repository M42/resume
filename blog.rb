#!/usr/bin/env ruby
# Kramdown is the same markdown parser used in our blog
require "kramdown"
# Yaml for reading the front-matter
require "yaml"

# Enable some replacement patterns just in case
md_replacements = {

}
tex_replacements = {
  "\\begin{array}" => "\\[\\begin{array}",
  "\\end{array}"   => "\\end{array}\\]"
}


# Use the argument or assume testfile
file = ARGV[0] || "testfile.md"
# Separate front-matter from post content
`csplit --keep-files --elide-empty-files --suppress-matched #{file} /---/1 /---/ --prefix="post"`

# Read metadata
header = YAML.load File.read("post01")
# Include metadata with rest of content
output = "# #{header["title"]}\n*Autores: #{header["authors"].join(", ")}*\n#{File.read("post02")}"
md_replacements.each{ |search, replace| output.gsub!(search, replace) }
# Convert to LaTeX
latex_output = Kramdown::Document.new(output, template: :document).to_latex
tex_replacements.each{ |search, replace| latex_output.gsub!(search, replace) }
File.write("post.tex", latex_output)
# Convert to PDF and write
`pandoc post.tex -o post.pdf`
