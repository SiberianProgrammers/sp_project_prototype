#pragma once

#include <SpApplicationPrototype.h>

#if defined(qApp)
#undef qApp
#endif
#define qApp (static_cast<sp::SpApplication *>(QCoreApplication::instance()))

namespace sp {
class SpApplication: public SpApplicationPrototype
{
    Q_OBJECT

    public:
        SpApplication(int &argc, char **argv
                             , const QString &title
                             , int width = 230, int height = 400);

    private slots:
        void closeSplashScreen();

    private:
        bool firstRendering = true;
};
}
