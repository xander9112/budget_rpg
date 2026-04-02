# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Budget RPG is a Flutter mobile app — a financial life simulator with RPG mechanics. It's designed as a masterclass/workshop project (студенческий мастер-класс). The README is in Russian and defines all game rules.

## Commands

```bash
flutter pub get          # Install dependencies
flutter run              # Run on connected device/emulator
flutter analyze          # Lint (flutter_lints)
flutter test             # Run tests
flutter test test/foo_test.dart  # Run a single test file
flutter build apk        # Build Android APK
flutter build ios        # Build iOS
```

## Game Architecture

The app simulates a 30-day financial cycle. All game rules are defined in README.md.

**Character state (starting values):**
- Money: 50,000 | Happiness: 60 (0–100) | Energy: 70 (0–100) | FinancialIQ: 20 (0–100)
- Day: 1 | Goal: 100,000

**Daily game loop:**
1. Check for random event (30% probability)
2. Player selects one action
3. Apply stat effects
4. Advance day

**Win/Lose:**
- Win: Day >= 30 AND Money >= 100,000
- Lose: Money < -20,000 OR Happiness = 0 OR Energy = 0

**Action categories** (see README.md for full effect tables):
- Basic (coffee, café, clothing) — costs money, gains happiness
- Financial (savings, invest, finance course) — costs money, may gain FinancialIQ
- Work (job, freelance) — gains money, costs energy
- Rest (sport, sleep) — restores/costs energy, gains happiness

**Planned screens:**
1. Dashboard — character stats, day, balance vs. goal, "Next Day" button
2. Actions screen — action cards with name/cost/effect/select button
3. Event screen — random event description + response choices
4. Results screen — final stats, win/loss verdict

**Optional features** (desirable per README):
- Random events system
- Financial tips after certain actions
- Goal progress tracking
- RPG points system (savings +10, invest +15, education +20, positive balance +5)
