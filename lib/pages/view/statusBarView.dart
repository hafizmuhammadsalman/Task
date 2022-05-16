import 'package:covid_19/extension/colorExtension/colorExtension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusBarView extends StatelessWidget {
  StatusBarView({Key? key}) : super(key: key);

  Color color = const Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.top,
      width: MediaQuery.of(context).size.width,
      color: color.colorSafeArea,
    );
  }
}
