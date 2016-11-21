#pragma once

#include <SpApplicationPrototype.h>

namespace sp {
class SpApplication: public SpApplicationPrototype
{
    public:
        SpApplication(int &argc, char **argv
                             , const QString &title
                             , int width = 250, int height = 400);
};
}
