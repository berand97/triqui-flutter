import 'package:flutter/material.dart';
import 'package:triki_app/config/theme/themeconfig.dart';
import 'view/screen/triki_game_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeConfig.getThemeData(),
      debugShowCheckedModeBanner: false,
      home: const TrikiGameView(),
    );
  }
}
