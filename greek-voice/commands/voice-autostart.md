---
description: Ρυθμίζει την αυτόματη εκκίνηση της φωνητικής υπαγόρευσης στο login (Windows)
argument-hint: "[install | uninstall | status]"
allowed-tools: Bash
---

Διαχειρίσου το auto-start του greek-voice μέσω του Task Scheduler.

Τρέξε (Windows PowerShell):
`powershell -ExecutionPolicy Bypass -File "${CLAUDE_PLUGIN_ROOT}/scripts/autostart.ps1" ${ARGUMENTS:-status}`

- `install`   : εγκαθιστά την αυτόματη εκκίνηση σε κάθε login (τρέχει αθόρυβα με pythonw) και ξεκινά και τώρα.
- `uninstall` : αφαιρεί το auto-start και σταματά τον listener.
- `status`    : δείχνει αν είναι εγκατεστημένο.

Αν το `install` αποτύχει με σφάλμα δικαιωμάτων, πες στον χρήστη να τρέξει την εντολή
από terminal ανοιγμένο ως administrator. Ανέφερέ του ότι σε λειτουργία auto-start
δεν υπάρχει ορατό παράθυρο — οι ηχητικές ενδείξεις (μπιπ) δείχνουν την κατάσταση.
