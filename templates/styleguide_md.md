# Markdown Styleguide

## Frontmatter
Required fields at document start:
```yaml
---
title: "Document Title"
author: "Arnesh Mandal"
version: "1.0"
date: "2026-01-30"
---
```

## Structure
- One sentence per line
- Paragraphs separated by blank lines
- No indentation

## Headings
- Max depth: H3 (no H4+)
- Title Case: `# Getting Started With the API`
- Auto-numbered (never manual)
- No blank line after heading, blank line before next heading

## Lists
- Max 2 levels nesting
- No callouts or complex blocks inside

```markdown
- Parent
  - Child
1. First
2. Second
```

## Tables
Caption mandatory (`:` line immediately after, no blank):
```markdown
| Col A | Col B |
|-------|-------|
| Data  | Data  |
: Table caption
```

## Code
- Inline: `` `code` ``
- Blocks: always specify language, aim <80 chars, no blank line before

````markdown
```python
def hello():
    print("world")
```
````

## Callouts
Types: `note`, `tip`, `warning`, `important`
Never inside lists/tables or nested.

```markdown
::: note
Content here.
:::
```

## Images
Use only when necessary. Formats: PNG, JPG, PDF.

Real: `![Caption](path.png)`

Placeholder:
```markdown
::: image-placeholder
Figure: Title
Description: What it shows
Dimensions: full-width
:::
```

## Links
`[descriptive text](url)` - never "click here" or raw URLs

## Other Elements
- **Block quotes**: `> text` (use sparingly)
- **Horizontal rules**: `---` (use sparingly)
- **Footnotes**: `text[^1]` + `[^1]: Note` at end (use sparingly)

## Prohibited
No raw LaTeX (`\newpage`), HTML (`<div>`), or manual styling (fonts/colors/spacing).
Template handles all visual decisions.
