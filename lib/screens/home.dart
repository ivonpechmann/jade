import 'package:flutter/material.dart';
import 'package:jade/screens/feed.dart';
import 'package:jade/services/auth.dart';
import 'package:jade/screens/landing.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData && AuthService().user!.emailVerified) {
              FutureBuilder(
                future: AuthService().profileExists(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
                    return const FeedScreen();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const LandingScreen();
                  }
                }
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const LandingScreen();
        });
  }
}
