import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future callbackDispatcher() {
  WidgetsFlutterBinding.ensureInitialized();
  print("Our background job ran!");
}

startService(MethodChannel channel, String name) async {
  try {
    await channel.invokeMethod('startService', {'isim': name});
  } on PlatformException catch (ex) {
    print(ex.message);
  } catch (e) {
    print("service not started");
  }
}

stopService(MethodChannel channel) async {
  try {
    await channel.invokeMethod('stoptService');
  } on PlatformException catch (ex) {
    print(ex.message);
  }
}
