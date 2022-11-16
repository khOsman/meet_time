import 'package:flutter/material.dart';
import 'package:meet_time/utils/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text("Meet & chat"),
        centerTitle: true,
      ),
      body: Column(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: 'Meet & Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: 'Meetings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
      ),
    );
  }
}
