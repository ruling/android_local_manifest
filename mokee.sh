#!/bin/bash
cd ~/MOKEE_KK
echo "======start repo sync======"  
repo sync -j16 
while [ $? == 1 ]; do  
echo "======sync failed, re-sync again======"  
sleep 3  
repo sync -j16
done
mkdir ~/MOKEE_KK/device/htc
mkdir ~/MOKEE_KK/kernel
mkdir ~/MOKEE_KK/kernel/htc
mkdir ~/MOKEE_KK/vendor/qcom
mkdir ~/MOKEE_KK/vendor/htc
mkdir ~/MOKEE_KK/ruling
cd ~/MOKEE_KK/ruling
git clone https://github.com/AceEnablementProject/android_frameworks_av.git -b cm-11.0
rm -Rf ~/MOKEE_KK/frameworks/av
mkdir ~/MOKEE_KK/frameworks/av
mv android_frameworks_av/* ~/MOKEE_KK/frameworks/av
git clone https://github.com/AceEnablementProject/android_hardware_libhardware_legacy.git -b cm-11.0
rm -Rf ~/MOKEE_KK/hardware/libhardware_legacy
mkdir ~/MOKEE_KK/hardware/libhardware_legacy
mv android_hardware_libhardware_legacy/* ~/MOKEE_KK/hardware/libhardware_legacy
git clone https://github.com/AceEnablementProject/android_hardware_qcom_audio-legacy -b cm-11.0
mkdir ~/MOKEE_KK/hardware/qcom/audio-legacy
mv android_hardware_qcom_audio-legacy/* ~/MOKEE_KK/hardware/qcom/audio-legacy
git clone https://github.com/AceEnablementProject/android_hardware_qcom_display-legacy -b cm-11.0
mkdir ~/MOKEE_KK/hardware/qcom/display-legacy
mv android_hardware_qcom_display-legacy/* ~/MOKEE_KK/hardware/qcom/display-legacy
git clone https://github.com/AceEnablementProject/android_hardware_qcom_media-legacy.git -b cm-11.0
mkdir ~/MOKEE_KK/hardware/qcom/media-legacy
mv android_hardware_qcom_media-legacy/* ~/MOKEE_KK/hardware/qcom/media-legacy
git clone https://github.com/AceEnablementProject/android_kernel_htc_msm7x30.git -b cm-11.0
mkdir ~/MOKEE_KK/kernel/htc/msm7x30
mv android_kernel_htc_msm7x30/* ~/MOKEE_KK/kernel/htc/msm7x30
git clone https://github.com/AceEnablementProject/android_packages_apps_ProximityRecalibrator.git -b cm-11.0
mkdir ~/MOKEE_KK/packages/apps/ProximityRecalibrator
mv android_packages_apps_ProximityRecalibrator/* ~/MOKEE_KK/packages/apps/ProximityRecalibrator
git clone https://github.com/AceEnablementProject/android_packages_providers_MediaProvider.git -b cm-11.0
rm -Rf ~/MOKEE_KK/packages/providers/MediaProvider
mkdir ~/MOKEE_KK/packages/providers/MediaProvider
mv android_packages_providers_MediaProvider/* ~/MOKEE_KK/packages/providers/MediaProvider
git clone https://github.com/AceEnablementProject/android_vendor_qcom_proprietary.git -b cm-11.0
mkdir ~/MOKEE_KK/vendor/qcom/proprietary
mv android_vendor_qcom_proprietary/* ~/MOKEE_KK/vendor/qcom/proprietary
git clone https://github.com/DHDAIO/android_device_htc_ace.git -b kk_mkt
mkdir ~/MOKEE_KK/device/htc/ace
mv android_device_htc_ace/* ~/MOKEE_KK/device/htc/ace
git clone https://github.com/AceEnablementProject/android_vendor_htc_ace.git -b cm-11.0
mkdir ~/MOKEE_KK/vendor/htc/ace
mv android_vendor_htc_ace/* ~/MOKEE_KK/vendor/htc/ace
git clone https://github.com/DHDAIO/android_device_htc_msm7x30-common.git -b kk_mkt
mkdir ~/MOKEE_KK/device/htc/msm7x30-common
mv android_device_htc_msm7x30-common/* ~/MOKEE_KK/device/htc/msm7x30-common
cd ~/MOKEE_KK
rm -Rf ~/MOKEE_KK/ruling
. build/envsetup.sh
lunch mk_ace-userdebug
make bacon
read -p "Press [Enter] key to exit..."
exit
