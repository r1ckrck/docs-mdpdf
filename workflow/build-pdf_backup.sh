#!/usr/bin/env bash
set -euo pipefail

# Micromamba environment name
ENV_NAME="docs"

# Defaults
DEFAULT_INPUT="docs/index.md"

# Input: arg1 or default
INPUT="${1:-$DEFAULT_INPUT}"

# Output:
# - if arg2 provided, use it
# - else derive build/<input_basename>.pdf
if [ -n "${2:-}" ]; then
  OUTPUT="$2"
else
  BASENAME="$(basename "$INPUT" .md)"
  OUTPUT="build/$BASENAME.pdf"
fi

# Ensure output folder exists
mkdir -p "$(dirname "$OUTPUT")"

# Build using full micromamba path (avoids PATH issues)
/Users/arneshmandal/bin/micromamba run -n "$ENV_NAME" \
  pandoc "$INPUT" \
    -o "$OUTPUT" \
    --pdf-engine=tectonic \
    -V geometry:margin=1in \
    --toc

echo "PDF generated → $OUTPUT"