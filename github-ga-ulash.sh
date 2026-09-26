#!/bin/bash
# VentLab OS ni GitHub'ga ulash (birinchi marta)
# 1) github.com da yangi repo oching (masalan: ventlab-os, PRIVATE tavsiya)
# 2) Bu skriptni shunday ishga tushiring:   ./github-ga-ulash.sh https://github.com/USERNAME/ventlab-os.git
URL="$1"
if [ -z "$URL" ]; then echo "Foydalanish: ./github-ga-ulash.sh https://github.com/USERNAME/ventlab-os.git"; exit 1; fi
cd "$(dirname "$0")"
git remote remove origin 2>/dev/null
git remote add origin "$URL"
git branch -M main
git push -u origin main --tags && echo "✅ Ulandi va barcha versiyalar chiqdi!" || echo "❌ Push xato — login/push oynasida GitHub hisobingizni kiriting va qayta ishga tushiring"
