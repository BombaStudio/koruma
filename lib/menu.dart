import 'package:flutter/material.dart';
import 'package:testapp/loginPage.dart';
import 'helpbutton.dart';
import 'helpbutton.dart';

class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(112, 13, 25, 1),
        elevation: 0,
        /*
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            icon: Icon(
              Icons.arrow_left,
              color: Colors.white,
              //color: Color.fromRGBO(234, 92, 84, 1),
              size: 40,
            )),
            */
        actions: <Widget>[],
      ),
      body: Center(
          child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(112, 13, 25, 1)),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        //AssetImage('assets/images/Rectangle2.png')
                        /*
                        Container(
                            margin: EdgeInsets.only(bottom: 25),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(112, 13, 25, 1),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => null));
                                },
                                child: Center(
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: Icon(
                                          ic,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      Container(
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Color.fromRGBO(0, 0, 0, 0.3),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Yardım İsteyenler",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                            ),
                                          ))
                                    ],
                                  ),
                                ))),*/
                        menuC(context, Icons.sim_card_alert_outlined,
                            "Yardım İsteyenler", null),
                        menuC(context, Icons.notification_add,
                            "Bildirimleri Açın", null),
                        menuC(context, Icons.people,
                            "Arkadaşlarınızı Davet Edin", null),
                        menuC(context, Icons.account_box, "Hesap Değiştirin",
                            login()),
                        menuC(context, Icons.help, "Bize Ulaşın", null),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
