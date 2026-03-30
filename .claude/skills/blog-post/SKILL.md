---
name: blog-post
description: >
  Skill for writing and publishing blog posts to wadeallen.me. Use this skill when Wade wants to start, work on, or publish a blog post. This includes: creating a new draft in Drafts, helping organize or outline a post, proofreading and offering suggestions, or publishing a finished draft to the blog. Trigger on phrases like "new blog post", "start a post", "help me with my post", "proof this", "I'm ready to publish", "post this to the blog", or any mention of writing or moving content to the blog.
---

# Blog Post Skill — wadeallen.me

Handles the full blog post workflow from first draft to published post.

---

## Phase 1: Starting a new post

When Wade wants to start a new blog post:

1. Use `drafts_create_draft` to create a new blank draft with the tag "blog"
2. Use `drafts_open` to open it in Drafts so Wade can start writing
3. Let him know the draft is ready and he can write when ready

---

## Phase 2: Helping while writing

When Wade asks for help with a draft in progress (organizing, outlining, proofing, suggestions):

1. Use `drafts_get_tag` with tag "blog" to find the draft
   - If multiple drafts are tagged "blog", show titles and ask which one
2. Read the content and respond in conversation — do not edit the draft unless Wade asks
3. Offer one of the following based on what Wade asks for:
   - **Outline** — suggest a structure for the post based on what he's written
   - **Proofread** — note any typos, grammatical issues, or unclear sentences
   - **Suggestions** — offer ideas for flow, transitions, or areas to develop further
4. Wait for Wade to direct next steps — do not make changes without his instruction

---

## Phase 3: Publishing

When Wade is ready to publish:

1. Use `drafts_get_tag` with tag "blog" to find the draft
   - If multiple, show titles and ask which one to publish
2. **Suggest a title** — offer 3–4 options based on the content:
   - Short and clear (under 10 words)
   - Reflective in tone, not clickbait-y
   - True to what the post is actually about
   - Wait for Wade to choose or provide his own before continuing
3. **Build the post file:**
   - Use today's date unless Wade specifies otherwise
   - Create a slug: lowercase, hyphenated title (e.g., "The Slow Work of Trust" → `the-slow-work-of-trust`)
   - Choose 1–3 tags from the vocabulary below
   - Write the file with this exact frontmatter:

```yaml
---
title: "Title Here"
date: YYYY-MM-DD
image: true
tags: [tag1, tag2]
---
```

   Then paste Wade's content exactly as written. Do not edit or rewrite his prose.

   Save to:
   ```
   /sessions/compassionate-friendly-maxwell/mnt/wadeallen.me/_posts/YYYY-MM-DD-slug.md
   ```

4. **Confirm** — tell Wade the post filename, then walk through these steps one at a time:
   - Ask if he has run `move-image.sh` to move the image into the blog
   - Ask if he has pushed the repo to GitHub
   - Once he confirms both, ask if he would like to archive the draft in Drafts
   - If yes, use `drafts_archive` with the draft's UUID to archive it

---

## Tag vocabulary

`ministry`, `scripture`, `discernment`, `church`, `technology`, `ai`, `work-life-balance`, `writing`, `leadership`, `prayer`, `sabbath`, `community`

---

## Important

- **Do not rewrite or edit Wade's content.** His words are his own.
- **Do not add content** — no introductions, conclusions, or summaries.
- The only formatting applied is the Jekyll frontmatter block at the top.
