import 'package:covid_19/model/md_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryItemView extends StatelessWidget {
  MDCountry? country;

  CountryItemView({Key? key, this.country}) : super(key: key);

  Color color = const Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.2), width: 0.5)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              country?.country ?? '',
              style: const TextStyle(
                  color: Colors.black, fontSize: 16, fontFamily: 'regular'),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            '${country?.totalConfirmed ?? 0}',
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontFamily: 'regular'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
