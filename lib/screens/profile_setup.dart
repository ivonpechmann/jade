import 'package:flutter/material.dart';
import 'package:jade/services/auth.dart';
import 'package:jade/shared/top_bar.dart';
import 'package:jade/theme.dart';
import 'package:jade/widgets/text_field_input.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileSetupScreen extends StatefulWidget {
  ProfileSetupScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String _errorMessage = '';
  File? _image;

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
                height: 15,
              ),
              const Text(
                "Set up profile",
                style: TextStyle(
                  fontSize: 30
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 70,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 64,
                          backgroundImage: FileImage(_image!),
                        )
                      : const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://i.stack.imgur.com/l60Hf.png'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo_sharp,
                          color: Colors.grey,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              TextFieldInput(
                hintText: 'Enter your username',
                textInputType: TextInputType.name,
                textEditingController: _usernameController,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFieldInput(
                hintText: 'Enter your display name',
                textInputType: TextInputType.name,
                textEditingController: _displayNameController,
              ),
              const SizedBox(
                height: 40,
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

  void selectImage() async {
    XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(imageFile!.path);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _displayNameController.dispose();
  }
}
