import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dataRead.dart';

AppBar sAppBar = AppBar(
  backgroundColor: Color.fromRGBO(112, 13, 25, 1),
  //title: Text("First Page"),
);

Container cc = Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
        //border: Border.all(),
        ),
    child: new CircleAvatar(
      backgroundImage: new AssetImage("assets/images/button.png"),
      radius: 80.0,
      child: new Container(
        padding: const EdgeInsets.all(0.0),
        child: new Text(
          'YARDIM İSTE !',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    )

    /*
  SvgPicture.asset(
    'assets/images/dme.svg',
    semanticsLabel: 'dme',
    placeholderBuilder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(30.0),
        child: const CircularProgressIndicator()),
  ),
  */
    );

Container logoC = Container(
    width: 75,
    height: 75,
    decoration: BoxDecoration(
        //border: Border.all(),
        ),
    child: new CircleAvatar(
      backgroundImage: new AssetImage("assets/images/button.png"),
      radius: 80.0,
      /*
      child: new Container(
        padding: const EdgeInsets.all(0.0),
        child: new Text(
          'YARDIM İSTE !',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      */
    )

    /*
  SvgPicture.asset(
    'assets/images/dme.svg',
    semanticsLabel: 'dme',
    placeholderBuilder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(30.0),
        child: const CircularProgressIndicator()),
  ),
  */
    );
Column regColumn(String shint, String hint, var val, TextInputType type, int k,
        TextEditingController control) =>
    new Column(
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
            controller: control,
            keyboardType: type,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              labelText: shint,
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
              if (value == null || value.isEmpty) {
                return 'Bu alanı doldurmak zorunludur';
              }
              return null;
              if (k == 0) {
                val = value;
              } else {
                val = value.toString();
              }
            },
          ),
        )
      ],
    );
