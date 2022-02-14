import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/dataService.dart';
import 'package:testapp/registerPage.dart';
import 'noNumber.dart';
import 'helpbutton.dart';
import 'dataRead.dart';
import 'registerModules.dart';

class login extends StatelessWidget {
  TextEditingController phone_controller;
  String code = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sAppBar,
      body: Center(
          child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(112, 13, 25, 1)),
        child: Column(
          children: <Widget>[
            logoC,
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(height: 5),
                            Container(
                              width: 250,
                              height: 40,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                                color: Color.fromRGBO(230, 230, 230, 1),
                              ),
                              child: TextField(
                                controller: phone_controller,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  //hintText: "Örneğin: +90 534 *** ****",
                                  border: InputBorder.none,
                                  labelText: "Telefon Numaranız:",
                                  labelStyle: TextStyle(fontSize: 15),
                                  hintStyle: TextStyle(),
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 18.0, top: 0),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onChanged: (value) {
                                  //print(value);
                                  if (value == null || value.isEmpty) {
                                    print('Bu alanı doldurmak zorunludur');
                                  } else {
                                    tel = value;
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color.fromRGBO(112, 13, 25, 1))),
                                  onPressed: () {
                                    loginUser(context);
                                  },
                                  child: const Text(
                                    'Giriş Yap',
                                    style: TextStyle(
                                        color: Color.fromRGBO(112, 13, 25, 1),
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                /*
                                Text(
                                  "\n Ya Da \n",
                                  style: TextStyle(
                                      color: Color.fromRGBO(240, 240, 240, 1),
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                                */
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color.fromRGBO(112, 13, 25, 1))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                new register()));
                                  },
                                  child: const Text(
                                    'Kayıt Ol',
                                    style: TextStyle(
                                        color: Color.fromRGBO(112, 13, 25, 1),
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
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

  Future loginUser(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final CollectionReference brewCollection =
        FirebaseFirestore.instance.collection('numbers');
    var x = await brewCollection.doc(tel.trim()).get();
    bool send = false;
    try {
      if (x['valid'] == true) {
        print("exist");
        send = true;
        _auth.verifyPhoneNumber(
            phoneNumber: tel.trim(),
            timeout: Duration(seconds: 60),
            verificationCompleted: (AuthCredential authCredential) {
              //_auth.signInWithCredential(authCredential);
              CheckNUmber(context: context).checkNumber(authCredential, tel);
            },
            verificationFailed: (FirebaseAuthException e) {
              if (e.code == 'invalid-phone-number') {
                print('numara yanlış knkm' + tel.trim());
              }
            },
            codeSent: (String verificationId, [int forceResendingToken]) async {
              print(send);
              if (send) {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Give the code?"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextField(
                              controller: codeController,
                              onChanged: (value) => {code = value, print(code)},
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () async {
                              //final code = codeController.text;
                              AuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: verificationId,
                                      smsCode: code);
                              try {
                                UserCredential result = await _auth
                                    .signInWithCredential(credential);
                                User user = result.user;
                                DataService(uid: user.uid).getUserData();
                                if (user != null) {
                                  /*
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomeScreen(user: user,)
                        ));
                        */

                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                } else {
                                  print("Error");
                                }
                              } catch (e) {}
                            },
                            child: const Text('Giriş Yap'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            },
                            child: const Text('Kodu Yeniden Gönder'),
                          ),
                        ],
                      );
                    });
              } else {
                print(send);
              }
            },
            codeAutoRetrievalTimeout: null);
      } else {
        print("not exist");
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
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                ],
              );
            });
      }
    } catch (e) {
      print(e);
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
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
              ],
            );
          });
    }
  }
}
