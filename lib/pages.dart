import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/callPage.dart';
import 'package:testapp/dataService.dart';
import 'package:testapp/noNumber.dart';
import 'package:testapp/registerPage.dart';
import 'package:testapp/menu.dart';
import 'package:testapp/smsService.dart';
import 'package:testapp/theBildirim.dart';
import 'helpbutton.dart';
import 'dataRead.dart';
import 'loginPage.dart';
import 'mapDemo.dart';
import 'getLocation.dart';
import 'package:flutter/services.dart';

int i = 0;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const channel = MethodChannel('koruma/channel');

  List<double> myLoc = <double>[];

  Position cp;
  LatLng ce;

  int _counter = 0;
  String m = "dsfsaf";
  //int _p = 0;
  void test(String k) {
    setState(() {
      m = k;
    });
  }

  void loc() async {
    cp = await determinePosition();

    setState(() {
      ce = LatLng(cp.latitude, cp.longitude);
    });

    print('latitude ${ce.latitude}  longitude ${ce.longitude}');
    //myLoc = <double>[, ];
    checkLocations(uid: tel).addLoc(tel, ce.latitude, ce.longitude);
    checkLocations(uid: tel).getLoc(ce.latitude, ce.longitude);
    //print("object {${userLocs}}");
  }

  void checkUserData() {
    setState(() async {
      try {
        // Obtain shared preferences.
        final prefs = await SharedPreferences.getInstance();
        //int telNo = null;

        int tc = prefs.getInt('tc');
        String tel = prefs.getString('tel');
        //int onay;
        //String onayS = "";

        String isim = prefs.getString('isim');
        String soyisim = prefs.getString('soyisim');
        String il = prefs.getString('il');
        String ilce = prefs.getString('ilce');
        String ikametgah = prefs.getString('ikametgah');

        String dogum = prefs.getString('dogum');
        print('data loaded $tel');
      } catch (e) {
        //int telNo = null;

        int tc = null;
        String tel = null;
        //int onay;
        //String onayS = "";

        String isim = null;
        String soyisim = null;
        String il = null;
        String ilce = null;
        String ikametgah = null;

        String dogum = null;
        print('data not loaded');
      }
      if (tel != null) {
        loc();
      } else {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => new login()));
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      helpers = random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    //checkUserData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(112, 13, 25, 1),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new menu()));
            },
            icon: Icon(
              Icons.menu,
              color: Color.fromRGBO(240, 240, 240, 1),
              size: 35,
            )),
        actions: <Widget>[],
      ),
      body: new Container(
        decoration: BoxDecoration(
            /*
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 153, 144, 1),
                Color.fromRGBO(102, 18, 5, 1)
              ]),
              */
            color: Color.fromRGBO(112, 13, 25, 1)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () async {
                            try {
                              // Obtain shared preferences.
                              final prefs =
                                  await SharedPreferences.getInstance();
                              //int telNo = null;

                              tc = prefs.getInt('tc');
                              tel = prefs.getString('tel');
                              //int onay;
                              //String onayS = "";

                              isim = prefs.getString('isim');
                              soyisim = prefs.getString('soyisim');
                              il = prefs.getString('il');
                              ilce = prefs.getString('ilce');
                              ikametgah = prefs.getString('ikametgah');

                              dogum = prefs.getString('dogum');
                              print('data loaded $tel');
                            } catch (e) {
                              //int telNo = null;

                              int tc = null;
                              String tel = null;
                              //int onay;
                              //String onayS = "";

                              String isim = null;
                              String soyisim = null;
                              String il = null;
                              String ilce = null;
                              String ikametgah = null;

                              String dogum = null;
                              print('data not loaded');
                            }
                            if (tel != null) {
                              loc();
                              //print(userLocs);
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(''),
                                  content: const Text(
                                      'Yardım istediğinize emin misiniz?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Hayır'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        print("object = ${userTel[0]}");
                                        print("name ${isim}");
                                        print("name2 ${myName}");
                                        sendSMSFromClickatell(
                                            context,
                                            "u-UC67zfSOSbK6v8_ommkA==",
                                            userTel,
                                            cp,
                                            isim);
                                      },
                                      child: const Text('Evet'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              var push = Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new login()));
                            }
                          },
                          /*
                          onPressed: () {
                            helpers = random.nextInt(100);
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new page_call()));
                          },
                          */
                          textColor: Colors.white,
                          child: cc,
                          padding: EdgeInsets.all(0),
                          shape: CircleBorder(),
                        ),
                      ],
                    ),
                    Text("$helpers",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Color.fromRGBO(240, 240, 240, 1),
                          /*
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(10.0, 10.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            Shadow(
                              offset: Offset(10.0, 10.0),
                              blurRadius: 8.0,
                              color: Colors.black,
                            ),
                          ],
                          */
                        )),
                    Container(
                      margin: EdgeInsets.only(bottom: 130),
                      child: Text("kişi size yardım edebilir",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color.fromRGBO(240, 240, 240, 1),
                            /*
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(10.0, 10.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              Shadow(
                                offset: Offset(10.0, 10.0),
                                blurRadius: 8.0,
                                color: Colors.black,
                              ),
                            ],
                            */
                          )),
                    ),
                    TextButton(
                        onPressed: () {
                          startService(channel, isim);
                        },
                        child: Text('Get Location'))
                  ],
                ),
              ),
            ], //<Widget>[Text(m)],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 50,
          //color: Colors.white,
          color: Color.fromRGBO(0, 0, 0, 0.85),
          alignment: Alignment(0, 10),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: new AssetImage("assets/images/kiks.png"),
                backgroundColor: Color.fromRGBO(0, 0, 0, 0),
              )
            ],
          )),
    );
  }
}
