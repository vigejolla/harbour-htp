#include "htwatcher.h"

HtWatcher::HtWatcher(QObject *parent) : QObject(parent)
{

}

double HtWatcher::temperature() const
{
    return m_temperature;
}

void HtWatcher::setTemperature(double temperature)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_temperature, temperature))
        return;

    m_temperature = temperature;
    emit temperatureChanged(m_temperature);
}
