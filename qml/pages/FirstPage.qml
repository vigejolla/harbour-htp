import QtQuick 2.0
import Sailfish.Silica 1.0
import org.sailfish.htp 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    HtWatcher {
        id: watcher
    }

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge

            property var currentTemp: watcher.temperature

            PageHeader {
                title: qsTr("Bluetooth Thermometer")
            }
            Label {
                x: Theme.horizontalPageMargin
                text: qsTr("Current temp: ") + column.currentTemp + qsTr(" C")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Button {
                anchors.horizontalCenter: column.horizontalCenter
                id: refreshButton
                text: qsTr("Refresh")
                onClicked: refreshButton.text = "Refresh"
            }
        }
    }
}
