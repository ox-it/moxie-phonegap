#!/bin/bash -e

if [[ $CORDOVA_PLATFORMS == *ios* ]]
then
    /usr/libexec/PlistBuddy -c "Set :CFBundleIcons:CFBundlePrimaryIcon:UIPrerenderedIcon true" platforms/ios/Mobile\ Oxford/Mobile\ Oxford-Info.plist
    /usr/libexec/PlistBuddy -c "Set :CFBundleIcons~ipad:CFBundlePrimaryIcon:UIPrerenderedIcon true" platforms/ios/Mobile\ Oxford/Mobile\ Oxford-Info.plist
fi
