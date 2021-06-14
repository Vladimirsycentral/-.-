import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
GridLayout{
    id: game
    width: 800
    height: 800

    columns:4
    rows: 4
    columnSpacing: 0
    rowSpacing: 0
    signal timeStop()

    function newGame(){
        var newGameConfig =  helper.newGame()
        dialog.win = false
        for (var i = 0; i<16; i++)
            bricks.itemAt(i).config = newGameConfig[i]

    }
    function cleanGame(){
        for (var i = 0; i<100; i++)
            bricks.itemAt(i).config = 0
    }


//     Перемешивание
    function rotate(){
        var d = helper.randomize()

        for (var i = 0; i<d; i++){


                var j =  helper.randcicle()
                if (j < 15){
               if(bricks.itemAt(j+1).config ===1){
               bricks.itemAt(j+1).config=bricks.itemAt(j).config
                  bricks.itemAt(j).config=1
               };
                }
                if (j > 0){
               if(bricks.itemAt(j-1).config ===1){
                  bricks.itemAt(j-1).config=bricks.itemAt(j).config
                  bricks.itemAt(j).config=1
               };
                }
                if  (j < 12){
               if(bricks.itemAt(j+4).config ===1){
                  bricks.itemAt(j+4).config=bricks.itemAt(j).config
                  bricks.itemAt(j).config=1
               };
                }
                if(j > 3){
               if(bricks.itemAt(j-4).config ===1){
                  bricks.itemAt(j-4).config=bricks.itemAt(j).config
                  bricks.itemAt(j).config=1
               };
                }


            }




        }


    //Если ивышло время
    function timeout(){
        dialog.texts="время вышло"
        dialog.win = true
        cleanGame()
    }
    //Если мы выйграли
    function win(){
        timeStop()
        dialog.texts="вы выйграли!"
        dialog.win = true


    }
    function move(){
       for(var i=0;i<16;i++){
           var cn=0
           var l=0

           cn=bricks.itemAt(i).movement;
           if(cn === 1){
                       bricks.itemAt(i).movement=0;
                        if (i < 15){
                       if(bricks.itemAt(i+1).config ===1){
                       bricks.itemAt(i+1).config=bricks.itemAt(i).config
                          bricks.itemAt(i).config=1
                       };
                        }
                        if (i > 0){
                       if(bricks.itemAt(i-1).config ===1){
                          bricks.itemAt(i-1).config=bricks.itemAt(i).config
                          bricks.itemAt(i).config=1
                       };
                        }
                        if  (i < 12){
                       if(bricks.itemAt(i+4).config ===1){
                          bricks.itemAt(i+4).config=bricks.itemAt(i).config
                          bricks.itemAt(i).config=1
                       };
                        }
                        if(i > 3){
                       if(bricks.itemAt(i-4).config ===1){
                          bricks.itemAt(i-4).config=bricks.itemAt(i).config
                          bricks.itemAt(i).config=1
                       };
                        }
           }
        }
    var b=0
    for (i=0; i<16; i++){
        if (bricks.itemAt(i).config === (i+1))
            b++
    };
    if (b >= 15) {
    console.log("Win!")
                win()
    }
    b=0

       }



    Repeater{
        id:bricks
        model:16

        Brick {
                onMooved:cl_game.move()
        }

    Component.onCompleted:  {
        newGame()
    }
    }
    Dialog {
        property bool win: false
        property string texts: "-1"
        height: 300
        width:500
        id: dialog
        Label {
                text:dialog.texts
            }
        title:texts
        modal: true
        standardButtons: Dialog.Ok
        anchors.centerIn: parent
        visible: win
    }


}
