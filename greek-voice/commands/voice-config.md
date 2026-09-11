---
description: Δείχνει/αλλάζει τις ρυθμίσεις της φωνητικής υπαγόρευσης (config.json)
argument-hint: "[π.χ. key=f8, mode=toggle, language=auto, beep=false]"
allowed-tools: Bash, Read, Edit
---

Διαχειρίσου το `config.json` του greek-voice plugin
(`${CLAUDE_PLUGIN_ROOT}/scripts/config.json`).

- Χωρίς όρισμα: διάβασε και δείξε τις τρέχουσες ρυθμίσεις σε πίνακα, με σύντομη εξήγηση.
- Με όρισμα(τα) `κλειδί=τιμή` (π.χ. `key=f8 mode=toggle language=auto beep=false`):
  ενημέρωσε ΜΟΝΟ αυτά τα πεδία στο `config.json`, κράτα τα υπόλοιπα ίδια, κράτα έγκυρο JSON.

Έγκυρα πεδία & τιμές:
- `key`      : το πλήκτρο (π.χ. "f9", "f8", "scroll lock")
- `mode`     : "ptt" (κράτα) ή "toggle" (πάτα/ξαναπάτα)
- `language` : "el", άλλος ISO κωδικός (π.χ. "en"), ή "auto" (αυτόματη ανίχνευση)
- `model`    : "whisper-large-v3" (ακρίβεια) ή "whisper-large-v3-turbo" (ταχύτητα)
- `beep`     : true/false (ηχητικές ενδείξεις)
- `auto_paste`: true/false (false = μόνο clipboard, χωρίς αυτόματο Ctrl+V)
- `lead_trim_sec`, `tail_wait_sec`: χρόνοι (δευτ.) κοπής αρχής / αναμονής τέλους

Μετά την αλλαγή: αν τρέχει ήδη ο listener, θύμισε στον χρήστη ότι για να ισχύσουν
`key`/`mode`/`beep`/χρόνοι πρέπει να γίνει επανεκκίνηση (`/voice-stop` και μετά `/voice`).
Τα `language`/`model`/`auto_paste` διαβάζονται ανά μεταγραφή, δεν θέλουν επανεκκίνηση.
