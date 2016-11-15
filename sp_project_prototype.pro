TEMPLATE = app

QT += qml quick widgets
CONFIG += c++11

include(Programmer.pri)
include(Deployment.pri)
include($$PWD/../sp_qt_libs/sp_qt_libs.pri)

INCLUDEPATH += Include
HEADERS += \
    Include/SpApplication.h

SOURCES += Source/Main.cpp \
    Source/SpApplication.cpp

RESOURCES += \
    $$PWD/Qml/qml.qrc

android {
    QT += androidextras

    DISTFILES += \
        ../sp_project_prototype/Android/AndroidManifest.xml \
        ../sp_project_prototype/Android/gradle/wrapper/gradle-wrapper.jar \
        ../sp_project_prototype/Android/gradlew \
        ../sp_project_prototype/Android/res/values/libs.xml \
        ../sp_project_prototype/Android/build.gradle \
        ../sp_project_prototype/Android/gradle/wrapper/gradle-wrapper.properties \
        ../sp_project_prototype/Android/gradlew.bat \
        ../sp_project_prototype/Android/src/com/sp/projectPrototype/SpProjectPrototypeActivity.java

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/../sp_project_prototype/Android
}
