import 'dart:developer';

import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:meet_time/resources/auth_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoTurnedOff,
    String name = '',
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      String userName = _authMethods.user.displayName!;

      var options = JitsiMeetingOptions(
        room: roomName,
      )
        ..userDisplayName = name == userName ? userName : name
        ..userEmail = _authMethods.user.email
        ..userAvatarURL = _authMethods.user.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoTurnedOff;

      // ..room = "myroom" // Required, spaces will be trimmed
      // ..serverURL = "https://someHost.com"
      // ..subject = "Meeting with Gunschu"
      //..featureFlag = featureFlag;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      log("error: $error");
    }
  }
}
