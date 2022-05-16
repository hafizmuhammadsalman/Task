import 'package:covid_19/extension/colorExtension/colorExtension.dart';
import 'package:covid_19/pages/country_notifier/contery_notifier.dart';
import 'package:covid_19/pages/tabBar/tabBarItems/home.dart';
import 'package:covid_19/pages/tabBar/tabBarItems/search.dart';
import 'package:covid_19/pages/tabBar_notifier/tabBar_notifier.dart';
import 'package:covid_19/pages/view/safeAreaView.dart';
import 'package:covid_19/pages/view/statusBarView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBarCountry extends StatelessWidget {
  bool isInit = false;
  late BuildContext context;
  double tabBodyHeight = 0.0;
  Color color = const Color(0xFF009688);
  late Home home;
  late Search search;
  late CountryChangeProvider countryChangeProvider;

  TabBarCountry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      isInit = true;
      this.context = context;
      home = Home();
      search = Search();
      countryChangeProvider =
          Provider.of<CountryChangeProvider>(context, listen: true);
      countryChangeProvider.apiGetCovidData();
    }
    return Scaffold(body:
        Consumer<TabBarChangeProvider>(builder: (context, provider, child) {
      return Stack(
        children: [
          Column(
            children: <Widget>[
              StatusBarView(),
              Expanded(child: buildTabBody(provider)),
              buildBottomBar(provider),
              SafeAreaView(),
            ],
          ),
          Visibility(
            visible: countryChangeProvider.isAPILoading,
            child: const Center(child: CupertinoActivityIndicator()),
          )
        ],
      );
    }));
  }

  Widget buildTabBody(TabBarChangeProvider provider) {
    tabBodyHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom +
            MediaQuery.of(context).viewInsets.bottom +
            50);
    return Column(
      children: <Widget>[
        Container(
          height: provider.getHomeSelected ? tabBodyHeight : 0.0,
          child: home,
        ),
        Container(
          height: provider.getSearchSelected ? tabBodyHeight : 0.0,
          child: search,
        ),
      ],
    );
  }

  Widget buildBottomBar(TabBarChangeProvider provider) {
    return Container(
        height: 50,
        color: color.colorAccent,
        child: Row(
          children: <Widget>[
            Expanded(child: buildHomeTab(provider)),
            Expanded(child: buildSearchTab(provider)),
          ],
        ));
  }

  Widget buildHomeTab(TabBarChangeProvider provider) {
    return InkWell(
      onTap: () {
        provider.setTabBarListener(0);
      },
      child: Image.asset(
        'assets/images/home.png',
        color: Color(provider.getHomeSelected ? 0xFFFFFFFF : 0xFF80CAC3),
        height: 25,
        width: 25,
      ),
    );
  }

  Widget buildSearchTab(TabBarChangeProvider provider) {
    return InkWell(
      onTap: () {
        provider.setTabBarListener(1);
      },
      child: Image.asset(
        'assets/images/search.png',
        color: Color(provider.getSearchSelected ? 0xFFFFFFFF : 0xFF80CAC3),
        height: 25,
        width: 25,
      ),
    );
  }
}
