# 9th Caulfield Scout Group — Website

Static site for [9thcaulfieldscouts.org.au](https://9thcaulfieldscouts.org.au), built with Jekyll and hosted on GitHub Pages.

## How it works

- Content lives in Markdown files (`.md`) in this folder
- Push to `main` → GitHub automatically builds and publishes the site within ~30 seconds
- No CMS, no server, no WordPress — just files in Git

**Live site:** https://9thcaulfieldscouts.org.au  
**Build status:** [Actions tab](https://github.com/ideapod/9thcaulfield/actions)

---

## Updating content

Most updates only require editing one file:

| What to change | File to edit |
|----------------|--------------|
| Meeting times or section info | `_includes/home-sections.html` |
| Hero text on home page | `_includes/home-hero.html` |
| About / history text | `about.md` |
| Upcoming events | `events.md` |
| Hall hire info | `hall-hire.md` |
| Contact details | `_includes/contact-form.html` |

Edit the file, commit, and push — the site updates automatically.

---

## Adding a newsletter

Create a new file in `_newsletters/` named `YYYY-MM-DD-short-title.md`:

```markdown
---
title: Term 3 Update — August 2024
date: 2024-08-01
excerpt: One sentence summary shown on the index page.
---

Newsletter content here in Markdown...
```

It will appear automatically on the [Newsletters page](https://9thcaulfieldscouts.org.au/newsletters/).

---

## Adding an event

In `events.md`, copy this block for each event:

```markdown
## Event Name

**Venue Name, Suburb**
Date(s)
```

Remove old events when they have passed.

---

## Local preview (optional)

Requires [rbenv](https://github.com/rbenv/rbenv) with Ruby 3.3.7.

```bash
# One-time setup
rbenv install 3.3.7
gem install bundler
bundle install

# Start local server
bundle exec jekyll serve
```

Then open http://localhost:4000. The site rebuilds automatically when you save a file.

---

## Adding images

Place image files in `assets/images/`. Reference them in Markdown as:

```markdown
![Description of image](/assets/images/your-image.jpg)
```

Or in HTML includes:

```html
<img src="/assets/images/your-image.jpg" alt="Description of image">
```

---

## Contact form

The contact form uses [Web3Forms](https://web3forms.com) (free, no backend needed). The access key is in `_includes/contact-form.html`. To change the delivery email, register a new key at web3forms.com and update that file.

---

## DNS records (GoDaddy)

| Type | Name | Value |
|------|------|-------|
| A | `@` | `185.199.108.153` |
| A | `@` | `185.199.109.153` |
| A | `@` | `185.199.110.153` |
| A | `@` | `185.199.111.153` |
| CNAME | `www` | `ideapod.github.io` |

GitHub Pages provides TLS automatically via Let's Encrypt — no separate SSL certificate needed.
