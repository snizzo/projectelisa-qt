#ifndef ELISAOPTIONS_H
#define ELISAOPTIONS_H

#include <QQuickItem>

class ElisaOptions : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(bool firstrun READ getFirstrun WRITE setFirstrun NOTIFY firstrunChanged)
private:
    bool m_firstrun;
public:
    explicit ElisaOptions(QQuickItem *parent = 0);

signals:
    void firstrunChanged();

public slots:
    bool getFirstrun();
    void setFirstrun(bool value);

};

#endif // ELISAOPTIONS_H
