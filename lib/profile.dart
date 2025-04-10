import 'package:flutter/material.dart';

import 'secure_bypass_image.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final bookingSchedule = [
    {
      "date": "10 เม.ย. 2568",
      "time": "14:00 น.",
      "lawyer": "ทนายสมบัติ บัวทอง",
    },
    {
      "date": "12 เม.ย. 2568",
      "time": "10:30 น.",
      "lawyer": "ทนายนิชา นาคะปัญญา",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final consultationHistory = [
      {
        "date": "4 เม.ย. 2568",
        "lawyer": "ทนายวิชัย พงษ์สมบัติ",
        "topic": "กฎหมายครอบครัว",
      },
      {
        "date": "25 มี.ค. 2568",
        "lawyer": "ทนายอรอนงค์ สุขสวัสดิ์",
        "topic": "ที่ดินและอสังหาริมทรัพย์",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C),
      appBar: AppBar(
        title: const Text("โปรไฟล์ของฉัน"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SecureBypassImage(
                  imageUrl:
                      "https://gateway.we-builds.com/wb-py-media/uploads/lawyer\\20250408-153949-Art Toy พี่หมู.png",
                  width: 250,
                  height: 250,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                "คุณสมชาย ทนายความ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                "กฎหมายครอบครัว | ประสบการณ์ 10 ปี",
                style: TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.white),
              title: const Text("แก้ไขโปรไฟล์",
                  style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text("ออกจากระบบ",
                  style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            const SizedBox(height: 24),
            const Text(
              "ตารางการจองของฉัน",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(color: Colors.white30),
            ...bookingSchedule.map((booking) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.event_available,
                    color: Colors.greenAccent),
                title: Text(
                  "${booking["date"]} เวลา ${booking["time"]}",
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "กับ ${booking["lawyer"]}",
                  style: const TextStyle(color: Colors.white60),
                ),
                trailing: const Icon(Icons.calendar_today,
                    color: Colors.white30, size: 16),
                onTap: () {
                  // 🔧 เพิ่มการจัดการคลิกได้ เช่น แก้ไขนัดหมาย หรือดูรายละเอียด
                },
              );
            }).toList(),
            const SizedBox(height: 24),
            const Text(
              "ประวัติการปรึกษา",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(color: Colors.white30),
            ...consultationHistory.map((history) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.history, color: Colors.white70),
                title: Text(
                  history["topic"]!,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "${history["lawyer"]} • ${history["date"]}",
                  style: const TextStyle(color: Colors.white60),
                ),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: Colors.white30, size: 16),
                onTap: () {
                  // 🔧 ใส่ event เมื่อคลิกดูรายละเอียดได้ที่นี่
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
