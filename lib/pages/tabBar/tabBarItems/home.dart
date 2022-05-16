import 'package:covid_19/pages/country_notifier/contery_notifier.dart';
import 'package:covid_19/pages/detail/detail.dart';
import 'package:covid_19/pages/view/countryItemView.dart';
import 'package:covid_19/pages/view/worldItemView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  ScrollController scrollController = ScrollController();
  bool isInit = false;
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      isInit = true;
      this.context = context;
    }
    return Stack(alignment: Alignment.bottomRight, children: <Widget>[
      Consumer<CountryChangeProvider>(builder: (context, provider, child) {
        return Column(children: <Widget>[
          buildWorld(provider),
          Expanded(child: buildCountryList(provider)),
        ]);
      })
    ]);
  }

  Widget buildWorld(CountryChangeProvider provider) {
    return Visibility(
        visible: provider.worldItem != null,
        child: WorldItemView(
          world: provider.worldItem,
        ));
  }

  Widget buildCountryList(CountryChangeProvider provider) {
    return ListView.builder(
      controller: scrollController,
      itemCount: provider.countryList?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return buildCountryItem(provider, index);
      },
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
    );
  }

  Widget buildCountryItem(CountryChangeProvider provider, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailView(
                      countryObj: provider.countryList?[index],
                    )));
      },
      child: CountryItemView(
        country: provider.countryList?[index],
      ),
    );
  }
}
