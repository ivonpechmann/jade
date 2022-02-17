import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jade/routes.dart';
import 'package:jade/theme.dart';
import 'firebase_options.dart';
import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jade',
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      theme: themeData,
      home: const Home()
    );
  }
}