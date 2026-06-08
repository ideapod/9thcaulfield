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
| Hall hire info | `hall-hire.md` |
| Contact details | `_includes/contact-form.html` |

Edit the file, commit, and push — the site updates automatically.

---

## Adding an event

Create a new file in `_events/` named `YYYY-MM-DD-slug.md`. The file has two parts — a front matter block at the top with the structured details, and a Markdown body below with the free-form content.

```markdown
---
title: Spring Camp
date: 2024-09-20
end_date: 2024-09-22
sections:
  - Scouts
  - Cubs
location: Gilwell Park Scout Camp
address: 27 Graysharps Road, Gembrook VIC 3783
overview: >-
  A weekend camp at Gilwell Park focusing on outdoor skills and team challenges.
  Open to all Scouts and Cubs.
dropoff_time: Friday 20 Sep, 6:00 pm
dropoff_location: The Scout Hall, 20 Ricourt Ave Murrumbeena
pickup_time: Sunday 22 Sep, 2:00 pm
pickup_location: Gilwell Park Scout Camp, Gembrook
---

## Activities

- Describe the weekend's program here
- Each bullet is one activity

## Preparation for Patrol Leads

Notes for patrol leads — meal planning, equipment lists, duty rosters.

## Preparation for Patrols

What individual Scouts need to know and bring beyond the packing list.

## Preparation for Leaders

Logistics notes for leaders — transport, first aid, emergency contacts.

## Packing List

### Clothing
- Uniform shirt
- Warm layers
- Waterproof jacket
- Sturdy shoes or boots
- Hat and sunglasses

### Sleeping
- Sleeping bag (rated to at least 5°C)
- Sleeping mat

### Personal items
- Water bottle (at least 1 litre)
- Sunscreen and insect repellent
- Personal medication (notify leaders)
- Torch and spare batteries

### Food & cooking
- Patrol food as assigned
- Mug, plate, and cutlery
```

The event will appear automatically on the [Events page](https://9thcaulfieldscouts.org.au/events/) with its own detail page including a map. Past events remain listed — no need to remove them.

---

## Adding a newsletter

Create a new file in `_newsletters/` named `YYYY-MM-DD-short-title.md`:

```markdown
---
title: Term 3 Update — August 2024
date: 2024-08-01
excerpt: One sentence summary shown on the index page.
---

Newsletter content here in Markdown.

## Section heading

More content...
```

It will appear automatically on the [Newsletters page](https://9thcaulfieldscouts.org.au/newsletters/).

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
