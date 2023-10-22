import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/widgets/login.dart';
import 'package:todolist_app/widgets/tasks.dart';
import 'package:todolist_app/widgets/ThemeProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: themeProvider.currentTheme, // Set the app's theme dynamically
      home: Login(),
    );
  }
}

