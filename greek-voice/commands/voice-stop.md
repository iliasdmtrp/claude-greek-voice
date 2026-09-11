---
description: Σταματά τον listener της ελληνικής φωνητικής υπαγόρευσης
allowed-tools: Bash
---

Σταμάτα τον listener φωνητικής υπαγόρευσης (greek-voice).

Βρες και τερμάτισε τη διεργασία που τρέχει `voice_hotkey.py`:
`taskkill /F /FI "IMAGENAME eq python.exe" /FI "WINDOWTITLE eq *voice_hotkey*" 2>NUL` δεν
είναι αξιόπιστο· αντ' αυτού εντόπισε το PID:
`wmic process where "name='python.exe' and commandline like '%voice_hotkey%'" get processid`
και μετά `taskkill /F /PID <pid>`.

Αν είχες ξεκινήσει τον listener ως background task μέσα σε αυτή τη συνεδρία, προτίμησε να
τον σταματήσεις με το εργαλείο διαχείρισης background tasks αντί για taskkill.

Επιβεβαίωσε στον χρήστη ότι σταμάτησε.
