Invoke-RestMethod get.scoop.sh | Invoke-Expression

scoop install git
scoop bucket add extras
scoop install neovim gcc busybox sudo gsudo 7zip fx
scoop cleanup *; scoop cache rm -a