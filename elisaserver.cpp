#include "elisaserver.h"

#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QUrl>
#include <QNetworkReply>
#include <QUrlQuery>
#include <QSettings>

ElisaServer::ElisaServer(QQuickItem *parent) :
    QQuickItem(parent)
{
    //loding saved user infos
    QSettings settings("writeitapp", QSettings::NativeFormat); //can be IniFormat, no difference
    temp_nickname = settings.value("username").toString();
    temp_password = settings.value("password").toString();



    login(temp_nickname, temp_password);
}

/*
 * Add message request set
 */
void ElisaServer::addMessage(QString body, double latitude, double longitude)
{
    //check if user is already logged
    if(m_nickname!=""){
        QNetworkAccessManager *manager = new QNetworkAccessManager(this);

        //set urls
        QUrl url;
        url.setUrl("http://projectelisa.altervista.org/main/post/?x="+QString::number(latitude,'g',10)+"&y="+QString::number(longitude,'g',10)+"&z=0&nick="+temp_nickname+"&pass="+temp_password);

        //add post params
        QByteArray postData;
        postData.append("body="+body);

        //bind network request
        QNetworkRequest request;
        request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
        request.setUrl(url);

        //define callback
        QNetworkReply * r;
        r = manager->post(request, postData);
        connect(r,SIGNAL(finished()),this,SLOT(addMessageFinished()));
    } else {
        emit addMessageReply("denied");
    }

}

void ElisaServer::addMessageFinished()
{
    QNetworkReply *reply = qobject_cast<QNetworkReply *>(sender());
    QByteArray data = reply->readAll();

    emit addMessageReply(QString(data));
}

/*
 * Register user request set
 */
void ElisaServer::registerUser(QString nick, QString pass, QString mail)
{
    //http://projectelisa.altervista.org/main/register/?nick="+n1+"&pass="+p1+"&mail="+m1;
    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    //set urls
    QUrl url;
    url.setUrl("http://projectelisa.altervista.org/main/register/?nick="+nick+"&pass="+pass+"&mail="+mail);

    //bind network request
    QNetworkRequest request;
    request.setUrl(url);

    //define callback
    QNetworkReply * r;
    r = manager->get(request);
    connect(r,SIGNAL(finished()),this,SLOT(registerUserFinished()));
}

void ElisaServer::registerUserFinished()
{
    QNetworkReply *reply = qobject_cast<QNetworkReply *>(sender());
    QByteArray data = reply->readAll();

    emit registerUserReply(QString(data));
}

void ElisaServer::login(QString id, QString pass)
{
    //set temporary login
    temp_nickname = id;
    temp_password = pass;

    //http://projectelisa.altervista.org/main/register/?nick="+n1+"&pass="+p1+"&mail="+m1;
    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    //set urls
    QUrl url;
    url.setUrl("http://projectelisa.altervista.org/main/auth/?nick="+id+"&pass="+pass);

    //bind network request
    QNetworkRequest request;
    request.setUrl(url);

    //define callback
    QNetworkReply * r;
    r = manager->get(request);
    connect(r,SIGNAL(finished()),this,SLOT(loginFinished()));
}

void ElisaServer::loginFinished()
{
    QNetworkReply *reply = qobject_cast<QNetworkReply *>(sender());
    QByteArray data = reply->readAll();

    QString r = QString(data);

    if(r=="ok"){
        setNickname(temp_nickname);
        qDebug() << "login executed";
    } else {
        temp_nickname = "";
        temp_password = "";
        qDebug() << "errors logging";
    }

    emit loginReply(r);
}

void ElisaServer::report(QString id)
{
    //check if user is already logged
    if(m_nickname!=""){
        QNetworkAccessManager *manager = new QNetworkAccessManager(this);

        //set urls
        QUrl url;
        url.setUrl("http://projectelisa.altervista.org/main/report/?target="+id);

        //bind network request
        QNetworkRequest request;
        request.setUrl(url);

        //define callback
        QNetworkReply * r;
        r = manager->get(request);
        connect(r,SIGNAL(finished()),this,SLOT(reportFinished()));
    } else {
    }
}

void ElisaServer::reportFinished()
{
}

//props
void ElisaServer::setNickname(QString nick)
{
    //saving user infos for next access
    QSettings settings("writeitapp", QSettings::NativeFormat); //can be IniFormat, no difference
    settings.setValue("username", nick);
    settings.setValue("password", temp_password);
    settings.sync();

    m_nickname = nick;
    emit nicknameChanged();
}

QString ElisaServer::getNickname()
{
    return m_nickname;
}


/*
 * Send email confirmation
 */
void ElisaServer::sendVerify(QString nick, QString pass)
{
    //http://projectelisa.altervista.org/main/register/?nick="+n1+"&pass="+p1+"&mail="+m1;
    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    //set urls
    QUrl url;
    url.setUrl("http://projectelisa.altervista.org/main/send_verify/?nick="+nick+"&pass="+pass);

    //bind network request
    QNetworkRequest request;
    request.setUrl(url);

    //define callback
    QNetworkReply * r;
    r = manager->get(request);
    connect(r,SIGNAL(finished()),this,SLOT(sendVerifyFinished()));
}

void ElisaServer::sendVerifyFinished()
{
    QNetworkReply *reply = qobject_cast<QNetworkReply *>(sender());
    QByteArray data = reply->readAll();

    emit sendVerifyReply(QString(data));
}
