import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'MyAccount Page',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
    );
  }
}
