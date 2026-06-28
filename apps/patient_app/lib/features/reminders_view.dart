import 'package:flutter/material.dart';

class RemindersView extends StatelessWidget {
  static const String id = 'RemindersView';
  const RemindersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('التذكيرات')),
      body: const Center(
        child: Text('صفحة التذكيرات'),
      ),
    );
  }
}
