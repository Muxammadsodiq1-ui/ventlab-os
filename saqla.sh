#!/bin/bash
# VentLab OS versiya saqlovchi skript
cd "$(dirname "$0")"
MSG="${1:-update}"
git add -A
git commit -m "$MSG" --quiet && echo "✓ commit: $MSG" || { echo "o'zgarish yo'q"; exit 0; }
git tag -f "v$(date +%Y%m%d-%H%M)" 2>/dev/null
echo "✓ teg (tag) yaratildi"
git push --quiet 2>/dev/null && echo "✓ GitHub'ga chiqdi" || echo "ℹ GitHub'avtomatik chiqmadi — birinchi marta logi/render kerak"
git log --oneline | head -3
