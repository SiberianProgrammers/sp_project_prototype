#pragma once

#include <DxsApplicationPrototype.h>

namespace dxs {
class DxsApplication: public DxsApplicationPrototype
{
    public:
        DxsApplication(int &argc, char **argv
                             , const QString &title
                             , int width = 250, int height = 400);
};
}
