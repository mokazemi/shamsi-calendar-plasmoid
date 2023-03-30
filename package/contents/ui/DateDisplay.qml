import QtQuick 2.12

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 3.0 as PlasmaComponents3

MouseArea {
  id: displayDate

  property int secondaryHeight: Math.round(((Plasmoid.configuration.secondaryTextHeight / 100) * parent.height))

  onClicked: Plasmoid.expanded = !Plasmoid.expanded

  Column {
    anchors.fill: parent

    PlasmaComponents3.Label {
      id: primaryText
      width: parent.width
      height: Plasmoid.configuration.secondaryText 
        ? parent.height - displayDate.secondaryHeight
        : parent.height
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      minimumPointSize: 1
      font.pixelSize: 1000
      fontSizeMode: Text.Fit
      text: {
        const locale = Qt._sc_.useLocale();
        const displayDate = new persianDate(Qt._sc_.store.calendarSlice.jToday)
                              .toLocale(locale)
                              .format(Plasmoid.configuration.panelPrimaryTextFormat);
        return displayDate;
      }
    }

    PlasmaComponents3.Label {
      id: secondaryText
      visible: Plasmoid.configuration.secondaryText
      width: parent.width
      height: displayDate.secondaryHeight
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      minimumPointSize: 1
      font.pixelSize: 1000
      fontSizeMode: Text.Fit
      text: {
        const locale = Qt._sc_.useLocale();
        const displayDate = new persianDate(Qt._sc_.store.calendarSlice.jToday)
                              .toLocale(locale)
                              .format(Plasmoid.configuration.panelSecondaryTextFormat);
        return displayDate;
      }
    }

  }
}