import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final GestureTapCallback onTap;


  const MenuItem({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.cyan,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
