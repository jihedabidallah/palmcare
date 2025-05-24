import 'package:flutter/material.dart';

class AIAssistantScreen extends StatefulWidget {
  const AIAssistantScreen({Key? key}) : super(key: key);

  @override
  State<AIAssistantScreen> createState() => _AIAssistantScreenState();
}

class _AIAssistantScreenState extends State<AIAssistantScreen> {
  final TextEditingController _questionController = TextEditingController();
  String _aiResponse = '';
  bool _loading = false;

  void _askAI() async {
    final question = _questionController.text.trim();

    if (question.isEmpty) return;

    setState(() {
      _loading = true;
      _aiResponse = '';
    });

    // ⚠️ هنا يمكن استبدال السطر التالي بربط فعلي مع API مثل OpenAI أو Google IDX
    await Future.delayed(const Duration(seconds: 2)); // محاكاة استجابة
    setState(() {
      _aiResponse = "هذا مجرد مثال لإجابة الذكاء الاصطناعي بخصوص: \"$question\".\n"
          "ننصح بريّ النخيل مرة واحدة أسبوعيًا في الصيف ومرتين شهريًا في الشتاء.";
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مساعد الذكاء الاصطناعي'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'اسأل عن أي شيء يخص الزراعة أو الري أو الطاقة الشمسية:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _questionController,
              decoration: InputDecoration(
                hintText: 'اكتب سؤالك هنا...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.green.shade50,
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: _askAI,
              icon: const Icon(Icons.psychology),
              label: const Text('اطلب المساعدة'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade800,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 30),
            _loading
                ? const CircularProgressIndicator()
                : _aiResponse.isNotEmpty
                    ? Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.orange.shade200),
                        ),
                        child: Text(
                          _aiResponse,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
