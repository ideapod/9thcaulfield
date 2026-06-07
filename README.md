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
| Meeting times or section info | `index.md` |
| About / history text | `about.md` |
| Upcoming events | `events.md` |
| Hall hire info | `hall-hire.md` |
| Contact details | `contact.md` |

Edit the file, commit, and push — the site updates automatically.

---

## Adding a newsletter

Create a new file in `_newsletters/` named `YYYY-MM-DD-short-title.md`:

```
---
title: Term 3 Update — August 2024
date: 2024-08-01
excerpt: One sentence summary shown on the index page.
---

Newsletter content here in Markdown...
```

It will appear automatically on the [Newsletters page](/newsletters/).

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

## DNS (GoDaddy)

To point the domain at GitHub Pages, set these records:

| Type | Name | Value |
|------|------|-------|
| A | `@` | `185.199.108.153` |
| A | `@` | `185.199.109.153` |
| A | `@` | `185.199.110.153` |
| A | `@` | `185.199.111.153` |
| CNAME | `www` | `ideapod.github.io` |

After pushing DNS changes, go to **GitHub → Settings → Pages**, set the custom domain to `9thcaulfieldscouts.org.au`, and enable **Enforce HTTPS**.

---

## Contact form

The contact form uses [Web3Forms](https://web3forms.com) (free, no backend needed). To configure it:

1. Sign up at web3forms.com with your email
2. Copy your access key (a UUID)
3. Paste it into `contact.md` replacing the value of the hidden `access_key` input

Form submissions are emailed directly to whichever address you registered with.
