Jenkins config
==============

We use Jenkins to build our native applications for Android and iOS. Both builds have been developed and tested on iOS (for access to Xcode).

Android
-------

Dependencies:

 - Android SDK
 - Phonegap CLI (tested with 3.3.0-0.19.6)

Dependencies Jenkins:

 - Git SCM plugin

iOS
---

Dependencies

 - Xcode (tested with 5.1.1)
 - Phonegap CLI (tested with 3.3.0-0.19.6)

Dependencies Jenkins:

 - Git SCM plugin
 - Mask Passwords Plugin

You will also need to store appropriate signing key in `xcode.keychain`. These will be unlocked by the build itself, the password for this keychain should be stored in the Mask Password plugin as `KEYSTORE_PASS`.
