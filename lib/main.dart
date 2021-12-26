import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_laith/moduels/shop_app/on_boarding/on_bording_screen.dart';
import 'package:shop_app_laith/shaerd/diohelper/diohelper.dart';

import 'blocobserve/blocobserve.dart';
import 'moduels/shop_app/login_Screen/login_screen.dart';

void main() {

  Bloc.observer= MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBordingScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
          scaffoldBackgroundColor: Colors.white),
    );
  }
}
