<#
autostart.ps1 — Εγκαθιστά/αφαιρεί την αυτόματη εκκίνηση της φωνητικής υπαγόρευσης
στο logon των Windows, μέσω Task Scheduler. Τρέχει αθόρυβα με pythonw (χωρίς παράθυρο).

Χρήση:
    powershell -ExecutionPolicy Bypass -File autostart.ps1 install
    powershell -ExecutionPolicy Bypass -File autostart.ps1 uninstall
    powershell -ExecutionPolicy Bypass -File autostart.ps1 status
#>
param([ValidateSet("install","uninstall","status")] [string]$action = "status")

$TaskName = "greek-voice-dictation"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$target = Join-Path $scriptDir "voice_hotkey.py"

# pythonw = Python χωρίς κονσόλα (τρέχει αθόρυβα στο παρασκήνιο)
$pythonw = (Get-Command pythonw.exe -ErrorAction SilentlyContinue).Source
if (-not $pythonw) { $pythonw = "pythonw.exe" }

switch ($action) {
  "install" {
    $act = New-ScheduledTaskAction -Execute $pythonw -Argument "`"$target`"" -WorkingDirectory $scriptDir
    $trg = New-ScheduledTaskTrigger -AtLogOn
    $set = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable
    Register-ScheduledTask -TaskName $TaskName -Action $act -Trigger $trg -Settings $set -Force | Out-Null
    Write-Output "✅ Εγκαταστάθηκε. Θα ξεκινά αυτόματα σε κάθε login. (Ξεκινά και τώρα)"
    Start-ScheduledTask -TaskName $TaskName
  }
  "uninstall" {
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false -ErrorAction SilentlyContinue
    Get-CimInstance Win32_Process -Filter "name='pythonw.exe'" |
      Where-Object { $_.CommandLine -like '*voice_hotkey*' } |
      ForEach-Object { Stop-Process -Id $_.ProcessId -Force }
    Write-Output "🗑️  Αφαιρέθηκε το auto-start και σταμάτησε ο listener."
  }
  "status" {
    $t = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
    if ($t) { Write-Output "ℹ️  Εγκατεστημένο (State: $($t.State))." }
    else { Write-Output "ℹ️  Δεν είναι εγκατεστημένο το auto-start." }
  }
}
