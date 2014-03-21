#ifndef ELISASERVER_H
#define ELISASERVER_H

#include <QQuickItem>

class ElisaServer : public QQuickItem
{
    Q_OBJECT
public:
    explicit ElisaServer(QQuickItem *parent = 0);

signals:
    void addMessageReply(QString reply);

public slots:

    Q_INVOKABLE void addMessage(QString body, double latitude, double longitude);
    void addMessageFinished();
};

#endif // ELISASERVER_H
