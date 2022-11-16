import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meet_time/resources/auth_methods.dart';
import 'package:meet_time/resources/jitsi_meet_methods.dart';

import '../widgets/home_meeting_btn.dart';

class MeetingScreen extends StatelessWidget {
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  MeetingScreen({Key? key}) : super(key: key);

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoTurnedOff: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingBtn(
                onPressed: createNewMeeting,
                text: "New Meeting",
                iconData: Icons.videocam),
            HomeMeetingBtn(
                onPressed: () {
                  joinMeeting(context);
                },
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
