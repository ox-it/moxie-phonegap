#!/bin/bash -e

RESOURCES=res


if [[ $CORDOVA_PLATFORMS == *android* ]]
then
    cp -r $RESOURCES/android/drawable-* platforms/android/res
fi
