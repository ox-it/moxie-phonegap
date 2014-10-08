Moxie Phonegap
==============

Building Mobile Oxford with Phonegap.

Release
-------

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
