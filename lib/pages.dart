import 'package:flutter/material.dart';
import 'package:testapp/callPage.dart';
import 'package:testapp/noNumber.dart';
import 'package:testapp/registerPage.dart';
import 'helpbutton.dart';
import 'dataRead.dart';
import 'loginPage.dart';

int i = 0;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String m = "dsfsaf";
  //int _p = 0;
  void test(String k) {
    setState(() {
      m = k;
    });
  }

  void _incrementCounter() {
    setState(() {
      helpers = random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    //_page_c(_counter);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 153, 144, 1),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new page_call()));
            },
            icon: Icon(
              Icons.menu,
              color: Color.fromRGBO(234, 92, 84, 1),
              size: 35,
            )),
        actions: <Widget>[],
      ),
      body: new Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 153, 144, 1),
                Color.fromRGBO(102, 18, 5, 1)
              ]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              ButtonBar(
                children: <ElevatedButton>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new register()));
                    },
                    child: Text("Register"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new login()));
                    },
                    child: Text("Login"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new numberO()));
                    },
                    child: Text("Phone"),
                  )
                ],
              )
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
              Icon(
                Icons.accessibility_new_sharp,
                color: Colors.white,
              ),
              Text(
                "data",
                style: TextStyle(color: Colors.white),
              )
            ],
          )),
    );
  }
}
