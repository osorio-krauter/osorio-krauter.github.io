# My website

Live at <https://osorio-krauter.github.io>. Built with [Quarto](https://quarto.org).

## Which file changes what

| What you want to change | File |
|---|---|
| Name, title, location, photo, links on the left | `_profile.yml` |
| Home page (About text) | `index.qmd` |
| Research, Teaching, Data and CV pages | `research.qmd`, `teaching.qmd`, `data.qmd`, `cv.qmd` |
| Name in the top bar, menu items, footer | `_quarto.yml` |
| Photo and other pictures | the `images` folder |
| PDFs (CV, papers, syllabi) | the `files` folder, then link them, e.g. `[CV](files/cv.pdf)` |
| Colours, fonts, spacing | `styles.scss` |

The `.qmd` pages are plain text with Markdown: `**bold**`, `*italic*`,
`[link text](https://...)`, `## Heading`, `- list item`.

## Editing in RStudio

1. Double-click `website.Rproj` to open the website in RStudio.
2. Open a file from the **Files** pane (bottom right), change it, and save.
3. To see your changes, open the **Terminal** tab (bottom left) and run:

   ```bash
   quarto preview
   ```

   A preview opens in your browser and refreshes every time you save. Press
   `Ctrl+C` in the Terminal to stop it.

## Putting your changes online

In RStudio's **Terminal**, run:

```bash
quarto publish gh-pages
```

Answer `Y` if it asks. After a minute or two the live site updates; refresh
your browser if you still see the old version.

## Backing up your files on GitHub

Publishing only uploads the finished website. To also save your source files
on GitHub, use the **Git** tab (top right in RStudio): tick the changed files,
click **Commit**, write a short note, click **Commit**, then click **Push**.

Or in the Terminal:

```bash
git add -A
git commit -m "Update my details"
git push
```
