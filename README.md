
# [DEPRECATED] Moxie Phonegap

This plugin is deprecated, i.e. it is no longer maintained. If you want to build the [moxie-js-client  project](https://github.com/ox-it/moxie-js-client) using Cordova, you can follow the instructions listed at [moxie-js-client: Cordova build](https://github.com/ox-it/moxie-js-client#cordova-build)

# Moxie Phonegap

Building Mobile Oxford with Phonegap.

## Android Release

Run the usual process using Makefile...

    phonegap local build android

Go to the specific platform and run the release task with ant:

    cd platforms/android
    ant release

Sign the JAR using our keystore:

    cd bin
    jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore path-to-keystore MobileOxford-release-unsigned.apk mox_release

Verify the JAR:

    jarsigner -verify -verbose -certs MobileOxford-release-unsigned.apk

Optimise it using zipalign:

    zipalign -v 4 MobileOxford-release-unsigned.apk MobileOxford.apk

See [Android documentation](http://developer.android.com/tools/publishing/app-signing.html#releasemode) for more information; we should also consider automating the release process as much as possible...

## iOS release

Run the usual process (and see jenkins/ios/configuration.xml), but add the following flags:

    phonegap build --device --release
