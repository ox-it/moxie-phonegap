SHELL := /bin/bash -e

PG=phonegap

PLUGINSTXT=plugins.txt
PLUGINSDIR=plugins

ASSETSDIR=www
MOXIEDIR=moxie-js-client

PLATFORMDIR=platforms

BINDIR=bin
ANDROIDAPP=MobileOxford-debug.apk
ANDROIDPACKAGE=uk.ac.ox.it.mobileoxford

.DEFAULT: all
.PHONY: all plugins
all: assets build-android

plugins:
	mkdir -p $(PLUGINSDIR)
	while read p; do \
		$(PG) local plugin add $$p; \
	done < $(PLUGINSTXT)

assets:
	mkdir -p $(ASSETSDIR)
	cp $(MOXIEDIR)/index-phonegap.html $(ASSETSDIR)/index.html
	cp $(MOXIEDIR)/config.xml $(ASSETSDIR)/config.xml
	cp -R $(MOXIEDIR)/images $(ASSETSDIR)
	cp -R $(MOXIEDIR)/webfonts $(ASSETSDIR)
	cd $(MOXIEDIR); r.js -o app/moxie.build.js
	cd $(MOXIEDIR); bundle exec compass compile
	cp $(MOXIEDIR)/app/main-built.js $(ASSETSDIR)/app.js
	cp -R $(MOXIEDIR)/css $(ASSETSDIR)

splash-icons:
	mkdir -p platforms/android/res/drawable-ldpi
	mkdir -p platforms/android/res/drawable-mdpi
	mkdir -p platforms/android/res/drawable-hdpi
	mkdir -p platforms/android/res/drawable-xhdpi
	mkdir -p platforms/android/res/drawable
	cp $(MOXIEDIR)/images/android/ldpi.png platforms/android/res/drawable-ldpi/screen.png
	cp $(MOXIEDIR)/images/android/mdpi.png platforms/android/res/drawable-mdpi/screen.png
	cp $(MOXIEDIR)/images/android/hdpi.png platforms/android/res/drawable-hdpi/screen.png
	cp $(MOXIEDIR)/images/android/xhdpi.png platforms/android/res/drawable-xhdpi/screen.png
	cp $(MOXIEDIR)/images/android/mdpi.png platforms/android/res/drawable/screen.png

build-android:
	mkdir -p $(PLATFORMDIR)
	if [ ! -d $(PLUGINSDIR) ]; then \
		$(MAKE) plugins; \
	fi
	$(PG) platform update android
	$(MAKE) splash-icons;
	$(PG) local build android
	mkdir -p bin
	cp platforms/android/bin/$(ANDROIDAPP) bin/

clean:
	rm -rf platforms
	rm -rf www

install:
	adb uninstall $(ANDROIDPACKAGE)
	adb install bin/$(ANDROIDAPP)
