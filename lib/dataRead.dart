import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:firebase/firebase.dart';

Random random = new Random();
int helpers = random.nextInt(100);
bool okudu = false;
int telNo = null;

int tc = null;
String tel = null;
int onay;
String onayS = "";

String isim = null;
String soyisim = null;
String il = null;
String ilce = null;
String ikametgah = null;

String dogum = null;
