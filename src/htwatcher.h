#ifndef HTWATCHER_H
#define HTWATCHER_H

#include <QObject>
#include <QMap>
#include <QString>
#include <QVariant>

class HtWatcher : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double temperature READ temperature WRITE setTemperature NOTIFY temperatureChanged)
    double m_temperature;

public:
    explicit HtWatcher(QObject *parent = nullptr);

    double temperature() const;

signals:

    void temperatureChanged(double temperature);

public slots:
    void setTemperature(double temperature);
    void MeasurementReceived(QMap<QString, QVariant> measurement);
};

#endif // HTWATCHER_H
