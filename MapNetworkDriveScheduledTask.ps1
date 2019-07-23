$ST_A = New-ScheduledTaskAction –Execute C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Argument '-NoLogo -NoProfile -NonInteractive -WindowStyle Hidden -ExecutionPolicy ByPass -command New-PSDrive -Name "Z" -PSProvider FileSystem -Root \\Server\Share `$\$env:USERNAME -Persist'
$ST_T = New-ScheduledTaskTrigger -AtLogon
$ST_S = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -StartWhenAvailable -Hidden
$ST_P = New-ScheduledTaskPrincipal -GroupId 'Builtin\Users'
Register-ScheduledTask –TaskName "Map Network Drive" -Action $ST_A –Trigger $ST_T -Settings $ST_S -Principal $ST_P -Force