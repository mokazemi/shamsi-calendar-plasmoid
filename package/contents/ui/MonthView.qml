import QtQuick 2.12

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents3

Grid {
  id: monthView
  property int dayNumberHeight: Math.round((calendar.cellHeight * 80) / 100) // 80% of cell for number
  property int dayEventsHeight: calendar.cellHeight - dayNumberHeight // 20% of cell for event badges

  columns: 7
  rows: 7
  columnSpacing: 0
  rowSpacing: 0
  
  Repeater { // days name Repeater
    id: daysName
    model: ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'] // TODO: temp data for ui testing purpose

    PlasmaComponents3.Label {
      text: modelData
      width: calendar.cellWidth
      height: calendar.cellDaysNamesHeight
      verticalAlignment: Text.AlignBottom
      horizontalAlignment: Text.AlignHCenter
      opacity: 0.5
      maximumLineCount: 1
      elide: Text.ElideRight
      font.pixelSize: PlasmaCore.Theme.defaultFont.pixelSize
    }
  } // end days name Repeater

  Repeater { // days number Repeater
    id: daysRepeater
    model: Array.from(Array(42).keys()) // TODO: temp data for ui testing purpose

    Item { // cell container Item
      id: cellContainer
      width: calendar.cellWidth
      height: calendar.cellHeight

      // TODO: add weekend highlight 
      // Rectangle {
      //   anchors.fill: parent
      //   color: "gray"
      // }

      Column { // cell design
        width: parent.width
        height: parent.height
        spacing: 0

        PlasmaComponents3.Label { // cell top (number)
          text: modelData
          width: height
          height: monthView.dayNumberHeight
          anchors.horizontalCenter: parent.horizontalCenter
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          opacity: 1
          maximumLineCount: 1
          elide: Text.ElideRight
          font.pixelSize: PlasmaCore.Theme.defaultFont.pixelSize * 1.2
          font.weight: Font.DemiBold          
          background: Rectangle {
            radius: width * 10
            color: 'blue'
          }
        } // end cell top (number)

        Row { // cell bottom (event badges)
          height: monthView.dayEventsHeight
          anchors.horizontalCenter: parent.horizontalCenter
          spacing: PlasmaCore.Units.gridUnit / 4

          Rectangle {
            width: height
            height: PlasmaCore.Units.gridUnit / 4
            radius: 180
            color: 'orange'
          }

          Rectangle {
            width: height
            height: PlasmaCore.Units.gridUnit / 4
            radius: 180
            color: 'gray'
          }
        } // end cell bottom (event badges)

      } // end column
    } // end cell container Item
  } // end days number Repeater
} // end Grid
