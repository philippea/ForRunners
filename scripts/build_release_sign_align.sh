#!/bin/bash

# Android
ionic build --release android
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore google-store.keystore ~/Projects/ForRunners/platforms/android/build/outputs/apk/android-x86-release-unsigned.apk ForRunners
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore google-store.keystore ~/Projects/ForRunners/platforms/android/build/outputs/apk/android-armv7-release-unsigned.apk ForRunners
rm x86_net.khertan.forrunners.apk
rm armv7_net.khertan.forrunners.apk

~/bin/android-sdk-linux/build-tools/19.1.0/zipalign -v 4 ./platforms/android/build/outputs/apk/android-x86-release-unsigned.apk x86_net.khertan.forrunners.apk
~/bin/android-sdk-linux/build-tools/19.1.0/zipalign -v 4 ./platforms/android/build/outputs/apk/android-armv7-release-unsigned.apk armv7_net.khertan.forrunners.apk


# FirefoxOS
cordova prepare
ionic build --release firefoxos
