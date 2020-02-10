#/bin/sh

reflector --verbose --sort rate --country Sweden --country Denmark --country Norway --country Finland --country Germany --protocol https --ipv4 --age 24 --latest 50 --fastest 10 --save /etc/pacman.d/mirrorlist
