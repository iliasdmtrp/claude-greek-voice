---
description: Ξεκινά την ελληνική φωνητική υπαγόρευση (F9 → μιλάς → γράφεται στο chat)
argument-hint: "[πλήκτρο, π.χ. f8]"
allowed-tools: Bash
---

Ξεκίνα τον listener φωνητικής υπαγόρευσης του greek-voice plugin ΣΤΟ ΠΑΡΑΣΚΗΝΙΟ.

Βήματα:
1. Βεβαιώσου ότι υπάρχουν οι εξαρτήσεις (τρέξε μία φορά, αθόρυβα):
   `python -m pip install --quiet -r "${CLAUDE_PLUGIN_ROOT}/requirements.txt"`
2. Ξεκίνα τον listener στο παρασκήνιο (run_in_background):
   `python "${CLAUDE_PLUGIN_ROOT}/scripts/voice_hotkey.py" --key "${ARGUMENTS:-f9}"`
   Τρέξε τον από τον φάκελο του project (cwd) ώστε να διαβάσει το `.env` με το GROQ_API_KEY.
3. Περίμενε ~2s και διάβασε το output αρχείο του background task για να επιβεβαιώσεις
   ότι τύπωσε «Έτοιμο» και δεν έσκασε (π.χ. λείπει κλειδί, ή χρειάζεται admin για το hotkey).
4. Πες στον χρήστη: βάλε τον κέρσορα στο chat, πάτα το πλήκτρο (default F9),
   μίλα ελληνικά, ξαναπάτα το ίδιο πλήκτρο — το κείμενο γράφεται μόνο του.

Αν λείπει κλειδί: πες του να βάλει `GROQ_API_KEY=gsk_...` στο `.env` (δωρεάν από
https://console.groq.com/keys). Αν το hotkey δεν πιάνει, πες του να το τρέξει ως admin.
