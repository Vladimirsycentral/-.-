import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


Window {
    id: win
    minimumWidth: 800
    minimumHeight:  cl.height+10
    maximumWidth: 800
    maximumHeight:  cl.height+10
    visible: true
    title: qsTr("THE GAME")
    ColumnLayout{
        id:cl
        anchors.centerIn: parent
        spacing: 0
        Gameplay{
            id:cl_game
            onTimeStop: {
               cl_tool.timeStop()
            }

        }
        Toolbar{
            id:cl_tool

            onQuitApp:{
                Qt.quit()
            }
            onNewGame: {
                cl_game.newGame()
                cl_game.rotate()

            }
            onClearGame: {
                cl_game.cleanGame()
            }
            onTimeout: {
                cl_game.timeout()
            }
            onWin: {
                cl_game.cleanGame()
                cl_game.win()
            }

        }
    }

}
