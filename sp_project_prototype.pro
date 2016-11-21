TEMPLATE = app

QT += qml quick widgets
CONFIG += c++11

include(Programmer.pri)
include(Deployment.pri)
include($$PWD/../sp_qt_libs/sp_qt_libs.pri)

INCLUDEPATH += Include
HEADERS += \
    Include/SpApplication.h \
    Include/JniSetup.h \
    Include/Consts.h

SOURCES += Source/Main.cpp \
    Source/SpApplication.cpp \
    Source/JniSetup.cpp

RESOURCES += \
    $$PWD/Qml/qml.qrc \
    Qml/images.qrc \
    Qml/fonts.qrc

android {
    QT += androidextras

    DISTFILES += \
        Android/AndroidManifest.xml \
        Android/gradle/wrapper/gradle-wrapper.jar \
        Android/gradlew \
        Android/res/values/libs.xml \
        Android/build.gradle \
        Android/gradle/wrapper/gradle-wrapper.properties \
        Android/gradlew.bat \
        Android/src/com/sp/projectPrototype/SpProjectPrototypeActivity.java

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/Android
}
