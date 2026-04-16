# LLM Wiki Template

A personal knowledge base maintained by LLM agents such as Claude Code and Codex. Based on Andrej Karpathy's [LLM Wiki](https://github.com/karpathy/llm-wiki) pattern.

## Usage

This repo is a GitHub template. To create a new wiki private project (change the flag to `--public` for public repos):

```sh
gh repo create my-new-wiki --template jesse/llm-wiki-template --clone --private
cd my-new-wiki
./setup.sh
```

The setup script will prompt you for the wiki's purpose, update `CLAUDE.md`, and create the initial folder structure (`raw/`, `wiki/index.md`, `wiki/log.md`).

## How it works

Drop source documents (PDFs, articles, notes) into `raw/` and ask Claude to ingest them. Claude will:

1. Read the source and discuss key takeaways with you
2. Create summary and concept pages in `wiki/`
3. Link related pages together with `[[wiki-links]]`
4. Keep `wiki/index.md` and `wiki/log.md` up to date

Over time the wiki compounds -- answers to your questions get filed back in, and new sources connect to existing knowledge.

## Folder structure

```
raw/          -- source documents (immutable, never modified by Claude)
wiki/         -- markdown pages maintained by Claude
wiki/index.md -- table of contents for the entire wiki
wiki/log.md   -- append-only record of all operations
```

## Requirements

- [GitHub CLI](https://cli.github.com/) (`gh`) for creating repos from the template
- [Claude Code](https://claude.ai/claude-code) or another LLM agent that reads `CLAUDE.md`

## Attribution
- The `CLAUDE.md` file was forked from [Teacher's Tech](https://go.teachers.tech/LLM_Wiki_CLAUDE)
