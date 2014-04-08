#include "elisaoptions.h"
#include <QSettings>

ElisaOptions::ElisaOptions(QQuickItem *parent) :
    QQuickItem(parent)
{
    QSettings settings("writeitapp", QSettings::NativeFormat);
    if(settings.contains("firstrun")){
        setFirstrun(settings.value("firstrun").toBool());
    } else {
        setFirstrun(true);
    }
}

bool ElisaOptions::getFirstrun()
{
    return m_firstrun;
}

void ElisaOptions::setFirstrun(bool value)
{
    QSettings settings("writeitapp", QSettings::NativeFormat);
    m_firstrun = value;
    if(m_firstrun==true){
        settings.setValue("firstrun", true);
    } else {
        settings.setValue("firstrun", false);
    }
    settings.sync();
}
