TEMPLATE = app

QT += qml quick widgets
CONFIG += c++11

INCLUDEPATH += Include

HEADERS += \
    Include/DirectXaocApplication.h \

SOURCES += Source/Main.cpp \
    Source/DirectXaocApplication.cpp \

RESOURCES += \
    $$PWD/Qml/qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
include($$PWD/../dxs_qt_libs/dxs_qt_libs.pri)

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
        ../dxs_project_prototype/Android/src/com/dxs/project/prototype/DxsProjectPrototypeActivity.java

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/../dxs_project_prototype/Android
}
