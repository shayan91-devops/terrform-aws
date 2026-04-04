#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORK_DIR="${SCRIPT_DIR}/.tmp-files"

mkdir -p "${WORK_DIR}"
cd "${WORK_DIR}" || exit 1

files=(adeel owais "adeel 2" shayan)

echo "Creating files: ${files[*]}"
for f in "${files[@]}"; do
  : > "${f}"
done

echo "Created:"
ls -la

echo "Deleting files..."
for f in "${files[@]}"; do
  rm -f "${f}"
done

rmdir "${WORK_DIR}"
echo "Done. Temporary directory removed."
