unix:!android {
    isEmpty(target.path) {
        qnx {
            target.path = /tmp/$${TARGET}/bin
        } else {
            target.path = /opt/$${TARGET}/bin
        }
        export(target.path)
    }
    INSTALLS += target
}

android {
    # Добавляем в проект DxsActivity.java
    deployment.files += $$PWD/../dxs_qt_libs/android/src/dxs/DxsActivity.java
    deployment.path = $$system_path(/src/dxs/)
    INSTALLS += deployment
}

export(INSTALLS)
