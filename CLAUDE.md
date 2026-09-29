# CLAUDE.md - Flux Processing Guide

A public Quarto website that documents the chain from raw eddy covariance and meteo data to the flux product: sonicread or rECord → bico → fluxrun + EddyPro → diive, and meteo loggers → dataflow → InfluxDB → diive notebooks. Published to GitHub Pages.

## Rules

- **Public content.** Pages must be useful outside the group. Never add group-only details: database access, tokens, config folder paths, shared drive paths. Use placeholders where a site name or path is needed.
- **Text:** short and plain, one fact per bullet. Use the `/llm-detox` skill. No invented numbers or claims; unknown details stay "*To be written.*".
- **Plain sentences:** no filler sentences that only announce the next one, e.g. "One of two logging scripts does this". Put the fact into the sentence itself. No vague references such as "both then go" or "this" or "they" without a clear noun: name the thing.
- **Neutral voice:** no "you" or "your", and no commands to the reader. Describe what is done, in the passive where needed ("The logger is checked regularly"). Where a step runs: "a local installation, on demand" (add "or automatically" where the tool supports scheduled runs), not "your own computer".
- **Labels and headings:** name the topic, not a question. No "What …", "Why …" or "How …" labels or headings (e.g. "Not in the files", not "What the files lack"; "Regular format", not "Why").
- **Terms:** sonicread and rECord are logging scripts, not loggers. They run on the data logger at the site.
- **Script names** (sonicread, rECord, bico, fluxrun, dataflow, diive) always link to their script page, in every mention in the text. Exceptions: headings, code, the script's own page, and `Raw_Data_EC.md`.
- **`docs/data/Raw_Data_EC.md`** is copied as is from the CH-CHA dataset docs (only its bico and fluxrun links point to the script pages). Don't reword it unless asked.
- **Commits:** only when the user asks. Title under 50 characters, a blank line, then bullet points. No co-author line.
- **`uv` commands** and **`./deploy.ps1`** only with the user's approval. Deploy force-pushes the `gh-pages` branch.
- **Publishing:** `.github/workflows/publish.yml` does the same as `deploy.ps1` on every push to `main` that changes `docs/`. So pushing to `main` publishes the site.

## Layout

- `docs/` is the Quarto project; `_quarto.yml` holds the sidebar. A new page must be added there. Output goes to `docs/_build/html` (gitignored).
- Sidebar: the home page, then sections that follow the chart lanes: Eddy covariance, Meteo, Management data, the diive flux post-processing chain (`Flux_Post_Processing_Chain.md` with one page per level, `L2.md` … `L4.2.md`; L3.4 is a section of `QCF.md`), Flux product. Then Reference (Conventions, Sharing with FLUXNET, the data pages `data/*.md`, Abbreviations) and Scripts (`scripts/*.md`).
- **QCF** (`QCF.md`): how the overall quality flag works. The steps that build a QCF (meteo screening, L2, L3.3, L3.4) link to it instead of repeating it.
- **Processing chain:** `index.md` is the overview with the chart and one line per step. Step pages follow the order of the chart. Small neighbouring steps share a page, with a section per step: `Raw_Data_Logging.md` (logging and conversion), `Meteo_Logging.md` (logging and upload). Each step page names its box numbers, input, output, where it runs and the next step.
- **Data pages** (`docs/data/`): what a kind of data is and its format (raw and processed data, raw eddy covariance files from sonicread and rECord). **Script pages** (`docs/scripts/`): one short page per script. The process pages link to both instead of describing a format or a script again.
- Page add-ons: `_last-modified-sidebar.html` and `_theme-toggle.html` (copied from the CH-LAE dataset docs), `_chart-zoom.html` (pan, zoom, full screen for the chart).

## The chart

- **Source:** `docs/images/processing-chain.svg`, a hand-written SVG. Edit only this file. `index.md` includes it inline (`{{< include >}}` in a raw HTML block), so it follows the site's light/dark toggle.
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
