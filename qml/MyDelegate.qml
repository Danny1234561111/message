import QtQuick
import Felgo

Item {
    id:deleg
    property string message: "?"
    property string time: "?"
    Row{
        id:row
        anchors.left:parent.left
        anchors.right: parent.right
        height:parent.height
        spacing:10
        Text{ text:name }
        Text{ text:surname}
        Text{ text:phoneNumber}
    }
}
