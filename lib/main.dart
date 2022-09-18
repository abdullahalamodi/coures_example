import 'package:coures_example/anime_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime example',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const AnimeListPage(),
    );
  }
}
