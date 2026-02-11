library(dplyr)
library(stringr)
library(readr)
library(httr)
library(rvest)
library(jsonlite)

# ---------------------------------------------------------------------------
# Read export files
# ---------------------------------------------------------------------------

watched <- read_csv("data/watched.csv", show_col_types = FALSE)
ratings <- read_csv("data/ratings.csv", show_col_types = FALSE)

cat(
  sprintf(
    "Watched: %d films\nRated: %d films\n",
    nrow(watched), nrow(ratings)
  )
)

# ---------------------------------------------------------------------------
# Merge watched + ratings
# ---------------------------------------------------------------------------

films <- 
  watched |>
  dplyr::select(film_title = Name, year = Year, letterboxd_uri = `Letterboxd URI`) |>
  dplyr::left_join(
    ratings |>
      select(letterboxd_uri = `Letterboxd URI`, film_rating = Rating) |>
      distinct(letterboxd_uri, .keep_all = TRUE),
    by = "letterboxd_uri"
  ) |>
  dplyr::arrange(desc(film_rating), film_title)

# ---------------------------------------------------------------------------
# Fetch directors from Letterboxd film pages
# ---------------------------------------------------------------------------

# Load cached director data if it exists (avoids re-fetching everything)
cache_file <- "data/director_cache.csv"

if (file.exists(cache_file)) {
  director_cache <- read_csv(cache_file, show_col_types = FALSE)
  cat(sprintf("Loaded %d cached directors\n", nrow(director_cache)))
} else {
  director_cache <- tibble(letterboxd_uri = character(), director = character())
}

# Identify films still needing director lookup
films_to_fetch <- 
  films |>
  dplyr::filter(!letterboxd_uri %in% director_cache$letterboxd_uri)

cat(sprintf("Need to fetch directors for %d films\n", nrow(films_to_fetch)))

if (nrow(films_to_fetch) > 0) {
  ua <- "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)"

  get_director <- function(boxd_url) {
    # Resolve short URL to full Letterboxd film page
    resp <- 
      tryCatch(
        GET(boxd_url, add_headers(`User-Agent` = ua), timeout(10)),
        error = function(e) NULL
      )
    
    if (is.null(resp) || status_code(resp) != 200) return(NA_character_)

    page <- read_html(resp)

    # Extract director from JSON-LD (most reliable)
    jsonld_el <- html_elements(page, "script[type='application/ld+json']")
    
    if (length(jsonld_el) > 0) {
      json_text <- html_text(jsonld_el[[1]])
      # Strip CDATA wrapper if present
      json_text <- str_remove_all(json_text, "/\\*.*?\\*/|<!\\[CDATA\\[|\\]\\]>")
      json_text <- str_trim(json_text)
      parsed <- tryCatch(fromJSON(json_text, simplifyVector = FALSE), error = function(e) NULL)
      if (!is.null(parsed) && !is.null(parsed$director)) {
        dirs <- vapply(parsed$director, function(d) d$name, character(1))
        return(paste(dirs, collapse = ", "))
      }
    }

    # Fallback: scrape director links
    dir_links <- html_text2(html_elements(page, "a[href*='/director/']"))
    if (length(dir_links) > 0) return(dir_links[1])

    NA_character_
  }

  new_directors <- tibble(
    letterboxd_uri = character(),
    director = character()
  )

  for (i in seq_len(nrow(films_to_fetch))) {
    uri <- films_to_fetch$letterboxd_uri[i]
    title <- films_to_fetch$film_title[i]

    if (i %% 25 == 1 || i == nrow(films_to_fetch)) {
      cat(sprintf("  [%d/%d] %s\n", i, nrow(films_to_fetch), title))
    }

    dir <- get_director(uri)
    new_directors <- bind_rows(
      new_directors,
      tibble(letterboxd_uri = uri, director = dir)
    )

    # Save cache every 50 films so interruptions don't lose progress
    if (i %% 50 == 0 || i == nrow(films_to_fetch)) {
      director_cache <- bind_rows(director_cache, new_directors)
      write_csv(director_cache, cache_file)
      new_directors <- tibble(
        letterboxd_uri = character(), director = character()
      )
    }

    Sys.sleep(0.5)
  }

  # Reload cache after loop
  director_cache <- read_csv(cache_file, show_col_types = FALSE)
  cat(sprintf("Cached %d total directors\n", nrow(director_cache)))
}

# Join directors into main dataset
films <-
  films |>
  left_join(director_cache, by = "letterboxd_uri")

# ---------------------------------------------------------------------------
# Write
# ---------------------------------------------------------------------------

write_csv(films, "data/letterboxd_films.csv")

cat(sprintf("\nWrote %d films to data/letterboxd_films.csv\n", nrow(films)))
cat(
  sprintf("  Rated: %d | Unrated: %d | With director: %d\n",
  sum(!is.na(films$film_rating)),
  sum(is.na(films$film_rating)),
  sum(!is.na(films$director)))
)
