source = src
output = dist
md_files = $(shell find $(source) -name "*.md")
html_files = $(patsubst $(source)/%.md, $(output)/%.html, $(md_files))

build: $(html_files)

all: clean assets build

dist/%.html: src/%.md Makefile templates/default.html pandoc.yaml metadata.yaml
	@mkdir -p $(@D)
	@pandoc -d pandoc.yaml $< -o $@
	@echo "[html generated]: " $@

assets:
	@rsync -a --delete ./public/ $(output)/public/

clean:
	@rm -rf $(output)/*
	@mkdir -p $(output)/public

serve:
	@python3 -m http.server -d $(output) 3000

watch:
	find src -type f | entr make build

.PHONY: build clean assets serve all
