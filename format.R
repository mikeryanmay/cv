# read the tex
lines <- readLines("cv.tex")

# replace enumerate
lines <- gsub("enumerate", "etaremune", lines)
lines <- gsub("item{}", "item", lines, fixed=TRUE)

# Keep ragged-right alignment local to the publication list.
publications_heading <- match("\\subsection*{Publications}", lines)
publications_start <- which(startsWith(lines, "\\begin{etaremune}"))
publications_start <- publications_start[publications_start > publications_heading][1]
publications_end <- which(startsWith(lines, "\\end{etaremune}"))
publications_end <- publications_end[publications_end > publications_start][1]
stopifnot(!is.na(publications_start), !is.na(publications_end))
lines[publications_start] <- paste0("\\begingroup\n\\RaggedRight\n", lines[publications_start])
lines[publications_end] <- paste0(lines[publications_end], "\n\\par\n\\endgroup")

# format the tables
lines <- gsub("\\begin{longtable}{|l|l|}", "\\begin{xltabular}{\\textwidth}{@{}lX}", lines, fixed=TRUE)
lines <- gsub("\\end{longtable}", "\\end{xltabular}", lines, fixed=TRUE)
lines <- lines[grepl("hline", lines) == FALSE]

# Add a small gap between the professional-service paragraphs in the PDF.
service_entries <- startsWith(lines, "\\textbf{Member of:}") |
                   startsWith(lines, "\\textbf{Peer review for:}")
lines[service_entries] <- paste0("\\smallskip\n", lines[service_entries])

# write the tex
writeLines(lines, con="cv.tex")

# read the html
lines <- readLines("cv.html")

# replace code tags
lines <- gsub("<code>", "<u>", lines, fixed=TRUE)
lines <- gsub("</code>", "</u>", lines, fixed=TRUE)

# write the html
writeLines(lines, con="cv.html")
