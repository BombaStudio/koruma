import 'helpbutton.dart';
import 'package:flutter/material.dart';
import 'dataRead.dart';
import 'package:auto_size_text/auto_size_text.dart';

class numberO extends StatelessWidget {
  void ona() {
    if (onay == null) {
      onayS = "";
    } else {
      onayS = onay.toString();
    }
  }

  TextEditingController _coo =
      TextEditingController(text: onay == null ? "" : onay.toString());
  void pa(BuildContext context, int a) {
    a != null ? onay = a : onay = null;
    print(onay);
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new numberO()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(112, 13, 25, 1),
        //title: Text("First Page"),
      ),
      body: Center(
          child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(112, 13, 25, 1)),
        child: Column(
          children: <Widget>[
            //logoC,
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Text(
                            'SMS DOĞRULAMA',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(238, 238, 238, 1),
                                fontFamily: 'Red Hat Text',
                                fontSize: 24,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                        regColumn("Gelen SMS Kodunu Giriniz...", "", onay,
                            TextInputType.number, 0, _coo),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: Text(
                            'Doğrulama için kalan süre: 02:47',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(229, 229, 229, 1),
                                fontFamily: 'Red Hat Text',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Uyhulama Kullanım Şartlarını Kabul Ediyorum.",
                                style: TextStyle(color: Colors.white),
                              ),
                              Checkbox(
                                checkColor: Colors.white,
                                //fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: okudu,
                                onChanged: (bool value) {
                                  okudu = value;
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => new numberO()));
                                },
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 250,
                          color: Colors.white,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromRGBO(112, 13, 25, 1))),
                              onPressed: () {
                                _coo.value.text.isNotEmpty
                                    ? pa(context, int.parse(_coo.value.text))
                                    : onay = 0;
                              },
                              child: const Text(
                                'Kaydı Tamamla',
                                style: TextStyle(
                                    color: Color.fromRGBO(112, 13, 25, 1),
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  /*
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Submit'),
                    ),
                  ),
                  */
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
