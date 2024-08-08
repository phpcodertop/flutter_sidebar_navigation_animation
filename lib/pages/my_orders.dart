import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'MyOrders Page',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
    );
  }
}
