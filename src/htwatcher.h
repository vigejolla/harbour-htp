#ifndef HTWATCHER_H
#define HTWATCHER_H

#include <QObject>

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
};

#endif // HTWATCHER_H
