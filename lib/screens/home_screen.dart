import 'package:flutter/material.dart';
import 'package:meet_time/resources/auth_methods.dart';
import 'package:meet_time/screens/history_meeting_screen.dart';
import 'package:meet_time/screens/meeting_screen.dart';
import 'package:meet_time/screens/settings_screen.dart';
import 'package:meet_time/utils/colors.dart';
import 'package:meet_time/widgets/custom_button.dart';
import 'package:meet_time/widgets/home_meeting_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Center(child: Text("Contacts")),
    const SettingsScreen(),
  ];

  List<String> labels = ['Meet & Chat', 'Meetings', 'Contacts', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(labels[_page]),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: labels[0]),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: labels[1]),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: labels[2]),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: labels[3]),
        ],
      ),
    );
  }
}
