#!/bin/bash

function usage {
    cat <<EOF
Preseed Creator (c) Luc Didry 2017, WTFPL
./preseed_creator.sh [options]
    Options:
        -i <image.iso>              ISO image to preseed. If not provided, the script will download and use the latest Debian amd64 netinst ISO image
        -o <preseeded_image.iso>    output preseeded ISO image. Default to preseed_creator/debian-netinst-latest-preseed.ISO
        -p <preseed_file.cfg>       preseed file. If not provided, the script will put "d-i debian-installer/locale string fr_BE" in the preseed.cfg file
        -x                          Use xorriso instead of genisoimage, to create an iso-hybrid
        -g                          download the latest Debian stable example preseed file into preseed_example.cfg and exit
        -h                          print this help and exit
EOF
    exit
}

INPUT=""
PRESEED=""
MYPWD=$(pwd)
OUTPUT=""
XORRISO=""
while getopts ":i:o:p:xgh" opt; do
    case $opt in
        i)
            INPUT=$OPTARG
            ;;
        o)
            OUTPUT=$OPTARG
            ;;
        p)
            PRESEED=$OPTARG
            ;;
        x)
            XORRISO='yes'
            ;;
        g)
            echo "Downloading latest Debian stable example preseed file into preseed_example.cfg"
            wget -q http://www.debian.org/releases/stable/example-preseed.txt -O preseed_example.cfg
            echo "Done"
            exit
            ;;
        h)
            usage
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            ;;
    esac
done

mkdir preseed_creator -p
cd preseed_creator

if [[ ! -z $PRESEED ]]
then
    if [ ${PRESEED:0:1} != / ]
    then
        PRESEED="${MYPWD}/${PRESEED}"
    fi
    if [[ ! -e $PRESEED ]]
    then
        echo "$PRESEED does not exists. Aborting"
        exit 1
    fi
    if [[ ! -r $PRESEED ]]
    then
        echo "$PRESEED is not readable. Aborting"
        exit 1
    fi
fi

if [[ ! -z $OUTPUT ]]
then
    if [ ${OUTPUT:0:1} != / ]
    then
        OUTPUT="${MYPWD}/${OUTPUT}"
    fi
else
    OUTPUT="debian-netinst-latest-preseed.iso"
fi

if [[ -z $INPUT ]]
then
    echo "No ISO image provided, will download the latest Debian amd64 netinst ISO image"
    echo -ne 'Getting Debian GPG keys                     [>                             ](0%)\r'
    for i in F41D30342F3546695F65C66942468F4009EA8AC3 DF9B9C49EAA9298432589D76DA87E80D6294BE9B 10460DAD76165AD81FBC0CE9988021A964E6EA7D
    do
        gpg --list-keys $i > /dev/null 2>&1
        if [ $? != 0 ]
        then
            gpg --keyserver keyring.debian.org --recv-keys 0x$i > /dev/null 2>&1
        fi
    done

    echo -ne 'Downloading latest Debian amd64 netinst ISO [===>                          ](10%)\r'
    export LATEST=$(wget -q -O - https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/ | grep "netinst.iso" | grep -v "debian-mac" | grep -v "debian-edu" | sed -e 's@.*a href="\([^"]*\)".*@\1@')
    wget -q https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/$LATEST -O debian-netinst-latest.iso

    wget -q https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/SHA512SUMS -O SHA512SUMS
    wget -q https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/SHA512SUMS.sign -O SHA512SUMS.sign
    echo -ne 'Verifying GPG signature                     [======>                       ](20%)\r'
    gpg --verify SHA512SUMS.sign SHA512SUMS > /dev/null 2>&1
    if [ $? -ne 0 ]
    then
        echo "Bad SHA512SUMS GPG signature. Aborting"
        exit 1
    fi

    echo -ne 'Veryfying sha512sum                         [=========>                    ](30%)\r'
    sed -e "s@${LATEST}@debian-netinst-latest.iso@" -i SHA512SUMS
    sha512sum --ignore-missing -c SHA512SUMS > /dev/null 2>&1

    if [ $? -ne 0 ]
    then
        echo "Bad ISO checksum. Aborting"
        exit 1
    fi

    INPUT="debian-netinst-latest.iso"
