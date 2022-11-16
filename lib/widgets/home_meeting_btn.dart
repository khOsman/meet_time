import 'package:flutter/material.dart';
import 'package:meet_time/utils/colors.dart';

class HomeMeetingBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData iconData;
  const HomeMeetingBtn(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: black.withOpacity(0.06),
                    offset: const Offset(0, 4)),
              ],
            ),
            child: Icon(
              iconData,
              color: white,
              size: 30,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
