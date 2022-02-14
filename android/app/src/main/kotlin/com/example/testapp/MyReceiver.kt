package com.example.testapp

import android.app.Service
import android.content.Intent
import android.os.IBinder
import android.provider.Settings
import android.os.CountDownTimer
import android.content.Context
import android.content.SharedPreferences

class MyReceiver : Service() {
    /*
    private lateinit var prefs: SharedPreferences
    fun init(context: Context) {
        prefs = context.getSharedPreferences(Context.MODE_PRIVATE)
    }

    fun read(key: String, value: String): String? {
        return prefs.getString(key, value)
    }
    */
    override fun onBind(intent: Intent): IBinder {
        TODO("Return the communication channel to the service.")
    }
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        /*
        player= MediaPlayer.create(this, Settings.System.DEFAULT_RINGTONE_URI) as MediaPlayer
        player.setLooping(true)
        player.start()
        return  START_STICKY
        */
        println("background service started")
        //val db = Firebase.firestore
        //return Toast.makeText(this, "serv", Toast.LENGTH_SHORT).show()
        var countTime: String = ""
        var counter: Int = 0
        object : CountDownTimer(50000,1000) {
            override fun onTick(millisUntilFinished: Long) {
                countTime = counter.toString()
                println(countTime)
                counter++
            }
            override fun onFinish() {
                countTime = "Finished"
                println(countTime)
                start()
            }
        }.start()
        return 0
        
    }

    override fun onDestroy() {
    }
}
