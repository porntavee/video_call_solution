import 'package:flutter/material.dart';
import 'package:hms_room_kit/hms_room_kit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'chat.dart';
import 'lawyer_detail.dart';
import 'secure_bypass_image.dart';

class LawyerListPage extends StatelessWidget {
  final String category;
  LawyerListPage({super.key, required this.category});

  final List<Map<String, String>> allLawyers = [
    // 🔹 กฎหมายแพ่งและอาญา
    {
      "name": "ทนายสมชาย อินทรีย์",
      "specialty": "คดีแพ่ง, คดีอาญา, ฟ้องร้องทั่วไป",
      "category": "กฎหมายแพ่งและอาญา",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/01.png",
    },
    {
      "name": "ทนายสุพจน์ ธรรมรักษ์",
      "specialty": "คดีฉ้อโกง ยักยอกทรัพย์",
      "category": "กฎหมายแพ่งและอาญา",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer\\20250403-162444-ChatGPT Image 3 เม.ย. 2568 16_24_33.png",
    },
    {
      "name": "ทนายสุวรรณา วิริยะ",
      "specialty": "ฟ้องละเมิด, พ.ร.บ. เช็ค",
      "category": "กฎหมายแพ่งและอาญา",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/p2.png",
    },
    {
      "name": "ทนายก้องเกียรติ ศิริทรัพย์",
      "specialty": "แพ่ง-อาญา รวดเร็ว ครบวงจร",
      "category": "กฎหมายแพ่งและอาญา",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/p3.png",
    },
    {
      "name": "ทนายปิยะวัฒน์ ปัญญาธรรม",
      "specialty": "ต่อสู้คดีอาญา คดีฟ้องกลับ",
      "category": "กฎหมายแพ่งและอาญา",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/p4.png",
    },

    // 🔹 กฎหมายครอบครัว
    {
      "name": "ทนายนารี พิพัฒน์พงศ์",
      "specialty": "หย่า, ฟ้องเรียกค่าเลี้ยงดู",
      "category": "กฎหมายครอบครัว",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/03.png",
    },
    {
      "name": "ทนายสุดารัตน์ พูนผล",
      "specialty": "แบ่งสินสมรส, สิทธิผู้ปกครอง",
      "category": "กฎหมายครอบครัว",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/f1.png",
    },
    {
      "name": "ทนายชัยวัฒน์ บุญศรี",
      "specialty": "ฟ้องบุตรนอกสมรส, รับรองบุตร",
      "category": "กฎหมายครอบครัว",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/f2.png",
    },
    {
      "name": "ทนายภัคจิรา วัฒนา",
      "specialty": "ปัญหาในครอบครัวที่ละเอียดอ่อน",
      "category": "กฎหมายครอบครัว",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/f3.png",
    },
    {
      "name": "ทนายณัฐวุฒิ กาญจนา",
      "specialty": "ฟ้องหย่า, ปรึกษาคู่สมรส",
      "category": "กฎหมายครอบครัว",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/f4.png",
    },

    // 🔹 กฎหมายแรงงาน
    {
      "name": "ทนายวิทยา ธรรมะชัย",
      "specialty": "ฟ้องนายจ้าง, เลิกจ้างไม่เป็นธรรม",
      "category": "กฎหมายแรงงาน",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/02.png",
    },
    {
      "name": "ทนายกฤตภาส แรงงานดี",
      "specialty": "คดีแรงงาน, สัญญาจ้าง",
      "category": "กฎหมายแรงงาน",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/l1.png",
    },
    {
      "name": "ทนายดารารัตน์ พรชัย",
      "specialty": "ฟ้องบริษัท, ถูกบังคับให้ออก",
      "category": "กฎหมายแรงงาน",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/l2.png",
    },
    {
      "name": "ทนายสมบูรณ์ บุญเกิด",
      "specialty": "ค่าชดเชย, ค่าล่วงเวลา",
      "category": "กฎหมายแรงงาน",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/l3.png",
    },
    {
      "name": "ทนายรัตนา จงกล",
      "specialty": "ประกันสังคม, แรงงานสัมพันธ์",
      "category": "กฎหมายแรงงาน",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/l4.png",
    },

    // 🔹 ที่ดินและอสังหาริมทรัพย์
    {
      "name": "ทนายกาญจนา ศรีสุข",
      "specialty": "โฉนด, มรดก, รังวัดไม่ตรง",
      "category": "ที่ดินและอสังหาริมทรัพย์",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/land.png",
    },
    {
      "name": "ทนายอริยะ จิรธรรม",
      "specialty": "ซื้อขายที่ดิน, โดนหลอกขาย",
      "category": "ที่ดินและอสังหาริมทรัพย์",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/la1.png",
    },
    {
      "name": "ทนายชนิกา อินทรา",
      "specialty": "ทางภาระจำยอม, การเวนคืน",
      "category": "ที่ดินและอสังหาริมทรัพย์",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/la2.png",
    },
    {
      "name": "ทนายภาณุ มูลเมือง",
      "specialty": "บ้านติดจำนอง, ฟ้องธนาคาร",
      "category": "ที่ดินและอสังหาริมทรัพย์",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/la3.png",
    },
    {
      "name": "ทนายศิริพร ถาวร",
      "specialty": "แบ่งมรดก, ที่ดินตกทอด",
      "category": "ที่ดินและอสังหาริมทรัพย์",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/la4.png",
    },

    // 🔹 ธุรกิจและการค้า
    {
      "name": "ทนายภาณุวัฒน์ ธุรกิจไทย",
      "specialty": "ก่อตั้งบริษัท, จดทะเบียน",
      "category": "ธุรกิจและการค้า",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/business.png",
    },
    {
      "name": "ทนายสาธิต วัฒนบัญชา",
      "specialty": "สัญญาร่วมทุน, หุ้นส่วน",
      "category": "ธุรกิจและการค้า",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/b1.png",
    },
    {
      "name": "ทนายปริญญา จันทร์ทอง",
      "specialty": "คดีหนี้ธุรกิจ, เรียกเงินคืน",
      "category": "ธุรกิจและการค้า",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/b2.png",
    },
    {
      "name": "ทนายณัฏฐพล วิจิตร",
      "specialty": "ละเมิดทรัพย์สินทางปัญญา",
      "category": "ธุรกิจและการค้า",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/b3.png",
    },
    {
      "name": "ทนายนภัสสร เงินดี",
      "specialty": "การฟ้องร้องทางการค้า",
      "category": "ธุรกิจและการค้า",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/b4.png",
    },

    // 🔹 แรงงานต่างชาติ
    {
      "name": "ทนายอุษา มนตรี",
      "specialty": "แรงงานต่างด้าว, Visa, Work Permit",
      "category": "แรงงานต่างชาติ",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/immigrant.png",
    },
    {
      "name": "ทนายเกรียงศักดิ์ อินทรีย์",
      "specialty": "ใบอนุญาตแรงงานต่างชาติ",
      "category": "แรงงานต่างชาติ",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/i1.png",
    },
    {
      "name": "ทนายกิตติพงษ์ สันติภาพ",
      "specialty": "สัญญาจ้างแรงงานข้ามชาติ",
      "category": "แรงงานต่างชาติ",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/i2.png",
    },
    {
      "name": "ทนายวันเพ็ญ ไพศาล",
      "specialty": "ขอวีซ่า, ต่ออายุใบอนุญาต",
      "category": "แรงงานต่างชาติ",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/i3.png",
    },
    {
      "name": "ทนายเอกพงษ์ อินทา",
      "specialty": "ข้อพิพาทแรงงานต่างด้าว",
      "category": "แรงงานต่างชาติ",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/i4.png",
    },

    // 🔹 เทคโนโลยี / ออนไลน์
    {
      "name": "ทนายอธิศักดิ์ ไอทีธรรม",
      "specialty": "Cyber Crime, หมิ่นประมาทออนไลน์",
      "category": "เทคโนโลยี / ออนไลน์",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/techlaw.png",
    },
    {
      "name": "ทนายมนสิชา ดิจิทัล",
      "specialty": "ละเมิดลิขสิทธิ์, โซเชียลมีเดีย",
      "category": "เทคโนโลยี / ออนไลน์",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/t1.png",
    },
    {
      "name": "ทนายภควดี ไชยวงศ์",
      "specialty": "ฟ้องเว็บปลอม, คดีอีคอมเมิร์ซ",
      "category": "เทคโนโลยี / ออนไลน์",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/t2.png",
    },
    {
      "name": "ทนายศิวกร อินเทอร์เน็ต",
      "specialty": "ปัญหา Privacy, ข้อมูลรั่วไหล",
      "category": "เทคโนโลยี / ออนไลน์",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/t3.png",
    },
    {
      "name": "ทนายยุพา นิวมีเดีย",
      "specialty": "ฟ้อง influencer, รีวิวเท็จ",
      "category": "เทคโนโลยี / ออนไลน์",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/t4.png",
    },

    {
      "name": "ทนายความ นั_1",
      "specialty": "ตรวจสอบพฤติกรรม",
      "category": "นักสืบ / สืบสวน",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/gen_นั_1.png"
    },
    {
      "name": "ทนายหญิง นั_2",
      "specialty": "ติดตามตัวบุคคล",
      "category": "นักสืบ / สืบสวน",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/gen_นั_2.png"
    },
    {
      "name": "ทนายหญิง นั_3",
      "specialty": "สืบทรัพย์",
      "category": "นักสืบ / สืบสวน",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/gen_นั_3.png"
    },
    {
      "name": "ทนายความ นั_4",
      "specialty": "ตรวจสอบประวัติ",
      "category": "นักสืบ / สืบสวน",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/gen_นั_4.png"
    },
    {
      "name": "ทนายหญิง นั_5",
      "specialty": "สืบพยานเอกชน",
      "category": "นักสืบ / สืบสวน",
      "imageUrl":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer/gen_นั_5.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final filteredLawyers =
        allLawyers.where((lawyer) => lawyer["category"] == category).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C),
      appBar: AppBar(
        title: Text('ทนายด้าน $category'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // 🔽 รูปพื้นหลังจาง ๆ
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: SecureBypassImage(
                imageUrl:
                    'https://gateway.we-builds.com/wb-py-media/uploads/lawyer\\20250404-110704-ChatGPT Image 4 เม.ย. 2568 11_06_55.png',
                width: 50,
                height: 50,
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2C2C3E),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'ค้นหาทนาย...',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: InputBorder.none,
                            icon: Icon(Icons.search, color: Colors.white54),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color(0xFF7B61FF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.filter_alt_outlined,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredLawyers.length,
                  itemBuilder: (context, index) {
                    final lawyer = filteredLawyers[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LawyerDetailPage(
                              name: lawyer["name"]!,
                              imageUrl: lawyer["imageUrl"]!,
                              location: lawyer["specialty"]!,
                              rating: 4.8, // 🔧 สมมุติ rating ไว้ก่อน
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2C2C3E),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: SecureBypassImage(
                                imageUrl: lawyer["imageUrl"]!,
                                width: 50,
                                height: 50,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    lawyer["name"]!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    lawyer["specialty"]!,
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 13),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          size: 14, color: Colors.amber),
                                      const SizedBox(width: 4),
                                      const Text(
                                        "4.8",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(width: 10),

                                      // ✅ จุดกระพริบหากออนไลน์
                                      index % 2 == 0
                                          ? const Icon(Icons.access_time,
                                              size: 10, color: Colors.white38)
                                          : const _BlinkingDot(),

                                      const SizedBox(width: 4),
                                      Text(
                                        index % 2 == 0 ? "15 นาที" : "ออนไลน์",
                                        style: TextStyle(
                                          color: index % 2 == 0
                                              ? Colors.white54
                                              : Colors.greenAccent,
                                          fontSize: 12,
                                          fontWeight: index % 2 == 0
                                              ? FontWeight.normal
                                              : FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                // ปุ่ม Video Call เดิม
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
                                // ✅ ปุ่ม Chat ใหม่
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChatPage(
                                          lawyerName: lawyer["name"]!,
                                          lawyerImageUrl: lawyer["imageUrl"]!,
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
                                    child: const Icon(Icons.chat,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
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
}

class _BlinkingDot extends StatefulWidget {
  const _BlinkingDot();

  @override
  State<_BlinkingDot> createState() => _BlinkingDotState();
}

class _BlinkingDotState extends State<_BlinkingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600), // 💥 เร็วขึ้น
      vsync: this,
    )..repeat(reverse: true);

    _opacity = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // 💫 นุ่มแต่เด่น
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: const Icon(
        Icons.circle,
        size: 12, // 💥 ใหญ่ขึ้นเล็กน้อย
        color: Colors.greenAccent,
      ),
    );
  }
}
