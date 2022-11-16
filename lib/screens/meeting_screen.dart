import 'package:flutter/material.dart';

import '../widgets/home_meeting_btn.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingBtn(
                onPressed: () {},
                text: "New Meeting",
                iconData: Icons.videocam),
            HomeMeetingBtn(
                onPressed: () {},
                text: "Join Meeting",
                iconData: Icons.add_box_rounded),
            HomeMeetingBtn(
                onPressed: () {},
                text: "Schedule",
                iconData: Icons.calendar_today),
            HomeMeetingBtn(
                onPressed: () {},
                text: "Share Screen",
                iconData: Icons.arrow_upward_rounded),
          ],
        ),
        Expanded(
          child: Center(
            child: Text(
              "Create/Join Meetings with just a click!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
