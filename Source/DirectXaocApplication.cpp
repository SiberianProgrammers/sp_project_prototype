#include <QDebug>
#include "DirectXaocApplication.h"

dxs::DirectXaocApplication::DirectXaocApplication(int &argc, char **argv, const QString &title, int width, int height)
    : DxsApplication (argc, argv, title, width, height)
{
    //  этом месте происходит регистрация классов
    //qmlRegisterType<dxs::XaocModel>("DXS", 1, 0, "XaocModel");
}
