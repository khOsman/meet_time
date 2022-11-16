import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:meet_time/resources/auth_methods.dart';
import 'package:meet_time/resources/jitsi_meet_methods.dart';
import 'package:meet_time/utils/colors.dart';
import 'package:meet_time/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController _meetingIdController;
  late TextEditingController _meetingNameController;

  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    _meetingIdController = TextEditingController();
    _meetingNameController = TextEditingController(
      text: _authMethods.user.displayName,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _meetingIdController.dispose();
    _meetingNameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  onAudioMuted(bool _isAudioMuted) {
    setState(() {
      isAudioMuted = _isAudioMuted;
    });
  }

  onVideoMuted(bool _isVideoMuted) {
    setState(() {
      isVideoMuted = _isVideoMuted;
    });
  }

  _joinMeeting() {
    if (_meetingIdController.text.isNotEmpty) {
      _jitsiMeetMethods.createMeeting(
          roomName: _meetingIdController.text,
          isAudioMuted: isAudioMuted,
          isVideoTurnedOff: isVideoMuted,
          name: _meetingNameController.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Room ID is Empty',
            style: TextStyle(color: white, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Color.fromARGB(255, 255, 176, 140),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text(
          "Join a Meeting",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: _meetingIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room ID',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: _meetingNameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Name',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              _joinMeeting();
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: secondaryBackgroundColor,
                ),
                child: Center(
                  child: Text(
                    'Join',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          MeetingOption(
            text: isAudioMuted ? 'Turn on Audio' : 'Turn off Audio',
            isMute: isAudioMuted,
            onChange: onAudioMuted,
          ),
          MeetingOption(
            text: isVideoMuted ? 'Turn on Video' : 'Turn off Video  ',
            isMute: isVideoMuted,
            onChange: onVideoMuted,
          ),
        ],
      ),
    );
  }
}
