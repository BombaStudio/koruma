import 'package:flutter/material.dart';
import 'package:testapp/dataRead.dart';
import 'package:testapp/helpbutton.dart';

class register extends StatelessWidget {
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
                        regColumn("Kimlik Numaranız:", "Örneğin: 123********",
                            tc, TextInputType.number, 0, null),
                        regColumn("Adınız:", "Örneğin: Bülent", isim,
                            TextInputType.text, 1, null),
                        regColumn("Soyadınız:", "Örneğin: Ersoy", soyisim,
                            TextInputType.text, 1, null),
                        regColumn("Doğum Yılınız:", "Örneğin: 30.06.2003",
                            dogum, TextInputType.datetime, 1, null),
                        regColumn("Cep Telefonunuz:", "Örneğin: 0543657****",
                            tel, TextInputType.phone, 1, null),
                        regColumn("Yaşadığınız İl:", "Örneğin: İstanbul", il,
                            TextInputType.text, 1, null),
                        regColumn("Yaşadığınız İlçe:", "Örneğin: Bağcılar",
                            ilce, TextInputType.text, 1, null),
                        regColumn(
                            "İkametgah(kapı,bina,daire no vs):",
                            "Örneğin: A Sitesi, B Blok, Daire C...",
                            ikametgah,
                            TextInputType.streetAddress,
                            1,
                            null),
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
                              onPressed: () {},
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
}
