import 'package:flutter/material.dart';
class Addteam extends StatelessWidget {
  final String eventName;
  final String imageUrl;

  const Addteam({
    Key? key,
    required this.eventName,
    required this.imageUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(eventName)),
      body: Column(
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              eventName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}