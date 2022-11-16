import 'package:flutter/material.dart';
import 'package:meet_time/resources/auth_methods.dart';

import '../widgets/custom_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  leaveScene(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomButton(
          text: 'Sign Out',
          onPressed: () {
            AuthMethods().signOut();
            leaveScene(context);
          }),
    );
  }
}
