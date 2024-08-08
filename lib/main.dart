import 'package:flutter/material.dart';
import '/sidebar/sidebar_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
      ),
      home: const SidebarLayout(),
    );
  }
}
