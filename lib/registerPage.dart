import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/dataRead.dart';
import 'package:testapp/helpbutton.dart';
import 'noNumber.dart';
import 'registerModules.dart';
import 'dataService.dart';

class register extends StatelessWidget {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
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
                                controller: tc_controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  //hintText: "Örneğin: 123********",
                                  border: InputBorder.none,
                                  labelText: "Kimlik Numaranız:",
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
                                    tc = int.parse(value);
                                  }
                                },
                              ),
                            )
                          ],
                        ),
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
                                controller: name_controller,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  //hintText: "Örneğin: Bülent",
                                  border: InputBorder.none,
                                  labelText: "Adınız:",
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
                                    isim = value;
                                  }
                                },
                              ),
                            )
                          ],
                        ),
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
                                controller: surname_controller,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  //hintText: "Örneğin: Ersoy",
                                  border: InputBorder.none,
                                  labelText: "Soyadınız:",
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
                                    soyisim = value;
                                  }
                                },
                              ),
                            )
                          ],
                        ),
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
                                controller: date_controller,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  //hintText: "Örneğin: 30.06.2003",
                                  border: InputBorder.none,
                                  labelText: "Doğum Tarihiniz:",
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
                                    dogum = value;
                                  }
                                },
                              ),
                            )
                          ],
                        ),
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
                                controller: city_controller,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  //hintText: "Örneğin: İstanbul",
                                  border: InputBorder.none,
                                  labelText: "Yaşadığınız İl:",
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
                                    il = value;
                                  }
                                },
                              ),
                            )
                          ],
                        ),
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
                                controller: town_controller,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  //hintText: "Örneğin: Bağcılar",
                                  border: InputBorder.none,
                                  labelText: "Yaşadığınız İlçe:",
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
                                    ilce = value;
                                  }
                                },
                              ),
                            )
                          ],
                        ),
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
                                controller: adress_controller,
                                keyboardType: TextInputType.streetAddress,
                                decoration: InputDecoration(
                                  //hintText: "Örneğin: Mevlana Mahallesi, Ali Sokak, No 7, Daire 2",
                                  border: InputBorder.none,
                                  labelText: "İkametgah Adresiniz:",
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
                                    ikametgah = value;
                                  }
                                },
                              ),
                            )
                          ],
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
                                print(tel);
                                registerUser(context);
                                /*
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => new numberO()));
                                */
                              },
                              child: const Text(
                                'Devam',
                                style: TextStyle(
                                    color: Color.fromRGBO(112, 13, 25, 1),
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
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

  Future registerUser(BuildContext context) async {
    bool send = true;
    final CollectionReference brewCollection =
        FirebaseFirestore.instance.collection('brews');
    FirebaseAuth auth = FirebaseAuth.instance;
    var x = await brewCollection.get();
    userLocs = [];
    //List ax = [];
    x.docs.forEach((element) {
      if (element['tel'] == tel) {
        send = false;
      }
    });
    if (send) {
      FirebaseAuth _auth = FirebaseAuth.instance;
      _auth.verifyPhoneNumber(
          phoneNumber: tel.trim(),
          timeout: Duration(seconds: 60),
          verificationCompleted: (AuthCredential authCredential) async {},
          verificationFailed: (FirebaseAuthException e) {
            if (e.code == 'invalid-phone-number') {
              print('numara geçersiz' + tel.trim());
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(""),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[Text("$tel geçersiz")],
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
          },
          codeSent: (String verificationId, [int forceResendingToken]) {
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
                          //UserCredential result = await _auth.signInWithCredential(credential);
                          try {
                            UserCredential result =
                                await _auth.signInWithCredential(credential);
                            User user = result.user;
                            await DataService(uid: user.uid).updateUserData(tc,
                                isim, soyisim, il, ilce, ikametgah, dogum, tel);
                            await CheckNUmber(context: context).addNumber(tel);
                            if (user != null) {
                              /*
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomeScreen(user: user,)
                        ));
                        */
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setInt('tc', tc);
                              await prefs.setString('tel', tel);
                              await prefs.setString('isim', isim);
                              await prefs.setString('soyisim', soyisim);
                              await prefs.setString('il', il);
                              await prefs.setString('ilce', ilce);
                              await prefs.setString('ikametgah', ikametgah);
                              await prefs.setString('dogum', dogum);
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            } else {
                              print("Error");
                            }
                          } catch (e) {}
                        },
                        child: const Text('Kaydı Tamamla'),
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
          },
          codeAutoRetrievalTimeout: null);
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text(""),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                      "$tel numarası kayıtlı. Lütfen giriş yapın ya da başka numara ile kayıt olun.")
                ],
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
