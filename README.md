# claude-greek-voice 🎙️🇬🇷

Ελληνική **φωνητική υπαγόρευση (speech-to-text)** για το [Claude Code](https://claude.com/claude-code)
και για οποιοδήποτε πλαίσιο κειμένου στα Windows. Πατάς ένα πλήκτρο, μιλάς ελληνικά,
και το κείμενο **γράφεται μόνο του** εκεί που έχεις τον κέρσορα.

Φτιάχτηκε γιατί το ενσωματωμένο μικρόφωνο **δεν υποστηρίζει ελληνικά**. Χρησιμοποιεί
**Groq Whisper large-v3** (δωρεάν tier) ή OpenAI Whisper.

> Greek voice dictation plugin for Claude Code — push-to-talk, types transcribed
> Greek straight into the active field. Powered by Groq/OpenAI Whisper.

## Δυνατότητες

- 🎙️ **Push-to-talk** (κράτα F9) ή **toggle** — ρυθμιζόμενο πλήκτρο
- ⚡ Ακαριαία έναρξη, ηχητικές ενδείξεις (μπιπ)
- 🎯 Προστασία πρώτης/τελευταίας λέξης, φίλτρο για hallucinations & επαναλήψεις
- 📖 `vocab.txt` — προσωπικό λεξιλόγιο + διορθώσεις (`λάθος => σωστό`)
- 🌍 Πολυγλωσσία / auto-detect (`config.json`)
- 🚀 Auto-start με τα Windows (Task Scheduler)

## Γρήγορη εγκατάσταση

```bash
git clone https://github.com/iliasdmtrp/claude-greek-voice.git
```

Απαιτήσεις:
```bash
pip install -r claude-greek-voice/greek-voice/requirements.txt
```

Κλειδί στο `.env` (δωρεάν Groq από https://console.groq.com/keys):
```
GROQ_API_KEY=gsk_...
```

Ως Claude Code plugin (interactive `claude`):
```
/plugin marketplace add ./claude-greek-voice
/plugin install greek-voice@claude-greek-voice
```

Ή απευθείας:
```bash
python claude-greek-voice/greek-voice/scripts/voice_hotkey.py
```

## Εντολές

| Εντολή | Τι κάνει |
|---|---|
| `/voice` | ξεκινά τον listener (F9 → μιλάς → γράφεται) |
| `/voice-stop` | σταματά τον listener |
| `/voice-config` | ρυθμίσεις (πλήκτρο, mode, γλώσσα, μοντέλο…) |
| `/voice-autostart` | αυτόματη εκκίνηση στο login |

Δες το [greek-voice/README.md](greek-voice/README.md) για λεπτομέρειες.

## Άδεια

MIT
