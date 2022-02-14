import 'package:firebase_auth/firebase_auth.dart';

import 'helpbutton.dart';
import 'package:flutter/material.dart';
import 'dataRead.dart';
import 'package:auto_size_text/auto_size_text.dart';

class numberO extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  void ona() {
    if (onay == null) {
      onayS = "";
    } else {
      onayS = onay.toString();
    }
  }

  TextEditingController _coo =
      TextEditingController(text: onay == null ? "" : onay.toString());
  void pa(BuildContext context, int a) async {
    a != null ? onay = a : onay = null;
    print(onay);
    //_register(context);
    await auth.verifyPhoneNumber(
      phoneNumber: '+90 534 066 0885', //tel.toString(),
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('senin koyacağın telefon numarasına sokim' + telNo.toString());
        }
      },
      codeSent: (String verificationId, int resendToken) async {
        String smsCode = 'xxxx';
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
        //Navigator.of(context).popUntil((route) => route.isFirst);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    /*
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new numberO()));
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sAppBar,
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
                    margin: const EdgeInsets.only(left: 25.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.only(left: 15, top: 20),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.message_outlined,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    'SMS DOĞRULAMA',
                                    textAlign: TextAlign.right,
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
                              ],
                            )),
                        regColumn("Gelen SMS Kodunu Giriniz...", "", onay,
                            TextInputType.number, 0, _coo),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, top: 0, bottom: 0),
                          child: Text(
                            "",
                            /*'Doğrulama için kalan süre: 02:47',*/
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
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(112, 13, 25, 1)),
                          ),
                          onPressed: () {
                            _coo.value.text.isNotEmpty
                                ? pa(context, int.parse(_coo.value.text))
                                : onay = 0;
                          },
                          child: const Text(
                            'Kodu tekrar gönder',
                            style: TextStyle(
                              color: Color.fromRGBO(112, 13, 25, 1),
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15, top: 15),
                          child: Row(
                            children: <Widget>[
                              /*
                              Text(
                                "Uygulama Kullanım Şartlarını Kabul Ediyorum.",
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
                              */
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
                              onPressed: () async {
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
                        /*
                        Text(
                          "Kayıt olduktan sonra uygulama şartlarını kabul etmiş olursunuz",
                          style: TextStyle(color: Colors.white),
                        ),
                        */
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

  void _register(context) async {
    //_auth.createUserWithEmailAndPassword(email: "", password: "");
    /*
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: "",
      smsCode: "",
    );
    */
    //_auth.signInWithCredential();
  }
}
