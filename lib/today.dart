// lib/today.dart
import 'package:flutter/material.dart';

class TodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today'),
      ),
      body: Center(
        child: Text('Welcome to the Today Page!'),
      ),
    );
  }
}