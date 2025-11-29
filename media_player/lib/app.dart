import 'package:flutter/material.dart';
import 'package:media_player/music_player_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Player',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.blue),
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          headlineSmall: TextStyle(color: Colors.black),

          titleLarge: TextStyle(),
          titleMedium: TextStyle(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MusicPlayerScreen()
    );
  }
}
