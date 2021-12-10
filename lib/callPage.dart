import 'package:flutter/material.dart';
import 'package:testapp/registerPage.dart';
import 'loginPage.dart';
import 'helpbutton.dart';
import 'dataRead.dart';

class page_call extends StatelessWidget {
  int _counter = 0;
  String m = "dsfsaf";
  //int _p = 0;
  /*
  void test(String k) {
    setState(() {
      m = k;
    });
  }

  void _incrementCounter() {
    setState(() {});
  }
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(112, 13, 25, 1),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new register()));
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
                          onPressed: () {
                            helpers = random.nextInt(100);
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new page_call()));
                          },
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
                          color: Color.fromRGBO(234, 92, 84, 1),
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
                        )),
                    Text("kişi size yardım edebilir",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color.fromRGBO(234, 92, 84, 1),
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
                        )),
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
