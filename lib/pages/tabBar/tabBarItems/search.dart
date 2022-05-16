import 'package:covid_19/pages/country_notifier/contery_notifier.dart';
import 'package:covid_19/pages/detail/detail.dart';
import 'package:covid_19/pages/view/countryItemView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);

  ScrollController scrollController = ScrollController();
  FocusNode searchFieldNode = FocusNode();

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
          buildSearchTextField(provider),
          Expanded(child: buildCountryList(provider)),
        ]);
      })
    ]);
  }

  Widget buildSearchTextField(CountryChangeProvider provider) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFF0F0F0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/search.png',color: Colors.black,),
          const SizedBox(width: 8,),
          Expanded(
            child: TextField(
              focusNode: searchFieldNode,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'search',
                hintStyle: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'light',
                  color: Color(0xFF999999),
                ),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(0.0),
              ),
              style: const TextStyle(
                fontSize: 12.0,
                fontFamily: 'regular',
                color: Color(0xFF666666),
              ),
              maxLines: 1,
              onChanged: (value) {
                provider.setSearchListener(value);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCountryList(CountryChangeProvider provider) {
    return ListView.builder(
      controller: scrollController,
      itemCount: provider.filterList?.length ?? 0,
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
                      countryObj: provider.filterList?[index],
                    )));
      },
      child: CountryItemView(
        country: provider.filterList?[index],
      ),
    );
  }
}
