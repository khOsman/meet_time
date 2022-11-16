import 'package:flutter/material.dart';
import 'package:meet_time/resources/auth_methods.dart';
import 'package:meet_time/utils/colors.dart';

import '../widgets/custom_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  leaveScene(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          Container(
            height: 60,
            color: secondaryBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8, 14, 8),
                  child: Text(
                    "User Name : ${AuthMethods().user.displayName}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            color: secondaryBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8, 14, 8),
                  child: Text(
                    "User Email : ${AuthMethods().user.email}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          CustomButton(
              text: 'Sign Out',
              onPressed: () {
                AuthMethods().signOut();
                leaveScene(context);
              }),
        ],
      ),
    );
  }
}
