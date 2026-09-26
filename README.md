# VentLab OS v3 — PB12 Guided Screening (Trial 2)

Soddalashtirilgan, ikki tilli (o'zbekcha default, 🌐 tugmasi bilan EN) yo'naltiruvchi
lab tizimi. 5 ta bo'lim: Qadamlar, Kolbalar, Grafik, Ta'sirlar, Sozlamalar.

## Ishga tushirish
Brauzerda `index.html` ni oching, yoki `python3 -m http.server 8000`.
Har amal brauzer localStorage'ga avtosaqlanadi; zaxira: Sozlamalar → ⬇ JSON.

## Model (sizning izing bilan)
- Bazaviy muhit: har kolbaga 10 mL allaqachon tayyor (P va YE uning tarkibida —
  ular qo'shimcha hisoblanmaydi). 4 xil media (P/YE kombinatsiyasi) × 3 kolba.
- Ustidan qo'shiladi (stoklaringdan hisoblanadi): glitserin (0/0.8%), MgSO4 (0/10 mM),
  Amp (10 µL), kam qo'shilganga suv tenglashtirish — 12 kolba bir xil hajmda
  (standart stoklarda 10,340 µL).
- Siz o'zingiz "tavakkal" tartibni dropdown'dan kiritasiz (A–L ↔ run 1–12, swap avtomatik).
- NEXT tugmasi eng shoshilinch ishni ochadi: harvest > IPTG > overdue OD > OD > batch.
- OD o'lchashda faqat raqam yoziladi (200 µL o'zi ayiriladi, ×1/×2/×5 dilution).
- IPTG µA joriy hajm bo'yicha hisoblanadi + suv tenglashtirish checkbox'i.
- O'sish prognozi: ≥2 o'lchovdan exponentsial model; sariq = o'lchash vaqti, qizil = kechikdi.
- Ta'sirlar: 12 kolba natijasini kiritgach, 8 faktor effect (high−low) jadval va grafik.


## Tekshirilgan (v3.1)
- PB12 jadvali promptdagi burman katakchasi bilan 12/12 satr, 8 ustun to'liq mos.
- Har faktor 6 yuqori / 6 past — balanslangan skrining dizayni (Sozlamalarda 📐 jadval ko'rinadi).
- Harorat guruhlari: 🔥 37°C (6 kolba) / ❄️ 20°C (6 kolba) — Qadamlar panelida rangli.
- Run raqami hamma joyda harf yonida ko'rinadi (masalan "D · r4").
- Har qadamda vaht rejasi: "~24h → OD 1.2 → IPTG → +12h (jami ≈36h @ temp)".


## v3.2 — semantika tuzatildi
- Jadvalning 24h/4h ustuni = **IPTG dan keyingi ifoda vaqti** (24h uzoq → amalda **12h@20°C / 4h@37°C**). O'sish vaqti emas.
- **OD ga yetish vaqti = bashorat**: 2+ o'lchovdan keyin model (badge: "model"), oldin taxminiy heuristik (37°C: ~3–5h, 20°C: ~8–18h; badge: "tahminiy").
- Harvest: **Sentrifuga 7068×g · 20 min**, ✔ bilan belgilanadi → keyin Ta'sirlar bosqichi.
- Vizual: Inter shrifti, gradient fon, kolba suyuqligi to'lqini + pufakchalar animatsiyasi, tugma/karta hover effektlari, ☀️/🌙 kun-tun ko'rsatkichi.


## v3.3 — kritik semantika + qiziq rejimlar
- **IPTG gacha BARCHA kolbalar 37°C da o'sadi.** Jadvaldagi 20/37°C = faqat IPTG dan keyingi IFODA harorati (12h @20 / 4h @37).
- OD heuristikasi qo'lyozmaga yaqinlashtirildi: OD 0.4 ≈ 2.5h, OD 1.2 ≈ 4h (@37°C). Prognoz badgeleri: "tahminiy" (0-1 o'lchov) / "model" (2+ o'lchov).
- **✎ To'g'riltish**: har kolbada — boshlanish vaqtini surish (soatcha), qolgan ifoda vaqtini o'zgartirish, hajmni ± to'g'rilash.
- 🎨 Rejimlar: kunduz / tun / neon. 🔊 ovozli signallar (shoshilinch alarmlarda "bip", harvest'da melodiya + konfeti 🎉).
