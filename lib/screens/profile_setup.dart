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
              const SizedBox(
                height: 100,
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage:
                        NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
                    backgroundColor: Colors.red,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_a_photo_sharp,
                          color: Colors.grey,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              TextFieldInput(
                hintText: 'Enter your username',
                textInputType: TextInputType.name,
                textEditingController: _usernameController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your display name',
                textInputType: TextInputType.name,
                textEditingController: _displayNameController,
              ),
              const SizedBox(
                height: 48,
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
                child: Text(_errorMessage, style: errorMessage),
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

  void createProfile() async {
    String res = await AuthService().createUser(
      username: _usernameController.text,
      displayName: _displayNameController.text,
    );
    if (res == 'success') {
      Navigator.pushNamedAndRemoveUntil(context, '/feed', (route) => false);
    } else {
      setState(() {
        _errorMessage = res;
      });
    }
  }
}
