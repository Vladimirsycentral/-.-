import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15

Rectangle{


    width: 200
    height: 200

    property int config: 0
    property int movement: 0
    property bool light: false
    color: "darkgrey"
    border.width: 1
        border.color: "black"


    function move(){
        movement = 1

    }


    signal mooved(int config)



    Image {

        id: image2
        source: "qrc:/images/2.jpg"
        visible: (parent.config)==2

    }

    Image {

        id: image3
        source: "qrc:/images/3.jpg"
        visible: (parent.config)==3

    }
    Image {

        id: image4
        source: "qrc:/images/4.jpg"
        visible: (parent.config)==4

    }
    Image {

        id: image5
        source: "qrc:/images/5.jpg"
        visible: (parent.config)==5

    }
    Image {

        id: image6
        source: "qrc:/images/6.jpg"
        visible: (parent.config)==6

    }
    Image {

        id: image7
        source: "qrc:/images/7.jpg"
        visible: (parent.config)==7

    }
    Image {

        id: image8
        source: "qrc:/images/8.jpg"
        visible: (parent.config)==8

    }
    Image {

        id: image9
        source: "qrc:/images/9.jpg"
        visible: (parent.config)==9

    }
    Image {

        id: image10
        source: "qrc:/images/10.jpg"
        visible: (parent.config)==10

    }
    Image {

        id: image11
        source: "qrc:/images/11.jpg"
        visible: (parent.config)==11

    }
    Image {

        id: image12
        source: "qrc:/images/12.jpg"
        visible: (parent.config)==12

    }
    Image {

        id: image13
        source: "qrc:/images/13.jpg"
        visible: (parent.config)==13

    }
    Image {

        id: image14
        source: "qrc:/images/14.jpg"
        visible: (parent.config)==14

    }
    Image {

        id: image15
        source: "qrc:/images/15.jpg"
        visible: (parent.config)==15

    }
    Image {
        id: image16
        source: "qrc:/images/16.jpg"
        visible: (parent.config)==16

    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            move()

            mooved(parent.config)
        }
    }
}
