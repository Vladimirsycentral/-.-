import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3



RowLayout{
    signal newGame()
    signal win()
    signal timeout()
    signal clearGame()
    signal quitApp()

    function timeStop(){
        timer.running=false
    }

    Button{
        id: but_new
            text: "New game"
            onClicked: {

                newGame()
                timer.running= true
                timer.time=0
            }
    }
    TextField
    {
         id: text_timer
         Layout.fillWidth: true
         readOnly: true
         //text: "100"
    }
    Button
    {
             id: but_exit
            text: "exit"
            onClicked: quitApp()
    }

    Shortcut
    {
        sequences: ["N"]
        context: Qt.ApplicationShortcut
        onActivated:{
            newGame()
            timer.running= true
            timer.time=0
        }


    }
    Shortcut
    {
        sequences: [ "StandardKey.Close","Q"]
        context: Qt.ApplicationShortcut
        onActivated: quitApp()
    }
    Timer {
            id:timer
            interval: 1000
            repeat: true
            running: false
            property int time: 0

            onTriggered: {
               text_timer.text = 180-time
                if(time === 180){
                     timer.running=false
                     clearGame()
                     timeout()
                     timer.time =-1
                }
                time++
            }

        }
}

