# PDF Build System

**Purpose**: Convert Markdown → PDF using Pandoc + Tectonic (LaTeX engine)

## Commands

Build PDF:
```bash
make pdf IN=docs/your-file.md2>&1 | tail -n 1
```

Direct pandoc (if needed):

```bash
/Users/arneshmandal/bin/micromamba run -n docs pandoc [args]
```

## Key Files (read as needed)

- **Markdown rules**: `templates/styleguide_md.md`
- **Visual spec**: `templates/design_specification.md`
- **LaTeX template**: `templates/template.tex` (has calc pkg + none counter fix)
- **Lua filter**: `templates/divs.lua`
- **Build script**: `workflow/build-pdf.sh`

## Directory Structure

- `docs/` - source markdown files
- `build/` - generated PDFs
- `templates/` - pandoc template, filters, style guides

## Environment

- Conda env: `docs` (via micromamba at `/Users/arneshmandal/bin/micromamba`)
- Fonts: Inter (body), JetBrains Mono (code)
