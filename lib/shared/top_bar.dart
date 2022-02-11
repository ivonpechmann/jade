import 'package:flutter/material.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'images/white_logo_transparent_noName.png',
        height: 70,
      ),
      centerTitle: true,
    );
  }
}
