# LLM Wiki

A personal knowledge base maintained by LLM agents such as Claude Code and Codex. Based on Andrej Karpathy's LLM Wiki pattern.

## Purpose

TKTK

## Folder structure

```
raw/          -- source documents (immutable -- never modify these)
wiki/         -- markdown pages maintained by Claude
wiki/index.md -- table of contents for the entire wiki
wiki/log.md   -- append-only record of all operations
```

## Ingest workflow

When the user adds a new source to `raw/` and asks you to ingest it:

1. Read the full source document
2. Discuss key takeaways with the user before writing anything
3. Create a summary page in `wiki/` named after the source
4. Create or update concept pages for each major idea or entity
5. Add wiki-links ([[page-name]]) to connect related pages
6. Update `wiki/index.md` with new pages and one-line descriptions
7. Append an entry to `wiki/log.md` with the datetime, source name, and what changed

A single source may touch multiple wiki pages. That is normal.

## Page format

Every wiki page should follow this structure:

```markdown
# Page Title

**Summary**: One to two sentences describing this page.

**Sources**: List of raw source files this page draws from.

**Last updated**: Datetime of most recent update.

---

Main content goes here. Use clear headings and short paragraphs.

Link to related concepts using [[wiki-links]] throughout the text.

## Related pages

- [[related-concept-1]]
- [[related-concept-2]]
```

## Citation rules

- Every factual claim should reference its source file
- Use the format (source: filename.pdf) after the claim
- If two sources disagree, note the contradiction explicitly
- If a claim has no source, mark it as needing verification

## Question answering

When the user asks a question:

1. Read `wiki/index.md` first to find relevant pages
2. Read those pages and synthesize an answer
3. Cite specific wiki pages in your response
4. If the answer is not in the wiki, say so clearly
5. If the answer is valuable, offer to save it as a new wiki page

Good answers should be filed back into the wiki so they compound over time.

## Lint

When the user asks you to lint or audit the wiki:

- Check for contradictions between pages
- Find orphan pages (no inbound links from other pages)
- Identify concepts mentioned in pages that lack their own page
- Flag claims that may be outdated based on newer sources
- Check that all pages follow the page format above
- Report findings as a numbered list with suggested fixes

## Rules

- Never modify anything in the `raw/` folder
- Always update `wiki/index.md` and `wiki/log.md` after changes.
- Get the current time by running `date "+%m/%d/%Y %I:%M%p %Z"` before writing timestamps.
- Datetime format should be MM/DD/YYYY HH:MMam/pm Timezone (ex: 10/31/2025 1:15pm EST)
- Always include a timestamp at the top of the document for any edits, with format: "Last edited: <timstamp>"
- Keep page names lowercase with hyphens (e.g. `machine-learning.md`)
- Write in clear, plain language. Avoid jargon.
- When synthesizing research, update findings in existing documents rather than creating new ones.
- Only create a new document when necessary, but ask the user.
- When uncertain about how to categorize something, ask the user.
