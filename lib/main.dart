import 'package:flutter/material.dart';
import 'package:news_demo/global.dart';
import 'package:news_demo/pages/welcome/welcome_page.dart';
import 'package:news_demo/router/router.gr.dart';

void main() => Global.init().then((value) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: staticRoutes,
      home: WelcomePage(),
    );
  }
}
