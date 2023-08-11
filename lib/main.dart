import 'package:flutter/material.dart';

import 'screens.dart/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // textTheme: TextTheme(),
          appBarTheme:  const AppBarTheme(
          
            // titleTextStyle: TextStyle(color: Colors.amber),
            backgroundColor: Colors.amber,
            iconTheme: IconThemeData(size: 30),
            foregroundColor: Colors.black,

          ),
          // primaryColor: Colors.amber
          
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreen(),
    );
  }
}

