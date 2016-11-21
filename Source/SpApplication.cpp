#include <QDebug>
#include "SpApplication.h"

sp::SpApplication::SpApplication(int &argc, char **argv, const QString &title, int width, int height)
    : SpApplicationPrototype (argc, argv, title, width, height)
{
    //  этом месте происходит регистрация классов
    //qmlRegisterType<sp::XaocModel>("SP", 1, 0, "XaocModel");
}
