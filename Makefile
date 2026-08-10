# Makefile for "Creating Effective Display Tables with the gt Package" (a Quarto book).
#
# Run `make` or `make help` to list targets.

.DEFAULT_GOAL := help
.PHONY: help render preview chapter clean

help: ## List available targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	  | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

render: ## Render the whole book to docs/
	quarto render

preview: ## Serve a live preview with auto-reload (Ctrl-C to stop)
	quarto preview

chapter: ## Render one chapter, e.g. make chapter CH=03-formatting-numbers.qmd
	@test -n "$(CH)" || { echo "Usage: make chapter CH=NN-name.qmd"; exit 1; }
	quarto render $(CH) --to html

clean: ## Remove Quarto build artifacts (docs/, .quarto/, _freeze/)
	rm -rf docs .quarto _freeze
