import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:testapp/dataRead.dart';
import 'package:http/http.dart' as http;

void sendHelpSMS(BuildContext context, List<String> recipents, Position loc,
    String i) async {
  String _result = await sendSMS(
          message:
              "Merhaba ben $isim ve şuan acilen yardıma ihtiyacım var ${loc.latitude},${loc.longitude} konumundayım lütfen yardım edin!!!",
          recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(''),
      content: Text('Yardım isteğiniz $helpers kişiye iletildi'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            _sendCancelSMS(context, recipents);
          },
          child: const Text('İptal'),
        ),
      ],
    ),
  );
}

void _sendCancelSMS(BuildContext context, List<String> recipents) async {
  String _result = await sendSMS(
          message:
              "Merhaba ben $isim ve şuan yardıma ihtiyacım kalmadı. Yardım ettiğiniz için teşekkür ederim :D",
          recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  Navigator.of(context).popUntil((route) => route.isFirst);
  print(_result);
}

void sendSMSFromClickatell(BuildContext context, String key,
    List<String> number, Position loc, String i) async {
  number.forEach((element) async {
    String msg =
        "Merhaba ben $i ve şuan acilen yardıma ihtiyacım var ${loc.latitude},${loc.longitude} konumundayım lütfen yardım edin!!!";
    final url = Uri.parse(
        "https://platform.clickatell.com/messages/http/send?apiKey=${key}&to=${element}&content=${msg}");
    /*
    final url = Uri.https(
      'textbelt.com',
      '/text',
      {
        'phone': '${element}',
        'message': msg,
        'key': 'textbelt',
      },
    );
    */
    final response = await http.post(url);
    if (response.statusCode == 200) {
      print("message sended :D");
      print(response.body);
    }
  });
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(''),
      content: Text('Yardım isteğiniz $helpers kişiye iletildi'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            number.forEach((element) async {
              print(element);
              String msg =
                  "Merhaba ben $i ve şuan yardıma ihtiyacım kalmadı. Yardım ettiğiniz için teşekkür ederim :D";
              final url = Uri.parse(
                  "https://platform.clickatell.com/messages/http/send?apiKey=${key}&to=${element}&content=${msg}");
              /*
              final url = Uri.https(
                'textbelt.com',
                '/text',
                {
                  'phone': '$element',
                  'message': msg,
                  'key': 'textbelt',
                },
              );
              */
              final response = await http.get(url);
              if (response.statusCode == 200) {
                print("message sended :D");
              }
              Navigator.of(context).popUntil((route) => route.isFirst);
            });
          },
          child: const Text('İptal'),
        ),
      ],
    ),
  );
}
