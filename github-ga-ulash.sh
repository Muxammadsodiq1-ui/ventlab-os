#!/bin/bash
# GitHub ulash skripti (SSH url bilan)
URL="${1:-git@github.com:Muxammadsodiq1-ui/ventlab-os.git}"
cd "$(dirname "$0")"
git remote remove origin 2>/dev/null
git remote add origin "$URL"
git branch -M main
git push -u origin main --tags && echo "✅ Ulandi va versiyalar GitHub'da!" || echo "❌ Push xato"
