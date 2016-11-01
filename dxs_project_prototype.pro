TEMPLATE = app

QT += qml quick widgets
CONFIG += c++11

include(Programmer.pri)
include(Deployment.pri)
include($$PWD/../dxs_qt_libs/dxs_qt_libs.pri)

INCLUDEPATH += Include
HEADERS += \
    Include/DxsApplication.h

SOURCES += Source/Main.cpp \
    Source/DxsApplication.cpp

RESOURCES += \
    $$PWD/Qml/qml.qrc

android {
    QT += androidextras

    DISTFILES += \
        ../dxs_project_prototype/Android/AndroidManifest.xml \
        ../dxs_project_prototype/Android/gradle/wrapper/gradle-wrapper.jar \
        ../dxs_project_prototype/Android/gradlew \
        ../dxs_project_prototype/Android/res/values/libs.xml \
        ../dxs_project_prototype/Android/build.gradle \
        ../dxs_project_prototype/Android/gradle/wrapper/gradle-wrapper.properties \
        ../dxs_project_prototype/Android/gradlew.bat \
        ../dxs_project_prototype/Android/src/com/dxs/projectPrototype/DxsProjectPrototypeActivity.java

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/../dxs_project_prototype/Android
}
