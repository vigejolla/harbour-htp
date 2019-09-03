import QtQuick 2.0
import Sailfish.Silica 1.0
import org.sailfish.htp 1.0


CoverBackground {
    Label {
        id: label
        anchors.top: parent.top
        anchors.topMargin: 25
        anchors.left: parent.left
        anchors.leftMargin: 50
        text: qsTr("BT Thermo")
    }
    Label {
        property var currentTemp: HtWatcher.temperature
        id: temperatureLabel
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: currentTemp + qsTr(" C")
    }
}
