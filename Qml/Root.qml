import QtQuick 2.7
import DXS 1.0
import "./"
import "qrc:/DxsQml"

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
        text: qsTr("Пустой проект Dxs, включающий в себя Root.qml, Consts.qml, DxsActivity.java")
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }
}
