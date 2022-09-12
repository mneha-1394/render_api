import 'package:flutter/material.dart';
import 'package:render_api/screens/firstpage.dart';
import 'package:render_api/screens/secondpage.dart';
import 'package:render_api/screens/thirdpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.deepPurple) ,
        primarySwatch: Colors.deepPurple,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amberAccent) ,
      ),
      home: const FirstPage(),
      routes: {
            SecondPage.routeName:((context) => const SecondPage()),
            ThirdPage.routeName:((context) => const ThirdPage())
      },
    );
  }
}

