import 'package:flutter/material.dart';
import 'package:hms_room_kit/hms_room_kit.dart';

import 'secure_bypass_image.dart';

class LawyerDetailPage extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String location;
  final double rating;

  const LawyerDetailPage({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SecureBypassImage(
                imageUrl: imageUrl,
                width: double.infinity,
                height: 300,
                borderRadius: BorderRadius.circular(0),
              ),

              // Image.network(
              //   imageUrl,
              //   height: 300,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ),
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
                    name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    location,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text(
                        "Rating ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        rating.toStringAsFixed(2),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < rating.round()
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 22,
                          );
                        }),
                      )
                    ],
                  ),
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
                          onPressed: () {
                            // TODO: ทำการจ้างทนาย
                          },
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
                      GestureDetector(
                        onTap: () async {
                          _showReminderBeforeJoin(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Color(0xFF7B61FF),
                            shape: BoxShape.circle,
                          ),
                          child:
                              const Icon(Icons.video_call, color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
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
            onPressed: () {
              Navigator.of(context).pop(); // ปิด dialog
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HMSPrebuilt(
                    roomCode: "jle-wjbx-gyk",
                  ),
                ),
              );
            },
            child: const Text("เข้าใช้งาน"),
          ),
        ],
      ),
    );
  }
}
