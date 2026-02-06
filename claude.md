# Claude Code Instructions

## When Writing Markdown
Read and follow:
```
templates/STYLEGUIDE_MD.md
```

## When You Need Visual Context
Reference:
```
templates/design_specification.md
```

## When Building PDFs
Run:
```bash
make pdf IN=docs/your-file.md
```

## File Locations
| Purpose | Location |
|---------|----------|
| Markdown files you create | `docs/` |
| Markdown rules | `templates/STYLEGUIDE_MD.md` |
| Visual specification | `templates/design_specification.md` |
| PDF output | `build/` |



instead of "pandoc" use "/Users/arneshmandal/bin/micromamba run -n docs pandoc"

