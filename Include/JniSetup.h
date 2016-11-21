#pragma once

#include <QApplication>
#include "Consts.h"

#if defined(Q_OS_ANDROID)

#include <QtAndroid>
#include <QAndroidJniEnvironment>

JNIEXPORT void JNICALL keyboardVisibleChanged(JNIEnv *env, jobject self, jboolean jVisible, jint jHeight);

JNIEXPORT void JNICALL logInfo(JNIEnv *env, jobject self, jstring text);

JNIEXPORT void JNICALL logError(JNIEnv *env, jobject self, jstring text);

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *reserved);

#endif
