# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-htp

CONFIG += sailfishapp

SOURCES += src/harbour-htp.cpp \
    src/htwatcher.cpp

DISTFILES += qml/harbour-htp.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/harbour-htp.changes.in \
    rpm/harbour-htp.changes.run.in \
    rpm/harbour-htp.spec \
    rpm/harbour-htp.yaml \
    translations/*.ts \
    harbour-htp.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

QT += dbus

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-htp-de.ts

HEADERS += \
    src/htwatcher.h
