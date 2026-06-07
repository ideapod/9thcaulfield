# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Static Jekyll site for 9th Caulfield Scout Group, migrated from WordPress. Hosted on GitHub Pages with custom domain `9thcaulfieldscouts.org.au`. No CMS — content is edited directly in Markdown files and pushed to `main`.

## Local development

Ruby version is pinned to 3.3.7 via `.ruby-version` (managed by rbenv). The system Ruby on this machine is 2.6 and must not be used.

```bash
bundle exec jekyll serve        # live preview at http://localhost:4000
bundle exec jekyll build        # one-off build into _site/
```

**Why `_plugins/liquid_patch.rb` exists**: Liquid 4.0.3 (bundled with Jekyll 4) calls `Object#tainted?` which was removed in Ruby 3.2. The plugin monkey-patches it back in as a no-op. Do not remove it.

## Deployment

Every push to `main` triggers `.github/workflows/pages.yml`, which builds with `ruby/setup-ruby` + `actions/configure-pages` and deploys to GitHub Pages. The `configure-pages` action sets `baseurl` via `steps.pages.outputs.base_path` — this is passed to `bundle exec jekyll build --baseurl`. Do not hardcode `--baseurl ""` or asset paths will break when served from a subpath.

Live site: **https://9thcaulfieldscouts.org.au** — build status visible under the Actions tab.

## Architecture

- **Pages**: top-level `.md` files containing plain Markdown. The home page (`index.md`) is just three `{% include %}` tags. All HTML is in `_includes/`.
- **Layouts**: `default.html` is the shell (head, header, footer). `page.html` extends default and adds a purple hero band with the page title. `newsletter.html` extends default similarly.
- **Includes**: all presentational HTML lives here. `header.html` contains the sticky nav with a vanilla-JS hamburger toggle. `footer.html` reads `site.email` and `site.address` from `_config.yml` and includes a Google Maps embed. Page-specific HTML blocks follow the pattern `home-hero.html`, `home-sections.html`, `about-photos.html` etc.
- **Newsletters**: `_newsletters/` is a Jekyll collection. Each file is a dated Markdown file (`YYYY-MM-DD-slug.md`). The index is `newsletters.md` which loops over `site.newsletters`. Adding a new entry requires no config changes — just add the file.
- **CSS**: single file `assets/css/main.css`. No preprocessor. CSS custom properties for colours defined at `:root`. Mobile nav uses a `.open` class toggled by the hamburger button in `header.html`.
- **Images**: all in `assets/images/`. Originated from the WordPress `wp-content/uploads/` mirror (kept locally at `9thcaulfieldscouts.org.au/` but excluded from git and from the Jekyll build via `_config.yml` exclude list).

## Content site map

| File | Page |
|------|------|
| `index.md` | Home — includes hero, section tiles, CTA strip |
| `about.md` | About Us — history narrative, includes photo grids |
| `events.md` | Events — plain Markdown, one event per `##` heading |
| `hall-hire.md` | Hall Hire — facilities list, includes hall photos |
| `contact.md` | Contact Us — includes Web3Forms form + address |
| `newsletters.md` | Newsletter index — auto-generated from `_newsletters/` |

## HTML includes pattern

Content files are plain Markdown. When a page needs HTML (image grids, forms, styled cards), it lives in `_includes/` and is referenced with `{% include filename.html %}`. This keeps `.md` files readable for non-technical editors. Do not put HTML directly in `.md` files.

## Contact form

The Web3Forms access key is in `_includes/contact-form.html` on the hidden `access_key` input. Obtain keys at web3forms.com — submissions are emailed to whichever address was used to register the key.

## Asset paths

The site is served from the root domain so all asset paths are plain absolute paths e.g. `/assets/images/foo.jpg`. Do not use the `relative_url` Liquid filter — it was removed when the custom domain was configured.
