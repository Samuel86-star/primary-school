#!/bin/zsh
set -eu

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ANALYSIS_DIR="$ROOT_DIR/analysis"
TEMPLATE_FILE="$ANALYSIS_DIR/template.md"
SUBJECTS_DIR="$ROOT_DIR/subjects"

if [[ ! -f "$TEMPLATE_FILE" ]]; then
  echo "Template not found: $TEMPLATE_FILE"
  exit 1
fi

SUBJECT="${1:-}"
DATE_ARG="${2:-}"

if [[ -n "$SUBJECT" && -d "$SUBJECTS_DIR/$SUBJECT/analysis" ]]; then
  ANALYSIS_DIR="$SUBJECTS_DIR/$SUBJECT/analysis"
  TEMPLATE_FILE="$ANALYSIS_DIR/template.md"
  DATE_STR="${DATE_ARG:-$(date +%Y%m%d)}"
  TARGET_FILE="$ANALYSIS_DIR/student-error-analysis-${DATE_STR}.md"
else
  # backward-compatible: first arg can still be a date
  DATE_STR="${1:-$(date +%Y%m%d)}"
  TARGET_FILE="$ANALYSIS_DIR/student-error-analysis-${DATE_STR}.md"
fi

if [[ -f "$TARGET_FILE" ]]; then
  echo "File already exists: $TARGET_FILE"
  echo "If you want another file, pass a different date."
  echo "Examples:"
  echo "  ./scripts/new-analysis.sh 20260512"
  echo "  ./scripts/new-analysis.sh english 20260512"
  exit 1
fi

cp "$TEMPLATE_FILE" "$TARGET_FILE"
echo "Created: $TARGET_FILE"
