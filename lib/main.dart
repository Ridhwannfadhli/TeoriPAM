import 'package:finalprojectmobile/homepage.dart';
import 'package:finalprojectmobile/login.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:finalprojectmobile/favorite_model.dart';



void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<FavoriteModel>(FavoriteModelAdapter());
  await Hive.openBox<FavoriteModel>("favoritesBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: LoginPage(),
    );
  }
}
