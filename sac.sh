#!/bin/bash
if [ ! -d ~/mk ]; then
  mkdir -p ~/mk
fi
cd ~/mk
PATH=~/bin:$PATH
repo init -u https://github.com/MoKee/android.git -b kk_mkt
cd ~/mk
echo "======start repo sync======"  
repo sync -j16 
while [ $? == 1 ]; do  
echo "======sync failed, re-sync again======"  
sleep 3  
repo sync -j16
done
mkdir ~/mk/device/htc
mkdir ~/mk/kernel
mkdir ~/mk/kernel/htc
mkdir ~/mk/vendor/qcom
mkdir ~/mk/vendor/htc
mkdir ~/mk/ruling
cd ~/mk/ruling
git clone https://github.com/Ruling/android_frameworks_av.git -b cm-11.0
rm -Rf ~/mk/frameworks/av
mkdir ~/mk/frameworks/av
mv android_frameworks_av/* ~/mk/frameworks/av
git clone https://github.com/Ruling/android_hardware_libhardware_legacy.git -b cm-11.0
rm -Rf ~/mk/hardware/libhardware_legacy
mkdir ~/mk/hardware/libhardware_legacy
mv android_hardware_libhardware_legacy/* ~/mk/hardware/libhardware_legacy
git clone https://github.com/Ruling/android_hardware_qcom_audio-legacy -b cm-11.0
mkdir ~/mk/hardware/qcom/audio-legacy
mv android_hardware_qcom_audio-legacy/* ~/mk/hardware/qcom/audio-legacy
git clone https://github.com/Ruling/android_hardware_qcom_display-legacy -b cm-11.0
mkdir ~/mk/hardware/qcom/display-legacy
mv android_hardware_qcom_display-legacy/* ~/mk/hardware/qcom/display-legacy
git clone https://github.com/Ruling/android_hardware_qcom_media-legacy.git -b cm-11.0
mkdir ~/mk/hardware/qcom/media-legacy
mv android_hardware_qcom_media-legacy/* ~/mk/hardware/qcom/media-legacy
git clone https://github.com/Ruling/htc7x30-3.0.git -b cm-11.0
mkdir ~/mk/kernel/htc/htc7x30-3.0
mv htc7x30-3.0/* ~/mk/kernel/htc/htc7x30-3.0
git clone https://github.com/Ruling/android_packages_apps_ProximityRecalibrator.git -b cm-11.0
mkdir ~/mk/packages/apps/ProximityRecalibrator
mv android_packages_apps_ProximityRecalibrator/* ~/mk/packages/apps/ProximityRecalibrator
git clone https://github.com/Ruling/android_packages_apps_Torch.git -b cm-11.0
rm -Rf ~/mk/packages/apps/Torch
mkdir ~/mk/packages/apps/Torch
mv android_packages_apps_Torch/* ~/mk/packages/apps/Torch
git clone https://github.com/Ruling/android_packages_providers_MediaProvider.git -b cm-11.0
rm -Rf ~/mk/packages/providers/MediaProvider
mkdir ~/mk/packages/providers/MediaProvider
mv android_packages_providers_MediaProvider/* ~/mk/packages/providers/MediaProvider
git clone https://github.com/Ruling/android_vendor_qcom_proprietary.git -b cm-11.0
mkdir ~/mk/vendor/qcom/proprietary
mv android_vendor_qcom_proprietary/* ~/mk/vendor/qcom/proprietary
git clone https://github.com/Ruling/android_device_htc_ace.git -b kk_mkt
mkdir ~/mk/device/htc/ace
mv android_device_htc_ace/* ~/mk/device/htc/ace
git clone https://github.com/Ruling/android_vendor_htc_ace.git -b kk_mkt
mkdir ~/mk/vendor/htc/ace
mv android_vendor_htc_ace/* ~/mk/vendor/htc/ace
git clone https://github.com/Ruling/android_device_htc_msm7x30-common.git -b kk_mkt
mkdir ~/mk/device/htc/msm7x30-common
mv android_device_htc_msm7x30-common/* ~/mk/device/htc/msm7x30-common
cd ~/mk
rm -Rf ~/mk/ruling
. build/envsetup.sh
lunch mk_ace-userdebug
make bacon
read -p "Press [Enter] key to exit..."
exit
