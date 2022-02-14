import 'package:flutter/material.dart';

import 'dataRead.dart';
import 'helpbutton.dart';

TextEditingController tc_controller;
TextEditingController name_controller;
TextEditingController surname_controller;
TextEditingController date_controller;
TextEditingController phone_controller;
TextEditingController city_controller;
TextEditingController town_controller;
TextEditingController adress_controller;
TextEditingController codeController;

Row regRow() => Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 5),
            /*
        Align(
            alignment: Alignment.centerLeft,
            child: new Text(
              shint,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            )),
            */
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
                  hintText: "Kimlik Numaranız:",
                  border: InputBorder.none,
                  labelText: "Örneğin: 123********",
                  labelStyle: TextStyle(fontSize: 15),
                  hintStyle: TextStyle(),
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 18.0, top: 0),
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
                  //return null;
                  /*
              if (k == 0) {
                val = value;
              } else {
                val = value.toString();
              }
              print(val);
              */
                },
              ),
            )
          ],
        ),
      ],
    );
/*
regColumn("Kimlik Numaranız:", "Örneğin: 123********",
                            tc, TextInputType.number, 0, tc_controller),
                        regColumn("Adınız:", "Örneğin: Bülent", isim,
                            TextInputType.text, 1, name_controller),
                        regColumn("Soyadınız:", "Örneğin: Ersoy", soyisim,
                            TextInputType.text, 1, surname_controller),
                        regColumn("Doğum Yılınız:", "Örneğin: 30.06.2003",
                            dogum, TextInputType.datetime, 1, date_controller),
                        regColumn("Cep Telefonunuz:", "Örneğin: 0543657****",
                            tel, TextInputType.phone, 1, phone_controller),
                        regColumn("Yaşadığınız İl:", "Örneğin: İstanbul", il,
                            TextInputType.text, 1, city_controller),
                        regColumn("Yaşadığınız İlçe:", "Örneğin: Bağcılar",
                            ilce, TextInputType.text, 1, town_controller),
                        regColumn(
                            "İkametgah(kapı,bina,daire no vs):",
                            "Örneğin: A Sitesi, B Blok, Daire C...",
                            ikametgah,
                            TextInputType.streetAddress,
                            1,
                            adress_controller),
*/