#include "JniSetup.h"
#include "LogSp.h"

#if defined(Q_OS_ANDROID)

#include "KeyboardSp.h"

//--------------------------------------------------------------------------
// Сигнал об изменении видимости клавиатуры
//--------------------------------------------------------------------------
JNIEXPORT void JNICALL keyboardVisibleChanged(JNIEnv *env, jobject self, jboolean jVisible, jint jHeight)
{
    Q_UNUSED(env);
    Q_UNUSED(self);

    bool visible = jVisible == JNI_TRUE;
    int  height  = int(jHeight);
    sp::KeyboardSp::sendVisibleChanged(visible, height);
}

//--------------------------------------------------------------------------
// Печать лога из Java-кода.
//--------------------------------------------------------------------------
JNIEXPORT void JNICALL logInfo(JNIEnv *env, jobject self, jstring text)
{
    Q_UNUSED(env);
    Q_UNUSED(self);

    LOG_INFO(QAndroidJniObject(text).toString());
}

//--------------------------------------------------------------------------
// Печать лога из Java-кода.
//--------------------------------------------------------------------------
JNIEXPORT void JNICALL logError(JNIEnv *env, jobject self, jstring text)
{
    Q_UNUSED(env);
    Q_UNUSED(self);

    LOG_ERROR(QAndroidJniObject(text).toString());
}

//--------------------------------------------------------------------------
// Инициализация.
//--------------------------------------------------------------------------
JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *reserved)
{
    Q_UNUSED(vm);
    Q_UNUSED(reserved);

    JNINativeMethod methodsLibs[] { {"_logInfo", "(Ljava/lang/String;)V", (void *)&logInfo}
                               ,{"_logError", "(Ljava/lang/String;)V", (void *)&logError}
                               ,{"keyboardVisibleChanged", "(ZI)V", (void *)&keyboardVisibleChanged}
                              };

    QAndroidJniEnvironment env;
    jclass objectClassLibs = env->FindClass(QString("sp/SpActivity").toStdString().c_str());
    jint   resLibs         = env->RegisterNatives(objectClassLibs, methodsLibs, ( sizeof(methodsLibs) / sizeof(methodsLibs[0])) );

    // Возвращает 0, если успешно зарегестрирован
    if (resLibs != 0) {
        env->ExceptionDescribe();
        return -1;
    }

    JNINativeMethod methods[] { {"logInfo", "(Ljava/lang/String;)V", (void *)&logInfo}
                               ,{"logError", "(Ljava/lang/String;)V", (void *)&logError}
                              };

    jclass objectClass = env->FindClass(Consts::activityPackageBase.toStdString().c_str());
    jint   res         = env->RegisterNatives(objectClass, methods, ( sizeof(methods) / sizeof(methods[0])) );

    // Возвращает 0, если успешно зарегестрирован
    if (res != 0) {
        env->ExceptionDescribe();
        return -1;
    }

    return JNI_VERSION_1_6;
}

#endif


