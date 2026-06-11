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

- [Before you start: get access](#before-you-start-get-access)
- [Level 1 — Edit in your browser](#level-1--edit-in-your-browser-no-setup-required)
- [Level 2 — Edit locally with VS Code](#level-2--edit-locally-with-vs-code)
- [Level 3 — Use Claude Code](#level-3--use-claude-code)

---

## Before you start: get access

Source code control systems have been around for ever and the de-facto standard is [Git](https://git-scm.com). [GitHub](https://github.com) provides a place in the cloud for the code so that git can be used to control change to the code. 

git makes it easy for multiple people to make changes to a code base. 9th Caulfield's website code is now on github: [9thCaulfield](https://github.com/ideapod/9thcaulfield). 

You'll need a free GitHub account and write access to the repository. To request access, email
[Mark Smith](mailto:78-tune-gavotte@icloud.com) with your GitHub username and he'll
add you as a collaborator.

Don't have a GitHub account yet? Head to [github.com](https://github.com) and sign up
— it takes about two minutes.

### Clone the repository

For level 1 you don't need a local copy of the code. But for level 2 and 3, you need a local copy to work on. You get it by "cloning" the repository

```bash
git clone https://github.com/ideapod/9thcaulfield.git
cd 9thcaulfield
```

### Commit code changes

Once you have made a change locally using either level 2 or 3 you need to save the change to your local code base using commit, and then 'push' the changes up to the cloud:

```bash
git add -A
git commit -m "Brief description of what you changed"
git push
```

The live site updates automatically once your push lands on `main`, using the magic of [GitHub Actions](https://github.com/ideapod/9thcaulfield/actions). 


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

Each event is its own file inside the `_events/` folder, named `YYYY-MM-DD-slug.md`
(e.g. `2026-08-10-spring-camp.md`). To add one:

1. Navigate to the `_events/` folder in the repository.
2. Click **Add file → Create new file**.
3. Name the file using the date format above.
4. Paste this starter block at the top, fill in the details, then write the event
   content in Markdown below it:

```
---
title: Spring Camp
date: 2026-08-10
end_date: 2026-08-12
sections:
  - Scouts
  - Cubs
location: Gilwell Park Scout Camp
address: 27 Graysharps Road, Gembrook VIC 3783
overview: >-
  A weekend camp at Gilwell Park focusing on outdoor skills and team challenges.
dropoff_time: Friday 10 Aug, 6:00 pm
dropoff_location: The Scout Hall, 20 Ricourt Ave Murrumbeena
pickup_time: Sunday 12 Aug, 2:00 pm
pickup_location: Gilwell Park Scout Camp, Gembrook
---

## Activities

- List activities here

## Preparation for Patrol Leads

Notes for patrol leads.

## Preparation for Patrols

What Scouts need to know and bring.

## Preparation for Leaders

Logistics notes for leaders.

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

5. Commit the file. The event will appear automatically on the Events page with its
   own detail page, including a map of the location. Past events remain listed.

### Add a newsletter

Newsletters are individual files inside the `_newsletters/` folder, named
`YYYY-MM-DD-slug.md` (e.g. `2026-03-01-autumn-term.md`). To add one:

1. Navigate to the `_newsletters/` folder in the repository.
2. Click **Add file → Create new file**.
3. Name the file using the date format above.
4. Paste this starter block at the top, then write the newsletter content below it:

```
---
title: "Your Newsletter Title"
date: 2026-03-01
excerpt: One sentence summary shown on the newsletters index page.
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

- a local code repository (see [Git set up](#before-you-start-get-access))
- [VS Code](https://code.visualstudio.com) — editor
- [rbenv](https://github.com/rbenv/rbenv) — Ruby version manager (Mac)
- Ruby 3.3.7 and Jekyll — to run the local preview server

### Set up Ruby on Mac

The site requires Ruby 3.3.7 specifically — Ruby 4 is not compatible with Jekyll 4.
The easiest way to manage Ruby versions on a Mac is rbenv.

1. Install [Homebrew](https://brew.sh) if you don't have it already.
2. Install rbenv:

   ```bash
   brew install rbenv ruby-build
   rbenv init
   ```

3. Follow the instruction rbenv prints — it will ask you to add a line to your shell
   profile (`.zshrc` or `.bash_profile`). Do that, then open a new terminal window.

4. Install Ruby 3.3.7:

   ```bash
   rbenv install 3.3.7
   ```

   This takes a few minutes. Once done, the `.ruby-version` file in the project will
   tell rbenv to use 3.3.7 automatically whenever you're in the project folder.


### Set up Jekyll locally

With Ruby 3.3.7 installed via rbenv, run the following in the project folder:

```bash
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

Edit files in VS Code, check the preview, then [commit and push](#commit-code-changes).


---

## Level 3 — Use Claude Code

[Claude Code](https://claude.ai/code) is an AI coding assistant that can make changes
to the site based on plain English instructions. It's great when you want to do
something more involved — restructure a page, tweak the styling, or add a new section —
but you're not sure exactly how to write the code.

### Getting started

Clone a local repository (see [Git set up](#before-you-start-get-access))

Download the [Claude Code desktop app](https://claude.ai/download) and sign in with
an Anthropic account. 

Once installed, open the app and use **File → Open Folder** to
open your local copy of the site repository. 

### How to make changes using claude code

Open the project folder in the Claude Code desktop app and describe what you want:

> "Add a new section to the Events page for the end-of-year camp. It should have a
> heading, a two-paragraph description, and link to the contact page for registrations."

Claude Code reads the relevant files, makes the edits, and shows you a diff before
anything is saved. You can review, ask it to adjust, and then [commit and push](#commit-code-changes) when you're happy.


---

Questions or stuck at any step? Email [Mark Smith](mailto:78-tune-gavotte@icloud.com).
