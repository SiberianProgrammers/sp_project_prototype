#pragma once

#include <DxsApplication.h>

namespace dxs {
class DirectXaocApplication: public DxsApplication
{
    public:
        DirectXaocApplication(int &argc, char **argv
                             , const QString &title
                             , int width = 250, int height = 400);
};
}
