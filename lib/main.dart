import 'package:flutter/material.dart';
import 'Bankpages/addMoney.dart';
import 'Bankpages/choose_bank.dart';
import 'Bankpages/qr_code.dart';
import 'login.dart';
import 'product_details.dart';
import 'verify.dart';
import 'complete_profile.dart';
import 'home.dart';
import 'wallet_info.dart';
import 'proj_details.dart';

import 'Bankpages/apply.dart';

void main() {
  runApp(MaterialApp(
    home: login(),
    theme: new ThemeData(
      fontFamily: 'fontgroup1',
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
    ),
    routes: {
      'verify': (context) => verify(),
      'info': (context) => info(),
      'home': (context) => home(),
      'wallet': (context) => wallet(),
      'details': (context) => details(),
      'addMoney': (context) => addMoney(),
      'chooseBank': (context) => chooseBank(),
      'apply': (context) => apply(),
      'qr': (context) => qr(),
      'pro_info': (context) => pro_info()
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return login();
  }
}
