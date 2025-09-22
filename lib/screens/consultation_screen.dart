import 'package:flutter/material.dart';

class ConsultationScreen extends StatefulWidget {
  @override
  _ConsultationScreenState createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  bool isSubmitted = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    notesController.dispose();
    super.dispose();
  }

  void _submitConsultation() {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        notesController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء ملء جميع الحقول')),
      );
      return;
    }

    setState(() {
      isSubmitted = true;
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تم الحجز'),
        content: const Text(
            'تم إرسال بيانات الاستشارة بنجاح. ستتلقى الرد من الدكتورة قريبًا.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // تنظيف الحقول
              nameController.clear();
              phoneController.clear();
              notesController.clear();
              setState(() {
                isSubmitted = false;
              });
            },
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حجز استشارة')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (!isSubmitted) ...[
                TextField(
                  controller: nameController,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                      labelText: 'الاسم الكامل', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: phoneController,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      labelText: 'رقم الهاتف', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: notesController,
                  maxLines: 4,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                      labelText: 'ملاحظات', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _submitConsultation,
                  child: const Text('حجز الاستشارة'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50)),
                )
              ] else ...[
                const SizedBox(height: 50),
                const Icon(Icons.check_circle, color: Colors.green, size: 100),
                const SizedBox(height: 20),
                const Text(
                  'تم إرسال بيانات الاستشارة بنجاح!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
