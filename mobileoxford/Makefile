SHELL := /bin/bash -e

PG=phonegap

PLUGINSIOS=plugins-ios.txt
PLUGINSANDROID=plugins-android.txt
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

plugins-ios:
	mkdir -p $(PLUGINSDIR)
	while read p; do \
		$(PG) local plugin add $$p; \
	done < $(PLUGINSIOS)

plugins-android:
	mkdir -p $(PLUGINSDIR)
	while read p; do \
		$(PG) local plugin add $$p; \
	done < $(PLUGINSANDROID)

assets:
	mkdir -p $(ASSETSDIR)
	mkdir -p $(ASSETSDIR)/webfonts/weather-icons
	mkdir -p $(ASSETSDIR)/webfonts/font-awesome
	cp -R $(MOXIEDIR)/webfonts/weather-icons/font $(ASSETSDIR)/webfonts/weather-icons
	cp -R $(MOXIEDIR)/webfonts/weather-icons/css $(ASSETSDIR)/webfonts/weather-icons
	cp -R $(MOXIEDIR)/webfonts/font-awesome/fonts $(ASSETSDIR)/webfonts/font-awesome
	cp -R $(MOXIEDIR)/webfonts/font-awesome/css $(ASSETSDIR)/webfonts/font-awesome
	cp -R $(MOXIEDIR)/images $(ASSETSDIR)
	cp $(MOXIEDIR)/index-phonegap.html $(ASSETSDIR)/index.html
	cp $(MOXIEDIR)/config.xml $(ASSETSDIR)/config.xml
	cd $(MOXIEDIR); r.js -o app/moxie.build.js
	cd $(MOXIEDIR); bundle exec compass compile
	cp $(MOXIEDIR)/app/main-built.js $(ASSETSDIR)/app.js
	cp -R $(MOXIEDIR)/css $(ASSETSDIR)

build-android:
	mkdir -p $(PLATFORMDIR)
	$(PG) local build android
	mkdir -p bin
	cp platforms/android/ant-build/$(ANDROIDAPP) bin/

clean:
	rm -rf www/*
	rm -rf plugins/*
	rm -rf platforms/*

install:
	adb uninstall $(ANDROIDPACKAGE)
	adb install bin/$(ANDROIDAPP)
