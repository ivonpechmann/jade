import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jade/routes.dart';
import 'package:jade/theme.dart';
import 'firebase_options.dart';
import 'services/auth.dart';
import 'screens/feed.dart';
import 'screens/landing.dart';

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

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var profile;

  @override
  void initState() {
    super.initState();
    profile = AuthService().profileExists();
  }

  @override
  Widget build(BuildContext context) {
    profile = AuthService().profileExists();
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("An error occured."),
          );
        } else if (snapshot.hasData && AuthService().user!.emailVerified) {
          return FutureBuilder(
            future: profile,
            builder: (context, snapshot) {
              final profileExists = snapshot.data;
              if (profileExists == true) {
                return const FeedScreen();
              } else {
                return const LandingScreen();
              }
            },
          );
        } else {
          return const LandingScreen();
        }
      },
    );
  }
}