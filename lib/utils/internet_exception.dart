
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class InternetException {
  bool connection = true;
  Future<bool> hasNet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection = true;
        return true;
      }
    } on SocketException catch (_) {
      connection = false;
      return false;
    }
    connection = false;
    return false;
  }

  Widget NoInternetWidget() {
    return Container(
      decoration: const BoxDecoration(
        gradient:
        LinearGradient(
            begin: Alignment.topLeft,
            end:
            Alignment.bottomRight,
            colors: [ Colors.red,Colors.black,Colors.black]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                Icons.wifi_off,
                size: 100,
                color: Colors.white,
              ),
            ),
            Container(
              child: Center(
                child: Text("No Internet Connection",
                    style: TextStyle(color: Colors.white , fontSize: 30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}