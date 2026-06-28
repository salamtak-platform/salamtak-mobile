import 'package:flutter/material.dart';
import 'package:patient_app/components/bottom_nav_bar.dart';
import 'package:patient_app/views.dart';

class MainView extends StatefulWidget {
  static const String id = 'MainView';
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    ActivitiesView(),
    HakimAiView(),
    RemindersView(),
    MedicalRecordView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
