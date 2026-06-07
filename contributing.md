---
layout: page
title: Contributing to This Website
subtitle: You don't need to be a developer to help keep the site up to date.
description: >-
  A step-by-step guide to editing the 9th Caulfield Scout Group website —
  from simple GitHub edits through to local development and Claude Code.
---

This site is open for contributions from group members, parents, and volunteers.
Whether you've never touched code before or you're a seasoned developer, there's
a level here that'll suit you.

---

## Before you start: get access

The site lives on [GitHub](https://github.com). You'll need a free GitHub account and
write access to the repository. To request access, email
[Mark Smith](mailto:78-tune-gavotte@icloud.com) with your GitHub username and he'll
add you as a collaborator.

Don't have a GitHub account yet? Head to [github.com](https://github.com) and sign up
— it takes about two minutes.

---

## Level 1 — Edit in your browser (no setup required)

GitHub has a built-in editor that works entirely in your browser. It's perfect for
updating text, adding events or newsletters, or uploading images — no software to
install, no command line.

### Edit existing content

1. Go to the repository on GitHub and navigate to the file you want to change
   (e.g. `events.md` for the events page).
2. Click the **pencil icon** (Edit this file) in the top-right corner of the file view.
3. Make your changes in the editor.
4. Scroll to the bottom and click **Commit changes**. Add a short description of what
   you changed, then click **Commit changes** again to save.

The site rebuilds automatically within a minute or two. Refresh the live site to see
your update.

### Add a new event

Events live in `events.md`. Each event is a `##` heading followed by Markdown text.
To add one, edit `events.md` and copy the pattern of an existing event — add your new
`##` heading and description wherever it fits chronologically.

### Add a newsletter

Newsletters are individual files inside the `_newsletters/` folder, named
`YYYY-MM-DD-slug.md` (e.g. `2026-03-01-autumn-term.md`). To add one:

1. Navigate to the `_newsletters/` folder in the repository.
2. Click **Add file → Create new file**.
3. Name the file using the date format above.
4. Paste this starter block at the top, then write the newsletter content below it:

```
---
layout: newsletter
title: "Your Newsletter Title"
date: 2026-03-01
---

Newsletter content goes here...
```

5. Commit the file. The newsletter will appear automatically on the Newsletters page.

### Upload an image

1. Navigate to `assets/images/` in the repository.
2. Click **Add file → Upload files**.
3. Drag your image in (JPG or PNG), then commit.
4. Reference it in a page with `/assets/images/your-file.jpg`.

---

## Level 2 — Edit locally with VS Code

Working locally means you can preview changes before they go live. This takes a
little setup but is much more comfortable for larger edits.

### What you'll need

- [Git](https://git-scm.com/downloads) — version control
- [VS Code](https://code.visualstudio.com) — editor
- Ruby 3.3 and Jekyll — to run the local preview server

### Clone the repository

```bash
git clone https://github.com/9thcaulfield/9thcaulfieldscouts.git
cd 9thcaulfieldscouts
```

### Set up Jekyll locally

The site uses Ruby and Jekyll. The easiest way to get the right Ruby version is
[rbenv](https://github.com/rbenv/rbenv). Follow the rbenv installation guide for your
operating system, then run:

```bash
rbenv install   # installs the version in .ruby-version
gem install bundler
bundle install
```

For a more detailed Jekyll setup walkthrough, the
[official Jekyll docs](https://jekyllrb.com/docs/installation/) are the best reference.

### Preview the site

```bash
bundle exec jekyll serve
```

Open [http://localhost:4000](http://localhost:4000) in your browser. The server watches
for file changes and rebuilds automatically — just refresh your browser.

### Make changes and push

Edit files in VS Code, check the preview, then commit and push:

```bash
git add -A
git commit -m "Brief description of what you changed"
git push
```

The live site updates automatically once your push lands on `main`.

---

## Level 3 — Use Claude Code

[Claude Code](https://claude.ai/code) is an AI coding assistant that can make changes
to the site based on plain English instructions. It's great when you want to do
something more involved — restructure a page, tweak the styling, or add a new section —
but you're not sure exactly how to write the code.

### What it looks like in practice

You open the project folder in the Claude Code desktop app and describe what you want:

> "Add a new section to the Events page for the end-of-year camp. It should have a
> heading, a two-paragraph description, and link to the contact page for registrations."

Claude Code reads the relevant files, makes the edits, and shows you a diff before
anything is saved. You can review, ask it to adjust, and then commit when you're happy.

### Getting started

Download the [Claude Code desktop app](https://claude.ai/download) and sign in with
an Anthropic account. Once installed, open the app and use **File → Open Folder** to
open your local copy of the site repository. Then just describe what you'd like to
change in plain English.

---

Questions or stuck at any step? Email [Mark Smith](mailto:78-tune-gavotte@icloud.com).
