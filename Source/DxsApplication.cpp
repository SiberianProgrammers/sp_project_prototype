#include <QDebug>
#include "DxsApplication.h"

dxs::DxsApplication::DxsApplication(int &argc, char **argv, const QString &title, int width, int height)
    : DxsApplicationPrototype (argc, argv, title, width, height)
{
    //  этом месте происходит регистрация классов
    //qmlRegisterType<dxs::XaocModel>("DXS", 1, 0, "XaocModel");
}
