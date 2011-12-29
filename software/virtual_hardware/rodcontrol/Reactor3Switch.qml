import QtQuick 1.0

Item
{
    id: reactor3Switch
    
    property int value: 0
    function up()
    {
        if (value < 1)
        {
            value = value+1
        }
    }
    function down()
    {
        if (value > -1)
        {
            value = value-1
        }
    }
    
    Rectangle
    {
        width: 30; height: 30
        Row
        {
            width: parent.width; height: parent.height
            Rectangle
            {
                width: parent.width/2; height: parent.height
                color: "red"
                Text
                {
                    text: reactor3Switch.value
                }
            }
            Rectangle
            {
                width: parent.width/2; height: parent.height
                Column
                {
                    width: parent.width; height: parent.height
                    Rectangle
                    {
                        width: parent.width; height: parent.height/2
                        Text
                        {
                            text: "+"
                        }
                        MouseArea
                        {
                            anchors.fill: parent
                            id: click_up
                            onClicked: { reactor3Switch.up() }
                        }
                    }
                    Rectangle
                    {
                        width: parent.width; height: parent.height/2
                        color: "green"
                        Text
                        {
                            text: "-"
                        }
                        MouseArea
                        {
                            anchors.fill: parent
                            id: click_down
                            onClicked: { reactor3Switch.down() }
                        }
                    }
                }
            }
        }
    }
}