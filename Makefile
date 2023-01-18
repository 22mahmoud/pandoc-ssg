source = src
output = dist
md_files = $(shell find $(source) -name "*.md")
html_files = $(patsubst $(source)/%.md, $(output)/%.html, $(md_files))

build: $(html_files)

dist/%.html: src/%.md Makefile templates/default.html pandoc.yaml metadata.yaml
	@mkdir -p $(@D)
	@pandoc -d pandoc.yaml $< -o $@
	@echo "[html generated]: " $@

clean:
	@rm -rfv $(output)

.PHONY: build clean
