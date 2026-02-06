# Design Specification

Complete visual design specification for the PDF documentation system.

---

## 1. Color Palette

### Primary Colors

| Role | Hex | Description |
|------|-----|-------------|
| Primary | `#181826` | Dark navy-purple (text, headings) |
| Secondary | `#ca9ee6` | Soft lavender (accent, links) |

### Full Palette

| Role | Hex | Usage |
|------|-----|-------|
| Page background | `#faf7f2` | Warm cream off-white |
| Body text | `#181826` | Primary, all body copy |
| Heading text | `#181826` | Same as body |
| Secondary text | `#3d3d4d` | Captions, table captions, metadata |
| Tertiary text | `#5d5d6d` | Footer, header, subtle labels |
| Code background | `#f0ece4` | Warm tan, slightly darker than page |
| Callout background | `#f4f0e8` | Between page and code bg |
| Table rules | `#d4d0c6` | Warm gray horizontal lines |
| Table header bg | `#f0ece4` | Same as code background |
| Link text | `#ca9ee6` | Secondary color |
| Accent muted | `#a080c0` | Darker lavender for borders |
| Placeholder bg | `#ece8e0` | Image placeholder background |
| Placeholder border | `#c4c0b6` | Dashed border for placeholders |

---

## 2. Typography

### Font Families

| Role | Font | Fallback |
|------|------|----------|
| Body | Inter | Source Sans Pro |
| Code | JetBrains Mono | Fira Mono |

### Font Sizes

| Element | Size | Weight | Color |
|---------|------|--------|-------|
| Body text | 10pt | Regular (400) | `#181826` |
| H1 | 16pt | Semibold (600) | `#181826` |
| H2 | 13pt | Semibold (600) | `#181826` |
| H3 | 11pt | Medium (500) | `#181826` |
| Code inline | 9pt | Regular (400) | `#181826` |
| Code block | 9pt | Regular (400) | `#181826` |
| Caption | 9pt | Regular (400) | `#3d3d4d` |
| Header | 8pt | Regular (400) | `#5d5d6d` |
| Footer | 8pt | Regular (400) | `#5d5d6d` |
| TOC entry | 10pt | Regular (400) | `#181826` |
| TOC page number | 10pt | Regular (400) | `#3d3d4d` |

### Line Height

Body text: 1.4

---

## 3. Page Layout

| Property | Value |
|----------|-------|
| Page size | A4 (210mm × 297mm) |
| Top margin | 20mm |
| Bottom margin | 20mm |
| Left margin | 25mm |
| Right margin | 25mm |
| Text width | 160mm |
| Line height | 1.4 |
| Paragraph spacing | 6pt (0.5em) |
| Paragraph indent | 0 |

---

## 4. Headings

### Format

Numbered, Title Case.

### Numbering Scheme

```
1 Section Title
1.1 Subsection Title
1.1.1 Sub-subsection Title
```

### Styling

| Level | Size | Weight | Spacing Above | Spacing Below |
|-------|------|--------|---------------|---------------|
| H1 | 16pt | Semibold (600) | 24pt | 12pt |
| H2 | 13pt | Semibold (600) | 18pt | 8pt |
| H3 | 11pt | Medium (500) | 14pt | 6pt |

### Rules

- Maximum depth: H3 (never H4 or deeper)
- Orphan control: Minimum 2 lines must follow heading on same page
- No page break immediately after heading

---

## 5. Table of Contents (Page 1)

| Property | Value |
|----------|-------|
| Document title | 16pt, Semibold, `#181826` |
| Author/version/date | 9pt, Regular, `#3d3d4d` |
| TOC title | "Contents" — 13pt, Semibold, `#181826` |
| TOC depth | H2 only |
| Entry font | 10pt, Regular, `#181826` |
| Page numbers | Right-aligned, 10pt, `#3d3d4d` |
| Leader | None (clean space) |
| Entry spacing | 6pt between entries |
| Section spacing | 12pt above TOC title |

### Page 1 Layout

```
Document Title
Author Name · v1.0 · January 2026

Contents

1 First Section                                    2
2 Second Section                                   4
3 Third Section                                    7
```

No header or footer on page 1.

---

## 6. Header (Page 2+)

| Property | Value |
|----------|-------|
| Position | Top right |
| Distance from top | 10mm |
| Font | Inter, 8pt, Regular |
| Color | `#5d5d6d` |
| Format | `Document Title | v1.0` |
| Separator | Pipe character with spaces |

---

## 7. Footer (Page 2+)

