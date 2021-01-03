package com.jaimegalan.splash_login

import android.content.Context
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.SplashScreen

class MainActivity: FlutterActivity() {

    override fun provideSplashScreen(): SplashScreen? = MySplashScreen()
}

private class MySplashScreen: SplashScreen{
    override fun createSplashView(context: Context, savedInstanceState: Bundle?): View? =
        LayoutInflater.from(context).inflate(R.layout.splash_screen, null, false)


    override fun transitionToFlutter(onTransitionComplete: Runnable) {
        onTransitionComplete.run()
    }

}
