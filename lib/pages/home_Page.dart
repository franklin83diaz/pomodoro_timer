import 'package:flutter/material.dart';

class HomePsge extends StatelessWidget {
  const HomePsge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Center(
            child: Text('25:00',
                style: TextStyle(fontSize: 60, color: Colors.deepPurple))),
      ),
    );
  }
}
