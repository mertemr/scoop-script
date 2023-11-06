Set-ExecutionPolicy Bypass -Scope CurrentUser -Force;

Invoke-RestMethod get.scoop.sh | Invoke-Expression;
scoop install git 7zip;

@(
  "extras",
  "nirsoft",
  "sysinternals"
) | ForEach-Object { "scoop bucket add $_" } | Invoke-Expression;

scoop update;

scoop install aria2;

scoop config aria2-enabled true;
scoop config aria2-warning-enabled false;

scoop config aria2-split 16;
scoop config aria2-max-connection-per-server 16;

scoop install gsudo;
sudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1;

@(
  "adb",
  "autoruns",
  "busybox",
  "dark",
  "dasel",
  "everything",
  "ffmpeg",
  "gcc",
  "innounp",
  "lxrunoffline",
  "neofetch",
  "neovim",
  "nodejs",
  "oh-my-posh",
  "posh-git",
  "processhacker",
  "python",
  "rammap",
  "scoop-completion",
  "scoop-search",
  "upx"
) | ForEach-Object { "scoop install $_" } | Invoke-Expression -ErrorAction Continue;

@(
  "everything\current\install-context.reg",
  "7zip\current\install-context.reg",
  "git\current\install-file-associations.reg",
  "everything\current\install-context.reg",
  "python\current\install-pep-514.reg",
) | ForEach-Object { reg import "C:\Users\$env:USERNAME\scoop\apps\$_" } | Invoke-Expression;

scoop cleanup *;
scoop cache rm -a;

scoop alias add upgrade "scoop update -f; scoop update -a; scoop cleanup *; scoop cache rm -a; scoop checkup; scoop status;"
