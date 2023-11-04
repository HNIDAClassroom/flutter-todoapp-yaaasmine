import 'package:flutter/material.dart';
import 'package:todolist_app/widgets/AuthVerify.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Déconnexion de l'utilisateur actuel
  //await FirebaseAuth.instance.signOut();)

  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)
            .copyWith(background: const Color.fromARGB(255, 230, 179, 187)),
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      home: const AuthVerify(),
    ),
  );
}
