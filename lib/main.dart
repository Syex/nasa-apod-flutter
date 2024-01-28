import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod/picture_view/picture_page.dart';

import 'di.dart';

void main() {
  configureDependencies();
  EquatableConfig.stringify = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASA Astronomy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("NASA Astronomy Picture"),
      ),
      body: const SafeArea(
        child: PicturePage(),
      ),
    );
  }
}
