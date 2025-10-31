#!/bin/bash

# build-local.sh
# Generates index.html from index.html.tpl for local testing

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE_FILE="$PROJECT_ROOT/website/index.html.tpl"
OUTPUT_FILE="$PROJECT_ROOT/website/index.html"

echo "Building index.html for local testing..."
echo "Template: $TEMPLATE_FILE"
echo "Output:   $OUTPUT_FILE"

# Check if template exists
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file not found: $TEMPLATE_FILE"
    exit 1
fi

# Process the template:
# 1. Remove the Google Analytics conditional block (lines 350-359)
# 2. Replace $$ with $ (unescape dollar signs)
sed -e '/<!-- Google Analytics -->/,/%{ endif }/d' \
    -e 's/\$\$/$/g' \
    "$TEMPLATE_FILE" > "$OUTPUT_FILE"

echo "✓ Successfully generated $OUTPUT_FILE"
echo ""
echo "To test locally, open: file://$OUTPUT_FILE"
echo "Or run a local server:"
echo "  cd website && python3 -m http.server 8000"
echo "  Then open: http://localhost:8000"
