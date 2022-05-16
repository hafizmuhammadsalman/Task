import 'dart:ui';

import 'package:covid_19/model/md_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorldItemView extends StatelessWidget {
  MDCountry? world;

  WorldItemView({Key? key, this.world}) : super(key: key);

  Color color = const Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'World',
              style: TextStyle(
                  color: Colors.black, fontSize: 24, fontFamily: 'bold'),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            '${world?.totalConfirmed ?? 0}',
            style: const TextStyle(
                color: Colors.black, fontSize: 24, fontFamily: 'bold'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
