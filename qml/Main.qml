import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: "Input Example"

    ListModel {
        id: my_model
    }

    ListView {
        id: my_list
        anchors.fill: parent
        model: my_model
        delegate: Item {
            width: parent.width
            height: 40
            Row {
                width: parent.width
                Text {
                    text: model.message
                    font.pointSize: 16
                }
                Text {
                    anchors.right:parent.right
                    text: model.time
                    font.pointSize: 16
                    color: "gray"
                }
            }
        }
    }

    Row {
        spacing: 10
        anchors.bottom: parent.bottom
        width: parent.width
        // Окно ввода с фоном
        Item {
            id: hah
            anchors.bottom: parent.bottom
            width: parent.width-100
            height: 30

            TextInput {
                id: inputField
                anchors.fill: parent
                font.pointSize: 16
                onTextChanged: {
                    console.log("Текст изменен: " + inputField.text)
                }
            }
        }

        // Кнопка для вывода введенного текста
        Button {
            text: "Отправить"
            onClicked: {
                my_model.append({"message": inputField.text, "time": getCurrentTime()});
                inputField.text = ""; // Очищаем поле ввода после добавления
            }
        }
    }

    function getCurrentTime() {
        var currentDate = new Date();
        return currentDate.getHours().toString().padStart(2, '0') + ":" +
               currentDate.getMinutes().toString().padStart(2, '0') + ":" +
               currentDate.getSeconds().toString().padStart(2, '0');
    }
}
