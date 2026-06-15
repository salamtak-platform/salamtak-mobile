import 'package:flutter/cupertino.dart'; // مهم جداً لاستخدام تصميم الآيفون
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestDateScreen extends StatefulWidget {
  static String id = "TestDateScreen";

  const TestDateScreen({super.key});

  @override
  State<TestDateScreen> createState() => _TestDateScreen();
}

class _TestDateScreen extends State<TestDateScreen> {
  final TextEditingController _dobController = TextEditingController();

  // لحفظ التاريخ المختار مبدئياً
  DateTime _selectedDate = DateTime(2000, 1, 1);

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  // الدالة لفتح العجلة (Scroll Wheel)
  void _showCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext builderContext) {
        return SizedBox(
          height: 300, // ارتفاع النافذة
          child: Column(
            children: [
              // 1. شريط علوي يحتوي على زر "تم" و "إلغاء"
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(builderContext).pop(),
                      child: const Text('إلغاء',
                          style: TextStyle(color: Colors.red)),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(builderContext).pop(),
                      child: const Text('تم',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ],
                ),
              ),

              // 2. عجلة التاريخ (CupertinoDatePicker)
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode
                      .date, // لعرض التاريخ فقط بدون الوقت
                  initialDateTime: _selectedDate,
                  minimumDate: DateTime(1900), // أقدم تاريخ
                  maximumDate: DateTime.now(), // أحدث تاريخ (تاريخ اليوم)

                  // يتم استدعاء هذا الحدث مع كل لفة للعجلة
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      _selectedDate = newDate;
                      // تحديث حقل النص فوراً عند التمرير
                      _dobController.text =
                          DateFormat('yyyy-MM-dd').format(newDate);
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تاريخ الميلاد (Cupertino)"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _dobController,
              readOnly: true, // لمنع ظهور الكيبورد
              onTap: () => _showCupertinoDatePicker(context),
              decoration: InputDecoration(
                labelText: "تاريخ الميلاد",
                hintText: "اضغط لاختيار التاريخ",
                prefixIcon:
                    const Icon(Icons.calendar_today, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
