import 'dart:core';

import 'package:covid_19/extension/colorExtension/colorExtension.dart';
import 'package:covid_19/pages/tabBar/tabBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  late Helper helper;
  bool init = false;

  @override
  Widget build(BuildContext context) {
    if (!init) {
      init = true;
      helper = Helper(context);
    }

    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          helper.buildSplash(),
        ],
      ),
    );
  }
}

class Helper {
  BuildContext context;
  Color color = const Color(0xFF009688);

  Helper(this.context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => TabBarCountry()),
          (Route<dynamic> route) => false);
    });
  }

  Widget buildSplash() {
    return Container(
        color: color.colorBackground,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Text(
          'Covid-19',
          style: TextStyle(color: color.colorText, fontSize: 40),
        )));
  }
}
