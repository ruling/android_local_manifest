How I can build MK4.4Cmyself?

http://bbs.mfunz.com/thread-754544-1-1.html

mkdir -p mokee

cd ~/mokee

repo init -u https://github.com/MoKee/android.git -b mkl

mkdir -p .repo/local_manifests

wget https://github.com/ruling/android_local_manifest/raw/mkl/local_manifest.xml -O .repo/local_manifests/local_manifest.xml

wget https://github.com/ruling/android_local_manifest/raw/mkl/roomservice.xml -O .repo/local_manifests/roomservice.xml

repo sync

. build/envsetup.sh

lunch

mka bacon
