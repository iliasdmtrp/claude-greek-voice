# greek-voice

Ελληνική φωνητική υπαγόρευση (speech-to-text) για το Claude Code. Πατάς ένα πλήκτρο,
μιλάς ελληνικά, και το κείμενο **γράφεται μόνο του στο ενεργό πλαίσιο** (π.χ. το chat).
Παρακάμπτει το ενσωματωμένο μικρόφωνο, που δεν υποστηρίζει ελληνικά.

Μηχανή μεταγραφής: **Groq Whisper large-v3-turbo** (δωρεάν tier) ή OpenAI Whisper.

## Απαιτήσεις

- Python 3 με τις εξαρτήσεις του `requirements.txt` (εγκαθίστανται αυτόματα από το `/voice`,
  ή χειροκίνητα: `pip install -r plugins/greek-voice/requirements.txt`)
- Κλειδί στο `.env` του project:
  - `GROQ_API_KEY=gsk_...` — δωρεάν από https://console.groq.com/keys, **ή**
  - `OPENAI_API_KEY=sk-...`

## Εγκατάσταση (τοπικό marketplace)

Σε interactive `claude`:

```
/plugin marketplace add ./plugins
/plugin install greek-voice@stockagent-plugins
```

## Χρήση

- `/voice` — ξεκινά τον listener στο παρασκήνιο. Κέρσορας στο chat → **F9** → μιλάς → **F9** → γράφεται.
- `/voice f8` — ίδιο, με άλλο πλήκτρο (υπερισχύει του config).
- `/voice-stop` — σταματά τον listener.
- `/voice-config` — δείχνει/αλλάζει ρυθμίσεις (π.χ. `/voice-config key=f8 mode=toggle language=auto`).
- `/voice-autostart install|uninstall|status` — αυτόματη εκκίνηση στο login των Windows.

## Ρυθμίσεις (`scripts/config.json`)

| Πεδίο | Τιμές | Σημασία |
|---|---|---|
| `key` | π.χ. `"f9"`, `"f8"` | πλήκτρο ενεργοποίησης |
| `mode` | `"ptt"` / `"toggle"` | κράτα για ομιλία / πάτα-ξαναπάτα |
| `language` | `"el"`, `"en"`, … ή `"auto"` | γλώσσα· `auto` = αυτόματη ανίχνευση |
| `model` | `whisper-large-v3` / `-turbo` | ακρίβεια / ταχύτητα |
| `beep` | `true`/`false` | ηχητικές ενδείξεις |
| `auto_paste` | `true`/`false` | αυτόματο Ctrl+V ή μόνο clipboard |
| `lead_trim_sec`, `tail_wait_sec` | δευτ. | κοπή αρχής / αναμονή τέλους |

Τα `language`/`model`/`auto_paste` ισχύουν ανά μεταγραφή· τα `key`/`mode`/`beep`/χρόνοι
θέλουν επανεκκίνηση του listener.

Ή απευθείας: `python plugins/greek-voice/scripts/voice_hotkey.py`

## Λεξιλόγιο & διορθώσεις (`scripts/vocab.txt`)

Επεξεργάσιμο αρχείο που διαβάζεται σε κάθε μεταγραφή:
- **Σκέτη λέξη/φράση** → μπαίνει στο prompt του Whisper (να την προτιμά).
- **`λάθος => σωστό`** → διόρθωση που εφαρμόζεται μετά τη μεταγραφή (case-insensitive).

Βάλε εδώ όρους/tickers/ονόματα που θες να πιάνει, και διορθώσεις για ό,τι βγαίνει
σταθερά λάθος. Δεν θέλει επανεκκίνηση — διαβάζεται ανά κλήση.

## Σημειώσεις

- Αν τα Windows μπλοκάρουν το global hotkey, τρέξε ως **administrator**.
- Το γράψιμο γίνεται με auto-paste (Ctrl+V) — το προηγούμενο clipboard επαναφέρεται.
- Δεν είναι εφικτό να προστεθεί κουμπί μικροφώνου στο UI· το UI του Claude Code δεν
  επεκτείνεται από plugins. Το hotkey είναι ο τρόπος να δουλέψουν τα ελληνικά εδώ.
```
