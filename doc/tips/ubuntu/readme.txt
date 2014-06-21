$ sudo cp -r /mnt/iso/casper .
$ sudo cp -r /mnt/iso/preseed .


menuentry "Install Ubuntu" {
        set gfxpayload=keep
        linux   /casper/vmlinuz.efi  file=/cdrom/preseed/ubuntu.seed boot=casper only-ubiquity quiet splash --
        initrd  /casper/initrd.lz
}
