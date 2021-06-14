#include "helper.h"
#include <QDebug>
#include<QVector>
#include <QRandomGenerator>
#include <QDialog>
#include <QMessageBox>
#include<QApplication>

helper::helper(QObject *parent) : QObject(parent)
{

}


QVector<int>helper::newGame()
{

     QVector<int> bricks = {
         1, 2, 3, 4,
         5, 6, 7, 8,
         9, 10, 11, 12,
         13, 14, 15, 16
     };

    return  bricks;    //готовый вектор
};

int helper::randomize(){
    int rchisl= rand()%1000+100;

        return rchisl;

}
int helper::randcicle(){
    int rcicle= rand()% 16;

        return rcicle;

}


void helper:: win(){
    qDebug()<<"win";
};
void  helper::timeout(){
    qDebug()<<"timeout";

};
