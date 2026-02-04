# render-single-markdown.R
# 
# This script combines all chapters of the gt book into a single Markdown file.
# Useful for LLM ingestion or comprehensive reference.
#
# Usage: Rscript scripts/render-single-markdown.R
# Output: combined/gt-book-complete.md

library(yaml)

# Configuration
output_dir <- "combined"
output_file <- "gt-book-complete.md"

# Read _quarto.yml to get chapter order
quarto_config <- yaml::read_yaml("_quarto.yml")

# Extract all chapter files in order
get_chapter_files <- function(config) {
  chapters <- c()

  # Get main chapters
  book_chapters <- config$book$chapters
  for (item in book_chapters) {
    if (is.character(item)) {
      # Direct chapter file
      chapters <- c(chapters, item)
    } else if (is.list(item) && !is.null(item$chapters)) {
      # Part with chapters
      chapters <- c(chapters, item$chapters)
    }
  }

  # Get appendices
  if (!is.null(config$book$appendices)) {
    chapters <- c(chapters, config$book$appendices)
  }

  chapters
}

# Process a single .qmd file to clean Markdown
process_qmd <- function(filepath) {
  if (!file.exists(filepath)) {
    warning(paste("File not found:", filepath))
    return("")
  }

  lines <- readLines(filepath, warn = FALSE)

  # Remove YAML front matter if present
  if (length(lines) > 0 && lines[1] == "---") {
    yaml_end <- which(lines[-1] == "---")[1] + 1
    if (!is.na(yaml_end)) {
      lines <- lines[(yaml_end + 1):length(lines)]
    }
  }

  # Remove setup chunks (```{r setup, ...} blocks)
  content <- paste(lines, collapse = "\n")
  content <- gsub("```\\{r setup[^}]*\\}[^`]*```", "", content)

  # Remove #| directives from code chunks (like #| eval: false)
  content <- gsub("\n#\\| [^\n]+", "", content)

  # Clean up excessive blank lines
  content <- gsub("\n{4,}", "\n\n\n", content)

  # Trim leading/trailing whitespace
  content <- trimws(content)

  content
}

# Main execution function
main <- function() {
  cat("Rendering gt book to single Markdown file...\n")

  # Create output directory if needed
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
    cat(paste("Created directory:", output_dir, "\n"))
  }

  # Get chapter files
  chapter_files <- get_chapter_files(quarto_config)
  cat(paste("Found", length(chapter_files), "chapters\n"))

  # Build combined content
  combined_content <- c()

  # Add header
  header <- paste0(
    "# Creating Effective Display Tables with the gt Package\n\n",
    "**Author:** Richard Iannone\n\n",
    "**Generated:** ", format(Sys.time(), "%Y-%m-%d"), "\n\n",
    "---\n\n",
    "This document combines all chapters of the gt book into a single reference.\n",
    "For the interactive version with rendered tables, visit the online book.\n\n",
    "---\n\n"
  )
  combined_content <- c(combined_content, header)

  # Process each chapter
  for (i in seq_along(chapter_files)) {
    filepath <- chapter_files[i]
    cat(paste("Processing:", filepath, "\n"))

    chapter_content <- process_qmd(filepath)

    if (nchar(chapter_content) > 0) {
      # Add separator between chapters
      if (i > 1) {
        combined_content <- c(combined_content, "\n\n---\n\n")
      }
      combined_content <- c(combined_content, chapter_content)
    }
  }

  # Write output
  output_path <- file.path(output_dir, output_file)
  writeLines(paste(combined_content, collapse = "\n"), output_path)

  # Report results
  file_size <- file.size(output_path)
  file_size_mb <- round(file_size / 1024 / 1024, 2)

  cat("\n")
  cat("=== Complete ===\n")
  cat(paste("Output:", output_path, "\n"))
  cat(paste("Size:", file_size_mb, "MB\n"))
  cat(paste("Chapters processed:", length(chapter_files), "\n"))
}

# Run if executed directly
if (!interactive()) {
  main()
} else {
  cat("Run main() to generate the combined Markdown file.\n")
}
