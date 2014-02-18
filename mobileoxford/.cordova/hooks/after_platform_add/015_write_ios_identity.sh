#!/bin/bash -e

if [[ $CORDOVA_PLATFORMS == *ios* ]]
then
    echo "CODE_SIGN_IDENTITY = iPhone Distribution: University of Oxford (SNU2YAUFNA)" > platforms/ios/cordova/build.xcconfig
fi
