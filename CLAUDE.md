# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Static Jekyll site for 9th Caulfield Scout Group, migrated from WordPress. Hosted on GitHub Pages with a custom domain (`9thcaulfieldscouts.org.au`). No CMS — content is edited directly in Markdown files and pushed to `main`.

## Local development

Ruby version is pinned to 3.3.7 via `.ruby-version` (managed by rbenv). The system Ruby on this machine is 2.6 and must not be used.

```bash
bundle exec jekyll serve        # live preview at http://localhost:4000
bundle exec jekyll build        # one-off build into _site/
```

**Why `_plugins/liquid_patch.rb` exists**: Liquid 4.0.3 (bundled with Jekyll 4) calls `Object#tainted?` which was removed in Ruby 3.2. The plugin monkey-patches it back in as a no-op. Do not remove it.

## Deployment

Every push to `main` triggers `.github/workflows/pages.yml`, which builds with `ruby/setup-ruby` + `actions/configure-pages` and deploys to GitHub Pages. The `configure-pages` action sets `baseurl` automatically — do not pass `--baseurl` to the jekyll build command or asset paths will break.

Live site after each push: **https://ideapod.github.io/9thcaulfield/** (or https://9thcaulfieldscouts.org.au once DNS is pointed). Build status is visible under the Actions tab in the GitHub repo.

## Architecture

- **Pages**: top-level `.md` files (`index.md`, `about.md`, etc.) use `layout: page` except the home page which uses `layout: default` and contains raw HTML sections for the hero and section grid.
- **Layouts**: `default.html` is the shell (head, header include, footer include). `page.html` extends default and adds a purple hero band with the page title. `newsletter.html` extends default similarly.
- **Includes**: `header.html` contains the sticky nav with a vanilla-JS hamburger toggle. `footer.html` reads `site.email` and `site.address` from `_config.yml`.
- **Newsletters**: `_newsletters/` is a Jekyll collection. Each file is a dated Markdown file (`YYYY-MM-DD-slug.md`). The index is `newsletters.md` which loops over `site.newsletters`. Adding a new entry requires no config changes — just add the file.
- **CSS**: single file `assets/css/main.css`. No preprocessor. CSS custom properties for colours are defined at `:root`. Mobile nav is handled with a `.open` class toggled by the hamburger button in `header.html`.
- **Images**: all in `assets/images/`. Originated from the WordPress `wp-content/uploads/` mirror (kept locally at `9thcaulfieldscouts.org.au/` but excluded from git and from the Jekyll build).

## Content site map

| File | Page |
|------|------|
| `index.md` | Home — hero, section tiles (Joeys/Cubs/Scouts/Venturers/Rovers) with meeting times |
| `about.md` | About Us — history narrative and historical photos |
| `events.md` | Events — currently empty placeholder |
| `hall-hire.md` | Hall Hire — facilities info and hall photos |
| `contact.md` | Contact Us — Web3Forms embed + address/email |
| `newsletters.md` | Newsletter index — auto-generated from `_newsletters/` |

## Contact form

`contact.md` embeds a Web3Forms form. The access key (`value=` on the hidden `access_key` input) must be a valid UUID obtained from web3forms.com. Submissions are emailed to whichever address was used to register the key.

## Markdown in HTML divs

The contact page uses `<div markdown="1">` to enable kramdown processing inside HTML blocks. Other pages that mix HTML and Markdown must do the same if they expect Markdown inside a div to render.
