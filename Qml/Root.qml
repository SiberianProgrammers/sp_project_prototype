import QtQuick 2.7
import SP 1.0
import "./"
import "qrc:/SpQml"

Item {
    id: root

    width: Window.width
    height: Window.height

    ActionBar {
        id: actionBar
    }

    Rectangle {
        id: background

        color: Consts.lightGray
        z: -1
    }

    Text {
        width: parent.width - 2*Consts.marginBig
        anchors.centerIn: parent
        font.pixelSize: Consts.fontNormal
        lineHeight: 1.2
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Пустой проект Sp, включающий в себя Root.qml, Consts.qml, DxsActivity.java")
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }
}
