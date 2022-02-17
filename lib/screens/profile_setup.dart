import 'package:flutter/material.dart';
import 'package:jade/shared/top_bar.dart';

class ProfileSetupScreen extends StatefulWidget {
  ProfileSetupScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopBar(),
    );
  }
}