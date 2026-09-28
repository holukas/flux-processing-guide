# CLAUDE.md - Flux Processing Guide

A public Quarto website that documents the chain from raw eddy covariance and meteo data to the flux product: sonicread or rECord → bico → fluxrun + EddyPro → diive, and meteo loggers → dataflow → InfluxDB → diive notebooks. Published to GitHub Pages.

## Rules

- **Public content.** Pages must be useful outside the group. Never add group-only details: database access, tokens, config folder paths, shared drive paths. Use placeholders where a site name or path is needed.
- **Text:** short and plain, one fact per bullet. Use the `/llm-detox` skill. No invented numbers or claims; unknown details stay "*To be written.*".
- **`docs/data/Raw_Data_EC.md`** is copied as is from the CH-CHA dataset docs (only its bico and fluxrun links point to the script pages). Don't reword it unless asked.
- **Commits:** only when the user asks. Title under 50 characters, a blank line, then bullet points. No co-author line.
- **`uv` commands** and **`./deploy.ps1`** only with the user's approval. Deploy force-pushes the `gh-pages` branch.
- **Publishing:** `.github/workflows/publish.yml` does the same as `deploy.ps1` on every push to `main` that changes `docs/`. So pushing to `main` publishes the site.

## Layout

- `docs/` is the Quarto project; `_quarto.yml` holds the sidebar. A new page must be added there. Output goes to `docs/_build/html` (gitignored).
- Sidebar sections: Processing chain, Data (`data/*.md`), Reference (Conventions, QCF, Sharing with FLUXNET, Abbreviations: definitions and topics used across the steps), Scripts (`scripts/*.md`).
- **QCF** (`QCF.md`): how the overall quality flag works. The steps that build a QCF (meteo screening, L2, L3.3, L3.4) link to it instead of repeating it.
- **Processing chain:** `Processing_Chain.md` is the overview with the chart. Below it, one page per step of the chart, as one flat list without subsections, in the order of the chart: eddy covariance, meteo, management, `Flux_Processing_Chain.md` followed by one page per level (`L2.md` … `L4.2.md`), and the flux product. Each step page names its box numbers, input, output, where it runs and the next step.
- **Data pages** (`docs/data/`): what a kind of data is and its format (raw and processed data, raw eddy covariance files from sonicread and rECord). **Script pages** (`docs/scripts/`): one short page per script. The process pages link to both instead of describing a format or a script again.
- Page add-ons: `_last-modified-sidebar.html` and `_theme-toggle.html` (copied from the CH-LAE dataset docs), `_chart-zoom.html` (pan, zoom, full screen for the chart).

## The chart

- **Source:** `docs/images/processing-chain.svg`, a hand-written SVG. Edit only this file. `index.md` and `Processing_Chain.md` include it inline (`{{< include >}}` in a raw HTML block), so it follows the site's light/dark toggle.
- **Styles are scoped to `svg.fpg-chart`.** Inline in the page, an unscoped rule would also style the page. Colours are CSS variables: on its own the SVG follows the system setting; on the site `body.quarto-light` / `body.quarto-dark` override it.
- **Box numbers** (1-18) are what the user refers to. Keep existing numbers; a new box gets the next free number.
- **Links:** each box, level row and legend item is an `<a class="box">` to its page. The `href` is relative to the SVG file (`../L0.html`), so it works in "Open image"; `_chart-zoom.html` resolves it for the inline chart. A new box gets a link too.
- **Positions are set by hand.** Check for overlaps after every change. Draw an arrow after the box it enters, or the box covers the arrowhead.
- **Conventions:** one colour per tool (bico teal, fluxrun + EddyPro coral, dataflow and database blue, diive amber); data files dashed; diive notebooks carry the notebook icon and their file name in monospace; the key icon means "needs configs + configs_secret"; grey pills say where a step runs (on site, VM (gl-calcs), user); square pills on the bottom edge (`.res`) give the time resolution (20 Hz, high-res, 30 min, or e.g. `20 Hz → 30 min` for a step that changes it).
- `images/` is listed under the project `resources`: the chart is only included inline, so Quarto would not copy the SVG, and the "Open image" button needs it.
- **Review:** `tools/chart-preview.html` reloads on every save and has Light, Dark and System buttons. Show the chart to the user there, not as a file.

## Build and preview

```bash
uv sync                     # Quarto and ghp-import
./preview.ps1               # live preview of the site (quarto preview docs)
uv run quarto render docs   # build into docs/_build/html
./preview-chart.ps1         # chart preview page on port 8897
./deploy.ps1                # build and publish to GitHub Pages (only when asked)
```
