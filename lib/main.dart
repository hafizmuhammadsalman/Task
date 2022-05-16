import 'package:covid_19/extension/themeExtension/themeExtension.dart';
import 'package:covid_19/pages/country_notifier/contery_notifier.dart';
import 'package:covid_19/pages/splash.dart';
import 'package:covid_19/pages/tabBar_notifier/tabBar_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabBarChangeProvider()),
        ChangeNotifierProvider(create: (_) => CountryChangeProvider()),
      ],
      child: MyApp(),
    ));
    // runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  late Splash splash;
  bool init = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!init) {
      init = true;
      splash = Splash();
    }
    return MaterialApp(
      theme: Theme.of(context).lightMood(),
      home: splash,
      debugShowCheckedModeBanner: false,
    );
  }
}
