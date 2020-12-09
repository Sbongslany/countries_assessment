import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import 'error.dart';

class Service {
  BuildContext context;

  Service({@required this.context});
  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<http.Response> getAll() async {
    showAlertDialog(context);
    String url = 'https://restcountries.eu/rest/v2/region/africa';
    return http
        .get(url, headers: {"Content-Type": "application/json"})
        .timeout(const Duration(seconds: 30))
        .then((http.Response response) {
          Navigator.pop(context);
          if (response.statusCode != 200) {
            try {
              ServerError error = ServerError.fromMap(response.body);
              Fluttertoast.showToast(
                  msg: '${error.message}',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 12.0);
            } catch (e) {
              Fluttertoast.showToast(
                  msg:
                      'Connection issue, please check your internet connection.',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 12.0);
            }
          }
          return response;
        },
            onError: (e) => {
                  Navigator.pop(context),
                  Fluttertoast.showToast(
                      msg: '${e.message}',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 12.0)
                });
  }
}
