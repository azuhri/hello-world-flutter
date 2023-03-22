import 'package:flutter/material.dart';
import 'package:initial_project/components/detail_screen.dart';
import 'package:initial_project/components/main_screen.dart';
import 'package:initial_project/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoneTourismProvider(),
      child: MaterialApp(
          title: "Contacts",
          theme: ThemeData(),
          home: MainScreen(),
        ),
    );
  }
}

