#include "elisaserver.h"

#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QUrl>
#include <QNetworkReply>
#include <QUrlQuery>

ElisaServer::ElisaServer(QQuickItem *parent) :
    QQuickItem(parent)
{
}

// TODO: add header definition and work on this get -> post request
void ElisaServer::addMessage(QString body, double latitude, double longitude)
{
    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    //set urls
    QUrl url;
    url.setUrl("http://projectelisa.altervista.org/main/post/?x="+QString::number(latitude,'g',10)+"&y="+QString::number(longitude,'g',10)+"&z=0&owner=000000");

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
}

void ElisaServer::addMessageFinished()
{
    QNetworkReply *reply = qobject_cast<QNetworkReply *>(sender());
    QByteArray data = reply->readAll();

    emit addMessageReply(QString(data));
}


