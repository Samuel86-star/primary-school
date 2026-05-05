#!/bin/zsh
set -eu

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SUBJECTS_DIR="$ROOT_DIR/subjects"

SUBJECT="${1:-}"
ARG2="${2:-}"

if [[ -z "$SUBJECT" ]]; then
  echo "Usage: ./scripts/new-exam.sh <subject> [date_or_name]"
  echo "Examples:"
  echo "  ./scripts/new-exam.sh english"
  echo "  ./scripts/new-exam.sh math 20260512"
  echo "  ./scripts/new-exam.sh chinese reading-week-2"
  exit 1
fi

EXAMS_DIR="$SUBJECTS_DIR/$SUBJECT/exams"
TEMPLATE_FILE="$EXAMS_DIR/template.md"

if [[ ! -d "$EXAMS_DIR" ]]; then
  echo "Exams directory not found: $EXAMS_DIR"
  echo "Available subjects:"
  ls "$SUBJECTS_DIR" 2>/dev/null || true
  exit 1
fi

if [[ ! -f "$TEMPLATE_FILE" ]]; then
  echo "Template not found: $TEMPLATE_FILE"
  exit 1
fi

if [[ -z "$ARG2" ]]; then
  BASE_NAME="exam-$(date +%Y%m%d)"
elif [[ "$ARG2" == <-> ]]; then
  BASE_NAME="exam-$ARG2"
else
  BASE_NAME="$ARG2"
fi

TARGET_FILE="$EXAMS_DIR/${BASE_NAME}.md"

if [[ -f "$TARGET_FILE" ]]; then
  echo "File already exists: $TARGET_FILE"
  echo "Try another name, e.g.: ./scripts/new-exam.sh $SUBJECT ${BASE_NAME}-v2"
  exit 1
fi

cp "$TEMPLATE_FILE" "$TARGET_FILE"
echo "Created: $TARGET_FILE"
