#pragma once

#include <SpApplicationPrototype.h>

#if defined(qApp)
#undef qApp
#endif
#define qApp (static_cast<sp::SpApplicationPrototype *>(QCoreApplication::instance()))

namespace sp {
class SpApplication: public SpApplicationPrototype
{
    public:
        SpApplication(int &argc, char **argv
                             , const QString &title
                             , int width = 250, int height = 400);
};
}
