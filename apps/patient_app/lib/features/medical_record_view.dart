import 'package:flutter/material.dart';

class MedicalRecordView extends StatelessWidget {
  static const String id = 'MedicalRecordView';
  const MedicalRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('السجل الطبي')),
      body: const Center(
        child: Text('صفحة السجل الطبي'),
      ),
    );
  }
}
