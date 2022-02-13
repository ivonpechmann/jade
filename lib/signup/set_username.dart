import 'package:flutter/material.dart';
import 'package:jade/shared/top_bar.dart';

class SetUsernameScreen extends StatefulWidget {
  SetUsernameScreen({Key? key}) : super(key: key);

  @override
  State<SetUsernameScreen> createState() => _SetUsernameScreenState();
}

class _SetUsernameScreenState extends State<SetUsernameScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopBar(),
    );
  }
}