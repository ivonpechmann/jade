import 'package:flutter/material.dart';
import 'package:jade/services/auth.dart';
import 'package:jade/shared/top_bar.dart';
import 'package:jade/theme.dart';
import 'package:jade/widgets/text_field_input.dart';

class ProfileSetupScreen extends StatefulWidget {
  ProfileSetupScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              const SizedBox(
                height: 64,
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://i.stack.imgur.com/l60Hf.png'),
                    backgroundColor: Colors.red,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo_rounded),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your username',
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your display name',
                textInputType: TextInputType.text,
                textEditingController: _displayNameController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your bio',
                textInputType: TextInputType.text,
                textEditingController: _bioController,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                child: Container(
                  child: const Text("Create profile"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: purpleColor,
                  ),
                ),
                onTap: createProfile,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(_errorMessage),
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createProfile() async{
    String res = await AuthService().createUser(
                  username: _usernameController.text,
                  displayName: _displayNameController.text,
                  bio: _bioController.text,);
    if (res == 'success') {
      Navigator.pushNamedAndRemoveUntil(context, '/feed', (route) => false);
    }
    else {
      _errorMessage = res;
    }
  }
}