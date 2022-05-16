import 'package:covid_19/extension/colorExtension/colorExtension.dart';
import 'package:covid_19/model/md_country.dart';
import 'package:covid_19/pages/view/safeAreaView.dart';
import 'package:covid_19/pages/view/statusBarView.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  MDCountry? countryObj;

  DetailView({Key? key, this.countryObj}) : super(key: key);
  bool init = false;
  late BuildContext context;
  Color color = const Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    if (!init) {
      init = true;
      this.context = context;
    }
    return Scaffold(
        body: Stack(children: <Widget>[
      Column(children: <Widget>[
        StatusBarView(),
        buildHeaderView(),
        Expanded(
            child: ListView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.all(0),
                children: <Widget>[
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: buildDetail(
                          'TOTAL CASES', countryObj?.totalConfirmed ?? 0)),
                  Expanded(
                      child: buildDetail(
                          'TOTAL DEATHS', countryObj?.totalDeaths ?? 0)),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: buildDetail(
                          'NEW CASES', countryObj?.newConfirmed ?? 0)),
                  Expanded(
                      child:
                          buildDetail('NEW DEATHS', countryObj?.newDeaths ?? 0)),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: buildDetail(
                          'NEW RECOVERED', countryObj?.newRecovered ?? 0)),
                  Expanded(
                      child: buildDetail(
                          'TOTAL RECOVERED', countryObj?.totalRecovered ?? 0)),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ])),
        SafeAreaView(),
      ]),
    ]));
  }

  Widget buildHeaderView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: color.colorAccent,
      child: AspectRatio(
        aspectRatio: 375 / 249,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: GestureDetector(
                  onTap: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Image.asset(
                      'assets/images/back_arrow.png',
                      height: 50,
                      width: 30,
                    ),
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  countryObj?.country ?? '',
                  style: const TextStyle(
                      color: Colors.white, fontSize: 24, fontFamily: 'regular'),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'CORONA STATS OVERVIEW',
                  style: TextStyle(
                      color: Colors.white, fontSize: 10, fontFamily: 'medium'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetail(String title, int number) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 10, fontFamily: 'medium'),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          number.toString(),
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontFamily: 'regular'),
        )
      ],
    );
  }
}
