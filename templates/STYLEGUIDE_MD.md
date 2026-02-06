# Markdown Styleguide

## Frontmatter
Required at document start:

```yaml
---
title: "Document Title"
author: "Arnesh Mandal"
version: "1.0"
date: "2026-01-30"
---
```

| Field | Display Location |
|-------|------------------|
| title | Cover page, header (page 2+) |
| author | Cover page |
| version | Cover page, header (page 2+) |
| date | Cover page only |

## Structure
One sentence per line:

```markdown
This is the first sentence.
This is the second sentence.
```

Not this:

```markdown
First sentence. Second sentence.
```

Paragraphs are separated with blank lines.
No indentation.

## Headings
| Rule | Requirement |
|------|-------------|
| Maximum depth | H3 (never H4, H5, H6) |
| Case | Title Case: `# Getting Started With the API` |
| Numbering | Automatic (do not manually number) |
| Syntax | `#` H1, `##` H2, `###` H3 |
| Spacing | No blank line after heading, blank line before next heading |

Correct spacing:

```markdown
## Section Title
First sentence of content.
Second sentence.

## Next Section
Content starts here.
```

Incorrect:
/
```markdown
## Section Title

First sentence (extra blank line).

## Next Section
Content without spacing above.
```

## Lists
| Rule | Requirement |
|------|-------------|
| Max nesting | 2 levels |
| Content | Concise, no callouts, no complex blocks |

```markdown
- Parent item
  - Child item
1. First item
2. Second item
```

## Tables
Caption mandatory (`:` line immediately after table, no blank line):

```markdown
| Column A | Column B |
|----------|----------|
| Data     | Data     |
: Caption describing the table
```

No complex content in cells.
Keep cell content concise.

## Code
Inline code uses backticks: `` `print()` ``

Code blocks always specify language.
Aim for under 80 characters per line (wrapping enabled).
No blank line before code block.

````markdown
```python
def hello():
    print("world")
```
````

## Callouts
```markdown
::: note
Content here.
:::
```

| Rule | Types: `note`, `tip`, `warning`, `important` |
|------|----------------------------------------------|
| Placement | Never inside lists or tables |
| Nesting | Never nested |
| Content | Keep concise |

## Images
Only when absolutely necessary or explicitly requested.

Real image: `![Caption](path/to/image.png)`

Placeholder:

```markdown
::: image-placeholder
Figure: Title of the Figure
Description: What the image should show.
Dimensions: full-width
:::
```

| Field | Required | Values |
|-------|----------|--------|
| Figure | Yes | Title text |
| Description | Yes | What image should show |
| Dimensions | No | `full-width` (default), `half-width` |

Supported formats: PNG, JPG, PDF.

## Links
Use descriptive text: `[link text](url)`

Not this: `Click [here](url)` or raw URLs.

## Block Quotes
Use `> text` for block quotes.
Can span multiple lines.
Use sparingly.

## Horizontal Rules
Use `---` for thematic breaks.
Use sparingly.

## Footnotes
Use `text[^1]` with `[^1]: Note here.` at document end.
Use sparingly.

## Prohibited
| Prohibited | Example |
|------------|---------|
| Raw LaTeX | `\newpage`, `\textbf{}` |
| Inline HTML | `<div>`, `<br>`, `<strong>` |
| Manual styling | Fonts, colors, spacing, alignment, page breaks |

The template handles all visual decisions.

## Summary
| Rule | Requirement |
|------|-------------|
| Frontmatter | Required (title, author, version, date) |
| Line structure | One sentence per line |
| Heading depth | Maximum H3 |
| Heading case | Title Case |
| Table captions | Mandatory |
| Code language | Always specified |
| Callout placement | Outside lists and tables |
| Images | Only when necessary |
| Raw LaTeX / HTML | Prohibited |
