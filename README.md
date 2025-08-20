# Pandoc SSG

A minimal static site generator (SSG) built with [Pandoc](https://pandoc.org/), `make`, and a custom template.
It converts Markdown files into a static HTML website with support for custom metadata, templates, and syntax highlighting.

---

## 📂 Project Structure

```
.
├── Makefile               # Build system
├── pandoc.yaml            # Pandoc defaults
├── metadata.yaml          # Global site metadata
├── templates/             # Pandoc HTML templates
│   └── default.html
├── public/                # Static assets (CSS, images, JS)
├── src/                   # Markdown source content
│   ├── index.md
│   └── about/index.md
└── dist/                  # Build output (generated)
```

- `src/` → Markdown pages
- `public/` → Static assets (copied into `dist/public`)
- `templates/default.html` → Base HTML layout
- `dist/` → Final website output

---

## ⚙️ Requirements

- [Pandoc](https://pandoc.org/installing.html) ≥ 3.0
- [Node.js](https://nodejs.org/) ≥ 18 (for code highlighting filter)
- GNU Make
- Python ≥ 3.7 (for local dev server)

---

## 🚀 Usage

### Build the site

```bash
make build
```

Generates `.html` files in `dist/` from Markdown sources.

### Build everything (assets + pages, clean rebuild)

```bash
make all
```

### Serve locally

```bash
make serve
```

Serves the site at [http://localhost:3000](http://localhost:3000).

### Watch for changes

```bash
make watch
```

Rebuilds automatically when files in `src/` change (requires [`entr`](https://eradman.com/entrproject/)).

### Clean output

```bash
make clean
```

Removes all files in `dist/`.

---

## 📝 Writing Content

Each page is a Markdown file under `src/`.
You can include [YAML metadata](https://pandoc.org/MANUAL.html#extension-yaml_metadata_block) at the top:

```markdown
---
title-prefix: About
description-meta: About Mahmoud Ashraf
keywords: about, mahmoud
---

# About

Hello, World!
```

---

## 🎨 Styling & Templates

- Add CSS/JS/images to `public/` → they are copied into `dist/public/`.
- Modify `templates/default.html` to change layout.
- Metadata variables (`$title-prefix$`, `$body$`, etc.) are automatically injected.

---

## 💡 Tips

- Extend `pandoc.yaml` for extra filters, defaults, and styling.
- Add more navigation links in `templates/default.html`.
- Use `metadata.yaml` for site-wide defaults (e.g., site title, author).
- Deploy by serving the `dist/` folder (e.g., GitHub Pages, Netlify, or Nginx).

---

## 📜 License

MIT — free to use, modify, and share.
