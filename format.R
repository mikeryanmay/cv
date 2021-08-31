# read the tex
lines <- readLines("cv.tex")

# replace enumerate
lines <- gsub("enumerate", "etaremune", lines)
lines <- gsub("item{}", "item", lines, fixed=TRUE)

# format the tables
lines <- gsub("\\begin{longtable}{|l|l|}", "\\begin{tabularx}{\\textwidth}{@{}lX}", lines, fixed=TRUE)
lines <- gsub("\\end{longtable}", "\\end{tabularx}", lines, fixed=TRUE)
lines <- lines[grepl("hline", lines) == FALSE]

# write the tex
writeLines(lines, con="cv.tex")

# read the html
lines <- readLines("cv.html")

# replace code tags
lines <- gsub("<code>", "<u>", lines, fixed=TRUE)
lines <- gsub("</code>", "</u>", lines, fixed=TRUE)

# write the html
writeLines(lines, con="cv.html")
