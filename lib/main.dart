import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'pages.dart';
import 'dataRead.dart';
import 'helpbutton.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Test'),
    );
  }
}

ConvexAppBar _cxBar(BuildContext context) {
  return ConvexAppBar(
    style: TabStyle.custom,
    backgroundColor: Theme.of(context).primaryColor,
    items: [
      TabItem(icon: Icons.add_call, title: 'Help'),
    ],
  );
}

CurvedNavigationBar _cnBar(BuildContext context) {
  return CurvedNavigationBar(
    color: Theme.of(context).primaryColor,
    animationCurve: Curves.elasticOut,
    animationDuration: Duration(milliseconds: 1800),
    backgroundColor: Colors.white,
    items: <Widget>[
      Icon(Icons.list, size: 30, color: Colors.white),
      Icon(Icons.add_call, size: 45, color: Colors.white),
    ],
    onTap: (index) {
      //String x = index.toString();
    },
  );
}

BottomAppBar _bBar(BuildContext context) {
  return BottomAppBar(
    color: Theme.of(context).primaryColor,
    child: Row(
      children: <Widget>[],
    ),
  );
}
