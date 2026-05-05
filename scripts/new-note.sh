#!/bin/zsh
set -eu

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SUBJECTS_DIR="$ROOT_DIR/subjects"

SUBJECT="${1:-}"
NAME_ARG="${2:-}"

if [[ -z "$SUBJECT" ]]; then
  echo "Usage: ./scripts/new-note.sh <subject> [name]"
  echo "Example:"
  echo "  ./scripts/new-note.sh english"
  echo "  ./scripts/new-note.sh math fraction-basics"
  exit 1
fi

NOTES_DIR="$SUBJECTS_DIR/$SUBJECT/notes"
TEMPLATE_FILE="$NOTES_DIR/template.md"

if [[ ! -d "$NOTES_DIR" ]]; then
  echo "Notes directory not found: $NOTES_DIR"
  echo "Available subjects:"
  ls "$SUBJECTS_DIR" 2>/dev/null || true
  exit 1
fi

if [[ ! -f "$TEMPLATE_FILE" ]]; then
  echo "Template not found: $TEMPLATE_FILE"
  exit 1
fi

DATE_STR="$(date +%Y%m%d)"
if [[ -n "$NAME_ARG" ]]; then
  BASE_NAME="$NAME_ARG"
else
  BASE_NAME="note-${DATE_STR}"
fi

TARGET_FILE="$NOTES_DIR/${BASE_NAME}.md"

if [[ -f "$TARGET_FILE" ]]; then
  echo "File already exists: $TARGET_FILE"
  echo "Try another name, e.g.: ./scripts/new-note.sh $SUBJECT ${BASE_NAME}-v2"
  exit 1
fi

cp "$TEMPLATE_FILE" "$TARGET_FILE"
echo "Created: $TARGET_FILE"
