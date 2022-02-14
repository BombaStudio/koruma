import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/dataRead.dart';

List userLocs = [];
List<String> userTel = [];
String myName = "";

class DataService {
  final String uid;
  DataService({this.uid});
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');
  Future updateUserData(int tc, String isim, String soyisim, String il,
      String ilce, String ikametgah, String dogum, String tel) async {
    return await brewCollection.doc(uid).set({
      'tc': tc,
      'isim': isim,
      'soyisim': soyisim,
      'dogum': dogum,
      'il': il,
      'ilce': ilce,
      'ikametgah': ikametgah,
      'tel': tel
    });
  }

  Future getUserData() async {
    //FirebaseAuth auth = FirebaseAuth.instance;
    var x = await brewCollection.get();
    //List ax = [];
    print(uid);
    x.docs.forEach((element) async {
      if (element['tel'] == tel) {
        print("yes mtf!!!!!!");
        isim = element['isim'];
        myName = element['isim'];
        print("Name = ${element['isim']}");
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('tc', element['tc']);
        await prefs.setString('tel', element['tel']);
        await prefs.setString('isim', element['isim']);
        await prefs.setString('soyisim', element['soyisim']);
        await prefs.setString('il', element['il']);
        await prefs.setString('ilce', element['ilce']);
        await prefs.setString('ikametgah', element['ikametgah']);
        await prefs.setString('dogum', element['dogum']);
        print('data saved');
      } else {
        print("ow shit!! Where we go again");
        print(element.id);
        print(uid);
      }
    });
  }
}

class CheckNUmber {
  final BuildContext context;
  CheckNUmber({this.context});
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('numbers');

  Future addNumber(String tel) async {
    /*
    try {
      var a = await brewCollection.get();
      return a.docs;
    } catch (e) {
      return await brewCollection.doc(tel).set({'valid': true});
    }
    */
    //brewCollection.get().forEach((value) {});
    var x = await brewCollection.get();
    bool a = false;
    x.docs.forEach((element) {
      print(element.id);
      if (element.id == tel) {
        a = true;
      }
    });
    if (a == false) {
      return await brewCollection.doc(tel).set({'valid': true});
    }
    //print("myData = ${brewCollection.get()}");
    print("mdata = ${brewCollection.snapshots().length}");
  }

  Future checkNumber(AuthCredential authCredential, String tel) async {
    /*
    try {
      brewCollection.doc(tel).get();
    } catch (e) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text("Give the code?"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text("$tel is not exist")],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Kaydı Tamamla'),
                ),
              ],
            );
          });
    }
    */
    /*
    var x = await brewCollection.get();
    bool a = false;
    x.docs.forEach((element) {
      print(element.id);
      if (element.id == tel) {
        a = true;
      }
    });
    return a;
    print(a);
    */
    FirebaseAuth auth = FirebaseAuth.instance;
    var x = await brewCollection.doc(tel).get();

    if (x['valid' == true]) {
      auth.signInWithCredential(authCredential);
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text(""),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text("$tel is not exist")],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Tamam'),
                ),
              ],
            );
          });
    }
  }
}

class checkLocations {
  final String uid;
  checkLocations({this.uid});
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('locationData');
  Future addLoc(String tel, double c_x, double c_y) async {
    /*
    try {
      var a = await brewCollection.get();
      return a.docs;
    } catch (e) {
      return await brewCollection.doc(tel).set({'valid': true});
    }
    */
    //brewCollection.get().forEach((value) {});
    var x = await brewCollection.get();
    bool a = false;
    x.docs.forEach((element) {
      //print(element.id);
    });
    return await brewCollection
        .doc(uid)
        .set({'tel': tel, 'kor_x': c_x, 'kor_y': c_y});
    print(a);
  }

  Future getLoc(double kor_x, double kor_y) async {
    /*
    try {
      brewCollection.doc(tel).get();
    } catch (e) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text("Give the code?"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text("$tel is not exist")],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Kaydı Tamamla'),
                ),
              ],
            );
          });
    }
    */
    /*
    var x = await brewCollection.get();
    bool a = false;
    x.docs.forEach((element) {
      print(element.id);
      if (element.id == tel) {
        a = true;
      }
    });
    return a;
    print(a);
    */
    FirebaseAuth auth = FirebaseAuth.instance;
    var x = await brewCollection.get();
    userLocs = [];
    //List ax = [];
    x.docs.forEach((element) {
      if (element.id != tel) {
        double distanceInMeters = Geolocator.distanceBetween(
            kor_x, kor_y, element['kor_x'], element['kor_y']);

        //print("x = ${element['kor_x']} y = ${element['kor_y']} tel = ${element['tel']} distance = ${distanceInMeters}");
        if (distanceInMeters < 1000) {
          userLocs.add({
            'tel': element['tel'],
            'x': element['kor_x'],
            'y': element['kor_y']
          });
          userTel.add(element['tel']);
          //print("${element['tel']} is called");
        } else {
          print("${element['tel']} is distance ${distanceInMeters}");
        }
      }
    });
    //userLocs = ax;
    print("object {${userLocs}} tels {${userTel}}");
    /*
    if (x['valid' == true]) {
      auth.signInWithCredential(authCredential);
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text(""),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text("$tel is not exist")],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Tamam'),
                ),
              ],
            );
          });
    }
    */
  }
}
