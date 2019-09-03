#include "htwatcher.h"
#include <QDBusConnection>
#include <QDBusInterface>
#include <QMap>
#include <QtMath>

HtWatcher::HtWatcher(QObject *parent) : QObject(parent)
{
    QDBusConnection systembus = QDBusConnection::systemBus();
    systembus.registerObject("/sailfish/htp/htwatcher", this);
    QDBusInterface* manager = new QDBusInterface("org.bluez", "/org/bluez/hci0", "org.bluez.ThermometerManager1", systembus, this);
    manager->call("RegisterWatcher", "/sailfish/htp/htwatcher");
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

void HtWatcher::MeasurementReceived(QMap<QString, QVariant> measurement)
{
    int mantissa = measurement.value("Mantissa").toInt();
    int exponent = measurement.value("Exponent").toInt();
    setTemperature(mantissa * qPow(10, exponent));
}
