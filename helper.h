#ifndef HELPER_H
#define HELPER_H

#include <QObject>
#include<QVector>

class helper : public QObject
{
    Q_OBJECT
public:
    explicit helper(QObject *parent = nullptr);

signals:

public slots:
    QVector<int> newGame();
    int randcicle();
    int randomize();

    void win();
    void timeout();
};

#endif // HELPER_H
