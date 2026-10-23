# Personal academic website (Quarto)

A minimal research site: top navbar, author card on the left, text on the right.

## Where to edit

| What | File |
|---|---|
| Name, menu items, footer | `_quarto.yml` |
| Photo, title, location, social links | `_author.html` (put your photo in `images/` and update the `src`) |
| Home page text | `index.qmd` |
| Research, Teaching, Data, CV pages | `research.qmd`, `teaching.qmd`, `data.qmd`, `cv.qmd` |
| PDFs (CV, papers, syllabi) | `files/` |
| Colours, fonts, spacing | `styles.scss` |

Icons in `_author.html` come from Bootstrap Icons (https://icons.getbootstrap.com), for example `bi-linkedin` or `bi-twitter-x`.

## Preview while editing

```bash
quarto preview
```

## Publish to GitHub Pages

1. Create a GitHub repository named `osorio-krauter.github.io` and push this folder to it.
2. Run:

```bash
quarto publish gh-pages
```