| Property | Value |
|----------|-------|
| Position | Bottom right |
| Distance from bottom | 10mm |
| Font | Inter, 8pt, Regular |
| Color | `#5d5d6d` |
| Format | Page number only (e.g., `3`) |

---

## 8. Body Text

| Property | Value |
|----------|-------|
| Font | Inter, 10pt, Regular |
| Color | `#181826` |
| Line height | 1.4 |
| Paragraph spacing | 6pt |
| Paragraph indent | 0 |
| Text alignment | Left (ragged right) |

---

## 9. Tables

### Structure

| Property | Value |
|----------|-------|
| Font | Inter, 10pt |
| Header row weight | Semibold (600) |
| Header row color | `#181826` |
| Header row background | `#f0ece4` |
| Body row weight | Regular (400) |
| Body row color | `#181826` |
| Alternating row bg | None |
| Cell padding vertical | 6pt |
| Cell padding horizontal | 8pt |

### Rules

| Rule | Value |
|------|-------|
| Vertical rules | None |
| Top rule | 0.75pt, `#d4d0c6` |
| Header bottom rule | 0.75pt, `#d4d0c6` |
| Body row rules | 0.5pt, `#d4d0c6` |
| Bottom rule | 0.75pt, `#d4d0c6` |

### Caption

| Property | Value |
|----------|-------|
| Position | Below table |
| Font | Inter, 9pt, Italic |
| Color | `#3d3d4d` |
| Format | "Table 1: Caption text" |
| Spacing above | 6pt |
| Numbering | Automatic |

---

## 10. Code Blocks

| Property | Value |
|----------|-------|
| Font | JetBrains Mono, 9pt, Regular |
| Text color | `#181826` |
| Background | `#f0ece4` |
| Padding | 10pt all sides |
| Border | None |
| Border radius | 0 (sharp corners) |
| Line wrapping | Enabled |
| Margin above | 8pt |
| Margin below | 8pt |

### Syntax Highlighting (Muted)

| Token | Color | Style |
|-------|-------|-------|
| Keyword | `#181826` | Bold |
| String | `#a080c0` | Normal |
| Comment | `#5d5d6d` | Italic |
| Number | `#3d3d4d` | Normal |
| Function | `#181826` | Normal |
| Operator | `#181826` | Normal |
| Variable | `#181826` | Normal |

---

## 11. Inline Code

| Property | Value |
|----------|-------|
| Font | JetBrains Mono, 9pt |
| Text color | `#181826` |
| Background | `#f0ece4` |
| Padding | 2pt horizontal, 1pt vertical |
| Border | None |

---

## 12. Callouts / Admonitions

### Common Styling

| Property | Value |
|----------|-------|
| Background | `#f4f0e8` |
| Text color | `#181826` |
| Font | Inter, 10pt |
| Padding | 12pt all sides |
| Padding left | 16pt (after border) |
| Left border width | 3pt solid |
| Margin above | 12pt |
| Margin below | 12pt |

### Type-Specific Styling

| Type | Left Border Color | Icon | Icon Color |
|------|-------------------|------|------------|
| note | `#8d8d9d` | ℹ | `#5d5d6d` |
| tip | `#ca9ee6` | ✦ | `#5d5d6d` |
| warning | `#d4a574` | ⚠ | `#5d5d6d` |
| important | `#a080c0` | ★ | `#5d5d6d` |

### Icon Styling

| Property | Value |
|----------|-------|
| Size | 10pt |
| Position | Inline with first line, before text |
| Spacing after icon | 6pt |

---

## 13. Images & Figures

| Property | Value |
|----------|-------|
| Width | 100% text width (default) |
| Alignment | Centered |
| Margin above | 12pt |
| Margin below | 6pt (before caption) |

### Caption

| Property | Value |
|----------|-------|
| Position | Below image |
| Font | Inter, 9pt, Italic |
| Color | `#3d3d4d` |
| Format | "Figure 1: Caption text" |
| Spacing above | 6pt |
| Spacing below | 12pt |
| Numbering | Automatic |

---

## 14. Image Placeholder

| Property | Value |
|----------|-------|
| Background | `#ece8e0` |
| Border | 1pt dashed `#c4c0b6` |
| Height | 60pt |
| Text font | Inter, 9pt, Regular |
| Text color | `#5d5d6d` |
| Text alignment | Centered (horizontal and vertical) |
| Content | Figure title + description from Markdown |
| Margin above | 12pt |
| Margin below | 12pt |

---

## 15. Links

