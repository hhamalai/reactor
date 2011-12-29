import QtQuick 1.0

Rectangle
{
    id: switches
    width: 400; height: 400;
    // Rows
    Column
    {
        spacing: 5
        Repeater 
        {
            id: rowrepeater
            model: 7
            Rectangle
            {
                width: switches.width; height: 30
                Row
                {
                    spacing: 5
                    Repeater 
                    {
                        model: 7
                        id: columnrepeater
                        Rectangle
                        {
                            width: 30; height: 30
                            Text
                            {
                                text: index
                                font.pointSize: 15
                            }
                        }
                    }
                }
            }
        }
    }
    

    /*
    Grid
    {
        x: 5; y: 5
        rows: 5; columns: 5; spacing: 10
        Repeater 
        {
            model: 24
            Rectangle
            {
                width: 70; height: 70
                color: "lightgreen"
                Text
                {
                    text: index
                    font.pointSize: 30
                    anchors.centerIn: parent
                }
            }
        }
    }
    */

}