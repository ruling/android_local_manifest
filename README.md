How I can build MK4.4Cmyself?

Setup a basic Android build environment.

mkdir -p mk

cd ~/mk

repo init -u git://github.com/CyanogenMod/android.git -b cm-11.0

mkdir -p .repo

wget https://github.com/ruling/android_local_manifest/raw/kk_mkt/local_manifest.xml -O .repo/local_manifest.xml

repo sync

cd vendor/cm/

./get-prebuilts

cd ~/mk

. build/envsetup.sh

lunch mk_ace-userdebug

mka bacon
