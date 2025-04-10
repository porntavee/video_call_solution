import 'package:flutter/material.dart';
import 'package:hms_room_kit/hms_room_kit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_call/chat.dart';

import 'rating_row.dart';
import 'secure_bypass_image.dart';

class LawyerDetailPage extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String location;
  final double rating;

  const LawyerDetailPage({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.location,
    this.rating = 4.2,
  });

  @override
  State<LawyerDetailPage> createState() => _LawyerDetailPageState();
}

class _LawyerDetailPageState extends State<LawyerDetailPage> {
  final TextEditingController _commentController = TextEditingController();
  final List<Map<String, String>> _comments = [
    {
      "user": "คุณณัฐ",
      "message": "ให้คำปรึกษาดีมาก เข้าใจง่าย 👍",
    },
    {
      "user": "คุณแอน",
      "message": "ตอบไวและชัดเจน ประทับใจครับ",
    },
    {
      "user": "คุณบอส",
      "message": "แนะนำได้ตรงจุด ช่วยคลายความกังวลได้เยอะเลย ❤️",
    },
  ];

  void _addComment() {
    final text = _commentController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _comments.insert(0, {
          "user": "คุณผู้ใช้", // 👈 หรือใช้ชื่อจริงจากระบบก็ได้
          "message": text,
        });
        _commentController.clear();
      });
    }
  }

  void _showReminderBeforeJoin(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("คำแนะนำก่อนเข้าห้อง"),
        content: const Text(
            "📌 กรุณาระบุชื่อในช่อง Enter Name ว่า 1234 ก่อนกด Join Now"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("ยกเลิก"),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop(); // ปิด dialog

              Map<Permission, PermissionStatus> statuses = await [
                Permission.camera,
                Permission.microphone,
              ].request();

              // ถ้าโดนปฏิเสธแบบถาวร (iOS จะไม่ถามซ้ำ)
              if (statuses.values.any((s) => s.isPermanentlyDenied)) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("ต้องเปิดการเข้าถึงใน Settings"),
                    content: const Text(
                        "กรุณาไปที่การตั้งค่า แล้วอนุญาตให้แอปเข้าถึงกล้องและไมโครโฟน"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("ยกเลิก"),
                      ),
                      TextButton(
                        onPressed: () {
                          openAppSettings(); // เปิดหน้า Settings
                        },
                        child: const Text("เปิดการตั้งค่า"),
                      ),
                    ],
                  ),
                );
                return;
              }

              bool allGranted =
                  statuses.values.every((status) => status.isGranted);

              if (allGranted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HMSPrebuilt(
                      roomCode: "jle-wjbx-gyk",
                    ),
                  ),
                );
              } else {
                // แจ้งเตือนทั่วไป
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("การอนุญาตถูกปฏิเสธ"),
                    content: const Text(
                        "กรุณาอนุญาตให้เข้าถึงกล้องและไมโครโฟนเพื่อใช้งานวิดีโอคอล"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("ตกลง"),
                      ),
                    ],
                  ),
                );
              }
            },
            child: const Text("เข้าใช้งาน"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SecureBypassImage(
                imageUrl: widget.imageUrl,
                width: double.infinity,
                height: 300,
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E2C),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.location,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  RatingRow(initialRating: widget.rating),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {},
                          child: ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [Color(0xFFFF8A65), Color(0xFFFFC107)],
                            ).createShader(Rect.fromLTWH(
                                0.0, 0.0, bounds.width, bounds.height)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              child: Text(
                                "🔒 ขอคำแนะนำส่วนตัว",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showReminderBeforeJoin(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Color(0xFF7B61FF),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.video_call,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatPage(
                                    lawyerName: widget.name,
                                    lawyerImageUrl: widget.imageUrl,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Color(0xFF4CAF50),
                                shape: BoxShape.circle,
                              ),
                              child:
                                  const Icon(Icons.chat, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A90E2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                      ),
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate:
                              DateTime.now().add(const Duration(days: 1)),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 30)),
                        );

                        if (selectedDate != null) {
                          final selectedTime = await showTimePicker(
                            context: context,
                            initialTime: const TimeOfDay(hour: 10, minute: 0),
                          );

                          if (selectedTime != null) {
                            // ✅ บันทึกการจอง หรือแสดง dialog ยืนยัน
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text("ยืนยันการจอง"),
                                content: Text(
                                  "คุณจองเวลา ${selectedTime.format(context)} วันที่ ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("ตกลง"),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      },
                      icon:
                          const Icon(Icons.calendar_today, color: Colors.white),
                      label: const Text("จองวัน/เวลา",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "ความคิดเห็นจากผู้ใช้",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            ..._comments.map(
              (comment) => Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C3E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.person, color: Colors.white54),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(comment["user"]!,
                              style: const TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13)),
                          const SizedBox(height: 2),
                          Text(comment["message"]!,
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "แสดงความคิดเห็น...",
                      hintStyle: const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: const Color(0xFF2C2C3E),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: _addComment,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