else
    if [ ${INPUT:0:1} != / ]
    then
        INPUT="${MYPWD}/${INPUT}"
    fi
    if [[ ! -e $INPUT ]]
    then
        echo "$INPUT does not exists. Aborting"
        exit 1
    fi
    if [[ ! -r $INPUT ]]
    then
        echo "$INPUT is not readable. Aborting"
        exit 1
    fi
fi

echo -ne 'Mounting ISO image                          [===========>                  ](40%)\r'
mkdir loopdir -p
mount -o loop $INPUT loopdir > /dev/null 2>&1
if [ $? -ne 0 ]
then
    echo "Error while mounting the ISO image. Aborting"
    exit 1
fi

mkdir cd
echo -ne 'Extracting ISO image                        [==============>               ](50%)\r'
rsync -a -H --exclude=TRANS.TBL loopdir/ cd
echo -ne 'Umounting ISO image                         [=================>            ](60%)\r'
umount loopdir

echo -ne 'Hacking initrd                              [====================>         ](70%)\r'
mkdir irmod -p
cd irmod
#gzip -d < ../cd/casper/initrd | cpio --extract --make-directories --no-absolute-filenames 2>/dev/null
if [ $? -ne 0 ]
then
    echo "Error while getting ../cd/install.amd/initrd.gz content. Aborting"
    exit 1
fi

echo -ne 'Disable menu graphic installer              [=======================>      ](80%)\r'
sed -i 's/include gtk.cfg//g' ../cd/isolinux/menu.cfg 2>/dev/null
if [ $? -ne 0 ]
then
    echo "Error while disabling graphic menu installer in ../cd/isolinux/isolinux.cfg. Aborting"
    exit 1
fi

if [[ -z $PRESEED ]]
then
    echo "d-i debian-installer/locale string fr_BE" > preseed.cfg
else
    cp $PRESEED preseed.cfg
fi
cp /home/dasim/perso/developpement/os-installer/scripts_bash/scripts/01_install_docker.sh ../cd/install/01_install_docker.sh
find . | cpio -H newc --create 2>/dev/null | gzip -9 > ../cd/casper/initrd 2>/dev/null
if [ $? -ne 0 ]
then
    echo "Error while putting new content into ../cd/install.amd/initrd.gz. Aborting"
    exit 1
fi

cd ../
rm -rf irmod/

echo -ne 'Fixing md5sums                              [========================>     ](85%)\r'
cd cd
md5sum `find -follow -type f 2>/dev/null` > md5sum.txt 2>/dev/null
if [ $? -ne 0 ]
then
    echo "Error while fixing md5sums. Aborting"
    exit 1
fi

cd ..

echo -ne 'Creating preseeded ISO image                [==========================>   ](90%)\r'
if [[ -z $XORRISO ]]
then
	genisoimage -quiet -o $OUTPUT -r -J -no-emul-boot -boot-load-size 4 -boot-info-table -b isolinux/isolinux.bin -c isolinux/boot.cat ./cd > /dev/null 2>&1
else
	xorriso -as mkisofs \
		-quiet \
		-o $OUTPUT \
		-isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin \
		-c isolinux/boot.cat \
		-b isolinux/isolinux.bin \
		-no-emul-boot -boot-load-size 4 -boot-info-table \
		-eltorito-alt-boot \
		-e boot/grub/efi.img \
		-no-emul-boot \
		-isohybrid-gpt-basdat \
		./cd /dev/null 2>$1
fi

if [ $? -ne 0 ]
then
    echo "Error while creating the preseeded ISO image. Aborting"
    exit 1
fi

rm -rf cd

echo -ne 'Preseeded ISO image created                 [==============================](100%)\r'
echo -e "\nYour preseeded ISO image is located at $OUTPUT"
