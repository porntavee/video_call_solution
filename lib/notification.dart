import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hms_room_kit/hms_room_kit.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  Future<void> showIncomingCallOverlay(
      BuildContext context, String lawyerName) async {
    late OverlayEntry overlay;
    final player = AudioPlayer();

    // 🔁 ตั้งให้เล่นวนซ้ำ
    await player.setReleaseMode(ReleaseMode.loop);

    // 🔊 เล่นเสียงจาก asset
    await player.play(AssetSource('incoming_call.mp3'));

    overlay = OverlayEntry(
      builder: (context) => Positioned(
        top: 50,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:
                  const Color(0xFF3A3A3C), // เทาเข้มกลาง (คล้าย iOS Dark Card)
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.video_call, color: Colors.white, size: 30),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "สายเรียกเข้าจาก $lawyerName",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.call_end, color: Colors.red),
                  onPressed: () {
                    player.stop(); // 🔇 หยุดเสียง
                    overlay.remove();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.call, color: Colors.greenAccent),
                  onPressed: () {
                    player.stop(); // 🔇 หยุดเสียง
                    overlay.remove();
                    _showReminderBeforeJoin(
                        context); // หรือเปิด Video Call จริง
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlay);

    // ❌ Auto dismiss ภายใน 10 วิ
    Future.delayed(const Duration(seconds: 10), () {
      if (overlay.mounted) {
        player.stop();
        overlay.remove();
      }
    });
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
    final List<Map<String, String>> notifications = [
      {
        "title": "การนัดหมายของคุณได้รับการยืนยันแล้ว",
        "time": "10 เม.ย. 2568 - 10:00 น.",
      },
      {
        "title": "คุณได้รับข้อความใหม่จากทนายอรอนงค์",
        "time": "9 เม.ย. 2568 - 16:45 น.",
      },
      {
        "title": "ระบบได้บันทึกคะแนนรีวิวของคุณแล้ว",
        "time": "8 เม.ย. 2568 - 12:00 น.",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C),
      appBar: AppBar(
        title: const Text("การแจ้งเตือน"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notify = notifications[index];
          return InkWell(
            onTap: () {
              // if (notify["title"]!.contains("ข้อความใหม่จากทนายอรอนงค์")) {
              //   showIncomingCallOverlay(context, "ทนายอรอนงค์");
              // }

              showIncomingCallOverlay(context, "ทนายอรอนงค์");
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C3E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.notifications, color: Colors.amber),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notify["title"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          notify["time"]!,
                          style: const TextStyle(color: Colors.white54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
