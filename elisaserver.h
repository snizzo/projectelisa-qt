#ifndef ELISASERVER_H
#define ELISASERVER_H

#include <QQuickItem>

class ElisaServer : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QString nickname READ getNickname WRITE setNickname NOTIFY nicknameChanged)

private:
    QString m_nickname;
    QString temp_nickname;
    QString temp_password;
public:
    explicit ElisaServer(QQuickItem *parent = 0);

signals:
    void addMessageReply(QString reply);
    void registerUserReply(QString reply);
    void sendVerifyReply(QString reply);
    void loginReply(QString reply);
    void nicknameChanged();

public slots:
    //network
    Q_INVOKABLE void voteUp(QString id);
    void voteUpFinished();

    Q_INVOKABLE void voteDown(QString id);
    void voteDownFinished();

    Q_INVOKABLE void addMessage(QString body, double latitude, double longitude);
    void addMessageFinished();

    Q_INVOKABLE void sendVerify(QString nick, QString pass);
    void sendVerifyFinished();

    Q_INVOKABLE void registerUser(QString nick, QString pass, QString mail);
    void registerUserFinished();

    Q_INVOKABLE void login(QString id, QString pass);
    void loginFinished();

    Q_INVOKABLE void report(QString id);
    void reportFinished();

    //properties
    void setNickname(QString nick);
    QString getNickname();
};

#endif // ELISASERVER_H