| Property | Value |
|----------|-------|
| Color | `#ca9ee6` |
| Underline | None |
| Weight | Same as surrounding text |
| Hover | N/A (PDF) |

---

## 16. Horizontal Rules

| Property | Value |
|----------|-------|
| Thickness | 0.5pt |
| Color | `#d4d0c6` |
| Width | 100% text width |
| Margin above | 12pt |
| Margin below | 12pt |

---

## 17. Lists

### Unordered Lists

| Property | Value |
|----------|-------|
| Bullet character | • |
| Bullet color | `#181826` |
| Indent per level | 16pt |
| Max depth | 2 levels |
| Item spacing | 4pt |
| Nested bullet | ◦ (open circle) |

### Ordered Lists

| Property | Value |
|----------|-------|
| Number format | 1. 2. 3. |
| Number color | `#181826` |
| Indent per level | 16pt |
| Max depth | 2 levels |
| Item spacing | 4pt |
| Nested format | a. b. c. |

---

## 18. Block Quotes

| Property | Value |
|----------|-------|
| Left border | 3pt solid `#d4d0c6` |
| Padding left | 12pt (after border) |
| Text color | `#3d3d4d` |
| Font style | Italic |
| Margin above | 12pt |
| Margin below | 12pt |

---

## 19. Footnotes

| Property | Value |
|----------|-------|
| Reference style | Superscript number |
| Reference color | `#ca9ee6` |
| Note font | Inter, 8pt |
| Note color | `#3d3d4d` |
| Separator | 30mm rule, 0.5pt, `#d4d0c6` |
| Position | Bottom of page |

---

## 20. Visual Summary

```
┌─────────────────────────────────────────────────────────────────────┐
│                                                                     │
│  Page background: #faf7f2 (warm cream)                              │
│                                                                     │
│  ════════════════════════════════════════════════════════════════   │
│  PAGE 1 (Cover + TOC) — No header/footer                            │
│  ════════════════════════════════════════════════════════════════   │
│                                                                     │
│      Document Title                          ← 16pt Semibold        │
│      v1.0 · January 2026                     ← 9pt #3d3d4d          │
│                                                                     │
│      Contents                                ← 13pt Semibold        │
│                                                                     │
│      1 First Section                                    2           │
│      2 Second Section                                   4           │
│      3 Third Section                                    7           │
│                                                                     │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────┐
│                                     Document Title │ v1.0   ← 8pt   │
│                                                                     │
│  ════════════════════════════════════════════════════════════════   │
│  PAGE 2+ — With header/footer                                       │
│  ════════════════════════════════════════════════════════════════   │
│                                                                     │
│  1 Section Title                             ← 16pt Semibold        │
│                                                                     │
│  Body text in Inter 10pt #181826 on warm cream background.          │
│  Comfortable line height of 1.4, no paragraph indent.               │
│  Links appear in soft lavender #ca9ee6.                             │
│                                                                     │
│  1.1 Subsection Title                        ← 13pt Semibold        │
│                                                                     │
│  ┌────────────────────────────────────────────────────────────────┐ │
│  │                                                                │ │
│  │  def hello():                             ← JetBrains Mono 9pt │ │
│  │      print("world")    # comment in #5d5d6d italic            │ │
│  │                                                                │ │
│  │  Background: #f0ece4                                           │ │
│  └────────────────────────────────────────────────────────────────┘ │
│                                                                     │
│  ┌────────────────────────────────────────────────────────────────┐ │
│  │█                                                               │ │
│  │█ ℹ This is a note callout.                                     │ │
│  │█   Background #f4f0e8, left border #8d8d9d.                    │ │
│  │█   Text in #181826, icon in #5d5d6d.                           │ │
│  │█                                                               │ │
│  └────────────────────────────────────────────────────────────────┘ │
│                                                                     │
│  ┌────────────────────────────────────────────────────────────────┐ │
│  │█                                                               │ │
│  │█ ✦ This is a tip callout.                                      │ │
│  │█   Left border in #ca9ee6 (secondary).                         │ │
│  │█                                                               │ │
│  └────────────────────────────────────────────────────────────────┘ │
│                                                                     │
│  ┌────────────────────────────────────────────────────────────────┐ │
│  │█                                                               │ │
│  │█ ⚠ This is a warning callout.                                  │ │
│  │█   Left border in warm amber #d4a574.                          │ │
│  │█                                                               │ │
│  └────────────────────────────────────────────────────────────────┘ │
│                                                                     │
│  ┌────────────────────────────────────────────────────────────────┐ │
│  │█                                                               │ │
│  │█ ★ This is an important callout.                               │ │
│  │█   Left border in #a080c0.                                     │ │
│  │█                                                               │ │
│  └────────────────────────────────────────────────────────────────┘ │
│                                                                     │
│  ┌────────────────────────────────────────────────────────────────┐ │
│  │ Header Col 1      │ Header Col 2      │ Header Col 3           │ │
│  ├───────────────────┼───────────────────┼────────────────────────┤ │
│  │ Data              │ Data              │ Data                   │ │
│  │ Data              │ Data              │ Data                   │ │
│  └────────────────────────────────────────────────────────────────┘ │
│  Table 1: Caption in 9pt italic #3d3d4d                             │
│                                                                     │
│  ┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─┐ │
│  │                                                                │ │
│  │           Figure: Architecture Diagram                         │ │
│  │           Description: System overview                         │ │
│  │                                                                │ │
│  └ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─┘ │
│  Image placeholder: #ece8e0 bg, dashed #c4c0b6 border               │
│                                                                     │
│                                                              2      │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 21. Color Reference Card

```
PRIMARY & SECONDARY
├── Primary (dark):     #181826  ████████  Text, headings
└── Secondary (light):  #ca9ee6  ████████  Links, accents

