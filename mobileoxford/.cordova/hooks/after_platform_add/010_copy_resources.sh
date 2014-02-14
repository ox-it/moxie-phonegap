#!/bin/bash -e

RESOURCES=res


if [[ $CORDOVA_PLATFORMS == *android* ]]
then
    cp -r $RESOURCES/android/drawable-* platforms/android/res
fi
if [[ $CORDOVA_PLATFORMS == *ios* ]]
then
    rm platforms/ios/Mobile\ Oxford/Resources/icons/*
    rm platforms/ios/Mobile\ Oxford/Resources/splash/*

    cp $RESOURCES/ios/splash/* platforms/ios/Mobile\ Oxford/Resources/splash/
    cp $RESOURCES/ios/icons/* platforms/ios/Mobile\ Oxford/Resources/icons/
fi
