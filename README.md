How I can build MK4.4Cmyself?

http://bbs.mfunz.com/thread-754544-1-1.html

mkdir -p mk

cd ~/mk

repo init -u https://github.com/MoKee/android.git -b kk_mkt

mkdir -p .repo

wget https://github.com/ruling/android_local_manifest/raw/kk_mkt/local_manifest.xml -O .repo/local_manifests/local_manifest.xml

repo sync

. build/envsetup.sh

lunch mk_ace-userdebug

make bacon
