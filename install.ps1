Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
Invoke-RestMethod get.scoop.sh | Invoke-Expression

scoop install git

scoop bucket add extras

scoop install neovim gcc busybox neofetch
