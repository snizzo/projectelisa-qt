import QtQuick 2.0
import QtQuick.Controls 1.1
import "../ElisaComponents"

Rectangle {
    id: me

    //uninitialized tutorial
    property int currentpage: 0;

    anchors.fill: parent
    visible: false

    color: "white"

    function start()
    {
        me.visible = true;
    }

    MouseArea{
        anchors.fill: parent
    }

    EBoxBackground{
        target : flicker
    }
    Flickable{
        id:flicker
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.bottom: buttonsrow.top
        anchors.bottomMargin: 30

        contentHeight: page.height
        contentWidth: page.width

        flickableDirection: Flickable.VerticalFlick

        clip:true

        Text{
            id: page
            width: parent.width -10


            wrapMode: Text.WordWrap
        }
    }

    Item{
        id: buttonsrow
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30

        height: 50

        Button{
            id: prevbutton
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            text: "prev"

            onClicked: {
                var selector = currentpage;
                if(selector==2){
                    page1();
                }
                if(selector==3){
                    page2();
                }
            }
        }

        //these 2 buttons actually overlaps themselves
        Button{
            id: nextbutton
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            text: "next"

            onClicked: {
                var selector = currentpage;
                if(selector==1){
                    page2();
                }
                if(selector==2){
                    page3();
                }
                if(selector==3){
                    me.visible = false;
                }
            }
        }

    }

    Component.onCompleted: {
        page1();
        currentpage = 1;
    }

    function page1()
    {
        page.text = "<b>Welcome to WriteItApp</b><br>
        <br>This app lets you discover the messages that people left literally around you, where you and your smartphone are located. And leave your own for the others. <br><br>Imagine a world full of post-it, a community that moves around but stay still! Here you are! <br><h1> Fill the world!</h1>";

        nextbutton.visible = true;
        prevbutton.visible = false;

        currentpage = 1;
    }

    function page2()
    {
        page.text = "<b>How to use it</b><br><br>You can use the slider to adjust the power of your message receiver. It ranges from ~4 meters to ~110 meters.<br><br>Type your message and it will stay there where you are at the moment you send it. Everyone can see your messages by passing by there so be careful not to share relevant informations.<br><br>You can vote up and down messages. Votes are public."

        nextbutton.visible = true;
        prevbutton.visible = true;

        currentpage = 2;
    }

    function page3()
    {
        page.text = "<b>GPS advices</b><br><br>When indoor, WriteItApp will approximate your position <i>without</i> GPS. When outdoor remember to enable GPS on your phone so WriteItApp can take a more precise position.<br><br>And remember to<br><h1>Have fun!</h1>"

        nextbutton.visible = true;
        prevbutton.visible = true;

        currentpage = 3;
    }
}
