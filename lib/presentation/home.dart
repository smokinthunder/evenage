import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
            children: [
              Text("Team"),
              Text(" Judge"),
              Text(" Committee"),
            ],
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
          ],
        )
      ),
    );
  }
}