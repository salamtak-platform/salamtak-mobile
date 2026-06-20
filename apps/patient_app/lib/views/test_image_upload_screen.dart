import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class TestImageUploadScreen extends StatefulWidget {
  static String id = "TestImageUploadScreen";

  const TestImageUploadScreen({super.key});

  @override
  State<TestImageUploadScreen> createState() => _TestImageUploadScreenState();
}

class _TestImageUploadScreenState extends State<TestImageUploadScreen> {
  File? _selectedImage; // لتخزين الملف وعرضه في الواجهة
  bool _isUploading = false; // لمتابعة حالة الرفع وإظهار مؤشر التحميل
  final Dio _dio = Dio(); // إنشاء كائن Dio لإرسال الطلبات

  // الدالة المسؤولة عن اختيار الصورة ورفعها
  Future<void> _pickAndUploadImage() async {
    final ImagePicker picker = ImagePicker();

    // 1. اختيار الصورة من الاستوديو (Gallery)
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80, // اختياري: لتقليل حجم الصورة وضغطها قبل الرفع
    );

    // التحقق من أن المستخدم اختار صورة بالفعل ولم يغلق المعرض
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
        _isUploading = true;
      });

      try {
        // 2. استخراج اسم الملف الأساسي لإرساله مع الطلب
        String fileName = image.path.split('/').last;

        // 3. تجهيز البيانات بصيغة FormData (المخصصة للملفات والصور)
        FormData formData = FormData.fromMap({
          // اسم الحقل "image" يجب أن يطابق ما يتوقعه السيرفر/الـ API لديك
          "image": await MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
          // يمكنك إضافة حقول نصية أخرى إذا كان الـ API يطلبها، مثل:
          // "user_id": "456",
        });

        // 4. إرسال طلب الـ POST عبر Dio
        final apiUrl = '${AppConfig.apiBaseUrl}/upload';

        Response response = await _dio.post(
          apiUrl,
          data: formData,
          // اختياري: لمتابعة النسبة المئوية لتقدم عملية الرفع في الـ Console
          onSendProgress: (int sent, int total) {
            double progress = (sent / total) * 100;
            debugPrint("نسبة الرفع: ${progress.toStringAsFixed(0)}%");
          },
        );

        // 5. التعامل مع استجابة السيرفر
        if (response.statusCode == 200 || response.statusCode == 201) {
          _showSnackBar("تم رفع الصورة بنجاح!", Colors.green);
          debugPrint("استجابة السيرفر: ${response.data}");
        } else {
          _showSnackBar(
              "فشل الرفع: رمز الحالة ${response.statusCode}", Colors.red);
        }
      } on DioException catch (e) {
        // التعامل مع أخطاء Dio (مشاكل الشبكة، السيرفر، إلخ)
        String errorMessage = "حدث خطأ أثناء الاتصال بالسيرفر";
        if (e.response != null) {
          errorMessage = "خطأ من السيرفر: ${e.response?.data}";
        }
        _showSnackBar(errorMessage, Colors.red);
        debugPrint("Dio Error: ${e.message}");
      } catch (e) {
        // التعامل مع أي أخطاء عامة أخرى
        _showSnackBar("حدث خطأ غير متوقع: $e", Colors.red);
      } finally {
        // إيقاف مؤشر التحميل في كل الأحوال (سواء نجح الرفع أو فشل)
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  // دالة مساعدة لعرض رسائل سريعة للمستخدم
  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("رفع صورة إلى الـ API"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // عرض الصورة إذا تم اختيارها، وإلا عرض نص تنبيهي
              _selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        _selectedImage!,
                        height: 250,
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[400]!),
                      ),
                      child:
                          const Icon(Icons.image, size: 80, color: Colors.grey),
                    ),
              const SizedBox(height: 40),

              // إظهار مؤشر التحميل أثناء الرفع، وإلا إظهار زر الاختيار
              _isUploading
                  ? const CircularProgressIndicator()
                  : ElevatedButton.icon(
                      onPressed: _pickAndUploadImage,
                      icon: const Icon(Icons.cloud_upload),
                      label: const Text("اختر صورة وارفعها فوراً"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
