import 'package:flutter/material.dart';

class ActivitiesView extends StatelessWidget {
  static const String id = 'ActivitiesView';
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الأنشطة')),
      body: const Center(
        child: Text('صفحة الأنشطة'),
      ),
    );
  }
}
