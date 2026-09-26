#!/bin/bash
# VentLab OS versiya saqlovchi skript
cd "$(dirname "$0")"
MSG="${1:-update}"
git add -A
git commit -m "$MSG" --quiet && echo "✓ commit: $MSG" || { echo "o'zgarish yo'q"; exit 0; }
git tag -f "v$(date +%Y%m%d-%H%M)" >/dev/null 2>&1
echo "✓ teg (tag) yaratildi"
git push --tags --quiet 2>/dev/null && echo "✓ GitHub'ga chiqdi" || echo "ℹ push muvaffaqiyatsiz (internet/ruhsatni tekshiring)"
git log --oneline | head -3