BACKGROUNDS
├── Page:               #faf7f2  ████████  Warm cream
├── Code:               #f0ece4  ████████  Warm tan
├── Callout:            #f4f0e8  ████████  Off-cream
└── Placeholder:        #ece8e0  ████████  Muted cream

TEXT HIERARCHY
├── Body:               #181826  ████████  Primary text
├── Secondary:          #3d3d4d  ████████  Captions
└── Tertiary:           #5d5d6d  ████████  Footer, subtle

RULES & BORDERS
├── Table rules:        #d4d0c6  ████████  Warm gray
├── Placeholder border: #c4c0b6  ████████  Dashed
└── Accent muted:       #a080c0  ████████  Darker lavender

CALLOUT BORDERS
├── Note:               #8d8d9d  ████████  Neutral gray
├── Tip:                #ca9ee6  ████████  Lavender
├── Warning:            #d4a574  ████████  Warm amber
└── Important:          #a080c0  ████████  Muted lavender

SYNTAX HIGHLIGHTING
├── Keyword:            #181826  ████████  Bold
├── String:             #a080c0  ████████  Normal
├── Comment:            #5d5d6d  ████████  Italic
└── Number:             #3d3d4d  ████████  Normal
```

---

## 22. Typography Reference Card

```
FONT FAMILIES
├── Body:    Inter
└── Code:    JetBrains Mono

SIZE SCALE
├── H1:              16pt  Semibold
├── H2:              13pt  Semibold
├── H3:              11pt  Medium
├── Body:            10pt  Regular
├── Code:             9pt  Regular
├── Caption:          9pt  Regular Italic
└── Header/Footer:    8pt  Regular

SPACING SCALE
├── H1 above:        24pt
├── H1 below:        12pt
├── H2 above:        18pt
├── H2 below:         8pt
├── H3 above:        14pt
├── H3 below:         6pt
├── Paragraph gap:    6pt
├── List item gap:    4pt
├── Callout margin:  12pt
└── Code margin:      8pt

LINE HEIGHT
└── Body:            1.4
```

---

## 23. Document Anatomy

```
┌─────────────────────────────────────────────────────────────────┐
│                         PAGE 1                                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │  Title Block                                            │   │
│  │  ───────────                                            │   │
│  │  Document Title (16pt Semibold)                         │   │
│  │  v1.0 · Date (9pt Secondary)                            │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                 │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │  Table of Contents                                      │   │
│  │  ─────────────────                                      │   │
│  │  Contents (13pt Semibold)                               │   │
│  │                                                         │   │
│  │  1 Section ................................ 2           │   │
│  │  2 Section ................................ 4           │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                 │
│  NO HEADER                                         NO FOOTER    │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                         PAGE 2+                                 │
├─────────────────────────────────────────────────────────────────┤
│                                    Document Title │ v1.0        │
│  ───────────────────────────────────────────────────────────    │
│                                                                 │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │  Content Area                                           │   │
│  │  ────────────                                           │   │
│  │  Headings, body text, code, callouts, tables, figures   │   │
│  │                                                         │   │
│  │  160mm text width                                       │   │
│  │  25mm left/right margins                                │   │
│  │  20mm top/bottom margins                                │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                 │
│  ───────────────────────────────────────────────────────────    │
│                                                          3      │
└─────────────────────────────────────────────────────────────────┘
```
