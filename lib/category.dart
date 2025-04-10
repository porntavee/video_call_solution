import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_call/profile.dart';
import 'lawyer_list.dart';
import 'notification.dart';
import 'secure_bypass_image.dart';

// class CategorySelectionPage extends StatelessWidget {
//   final List<Map<String, dynamic>> categories = [
//     {
//       "title": "กฎหมายแพ่งและอาญา",
//       "image": "https://images.unsplash.com/photo-1570129477492-45c003edd2be",
//     },
//     {
//       "title": "กฎหมายครอบครัว",
//       "image":
//           "https://images.unsplash.com/photo-1737952026057-4deb20eda9ef?q=80&w=3071&auto=format&fit=crop",
//     },
//     {
//       "title": "กฎหมายแรงงาน",
//       "image": "https://images.unsplash.com/photo-1560250097-0b93528c311a",
//     },
//     {
//       "title": "ที่ดินและอสังหาริมทรัพย์",
//       "image": "https://images.unsplash.com/photo-1600585154340-be6161a56a0c",
//     },
//     {
//       "title": "ธุรกิจและการค้า",
//       "image": "https://images.unsplash.com/photo-1522202176988-66273c2fd55f",
//     },
//     {
//       "title": "แรงงานต่างชาติ",
//       "image": "https://images.unsplash.com/photo-1593642634367-d91a135587b5",
//     },
//     {
//       "title": "เทคโนโลยี / ออนไลน์",
//       "image": "https://images.unsplash.com/photo-1535223289827-42f1e9919769",
//     },
//     {
//       "title": "นักสืบ / สืบสวน",
//       "image":
//           "https://plus.unsplash.com/premium_vector-1739329303582-548e4bb2b902?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", // นักสืบมืด ๆ มีอารมณ์
//     },
//     {
//       "title": "ตรวจสัญญา / เอกสาร",
//       "image":
//           "https://images.unsplash.com/photo-1491234323906-4f056ca415bc?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     },
//     {
//       "title": "ว่าความในศาล",
//       "image": "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
//     },
//     {
//       "title": "คดีอุบัติเหตุ / ประกันภัย",
//       "image":
//           "https://sdmntprwestus.oaiusercontent.com/files/00000000-59a8-5230-b653-5a579ae211df/raw?se=2025-04-04T03%3A36%3A43Z&sp=r&sv=2024-08-04&sr=b&scid=be49f190-7ac0-5b5a-9e50-587137e08b2b&skoid=acefdf70-07fd-4bd5-a167-a4a9b137d163&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2025-04-03T20%3A40%3A36Z&ske=2025-04-04T20%3A40%3A36Z&sks=b&skv=2024-08-04&sig=h9OfL6f/TgA9A3cPjsxRy5rNJG8qVyzc9c3zPVnkBqM%3D",
//     },
//     {
//       "title": "พิพาททั่วไป",
//       "image":
//           "https://sdmntprwestus.oaiusercontent.com/files/00000000-09f4-5230-8887-c8dabb49a487/raw?se=2025-04-04T04%3A44%3A16Z&sp=r&sv=2024-08-04&sr=b&scid=7571dccc-b6c5-562c-bb56-2181e86716b5&skoid=acefdf70-07fd-4bd5-a167-a4a9b137d163&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2025-04-03T19%3A46%3A41Z&ske=2025-04-04T19%3A46%3A41Z&sks=b&skv=2024-08-04&sig=bAVxMEYi%2BhtYXyIIyIEH45D1TO4atQkjXACSEuEJOEo%3D",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:
//           const Color(0xFF1E1E2C), // ⬅️ ใช้พื้นหลังเข้มแบบที่ต้องการ
//       appBar: AppBar(
//         title: const Text("เลือกหัวข้อคำปรึกษา"),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         foregroundColor: Colors.white,
//       ),
//       body: Stack(
//         children: [
//           // 🔽 รูปพื้นหลังจาง ๆ
//           Positioned.fill(
//             child: Opacity(
//               opacity: 0.5,
//               child: SecureBypassImage(
//                 imageUrl:
//                     'https://sdmntprwestus.oaiusercontent.com/files/00000000-0e50-5230-b411-549fed1dd361/raw?se=2025-04-04T04%3A09%3A09Z&sp=r&sv=2024-08-04&sr=b&scid=4cda7036-c5ea-504d-9c21-e2a6ffce61e4&skoid=acefdf70-07fd-4bd5-a167-a4a9b137d163&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2025-04-03T19%3A38%3A49Z&ske=2025-04-04T19%3A38%3A49Z&sks=b&skv=2024-08-04&sig=NHwxGkLXdJfC7hmaOKIlBHiGgU9xR3VRRg0RRzTML0I%3D',
//                 width: 50,
//                 height: 50,
//                 borderRadius: BorderRadius.circular(0),
//               ),
//             ),
//           ),

//           GridView.builder(
//             padding: const EdgeInsets.all(20),
//             itemCount: categories.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisSpacing: 24,
//               crossAxisSpacing: 24,
//               childAspectRatio: 1,
//             ),
//             itemBuilder: (context, index) {
//               final category = categories[index];
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => LawyerListPage(
//                         category: category["title"],
//                       ),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Color(0xFF2C2C3E), width: 2),
//                   ),
//                   child: ClipOval(
//                     child: Stack(
//                       fit: StackFit.expand,
//                       children: [
//                         Image.network(
//                           category["image"],
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) =>
//                               Container(color: Colors.grey),
//                         ),
//                         Container(
//                           color: Colors.black.withOpacity(0.4),
//                         ),
//                         Center(
//                           child: Text(
//                             category["title"],
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 13,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({super.key});

  @override
  State<CategorySelectionPage> createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  final List<Map<String, dynamic>> categories = [
    {
      "title": "กฎหมายแพ่งและอาญา",
      "image":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer\\20250404-111449-40.jpg",
    },
    {
      "title": "กฎหมายครอบครัว",
      "image":
          "https://images.unsplash.com/photo-1737952026057-4deb20eda9ef?q=80&w=3071&auto=format&fit=crop",
    },
    {
      "title": "กฎหมายแรงงาน",
      "image": "https://images.unsplash.com/photo-1560250097-0b93528c311a",
    },
    {
      "title": "ที่ดินและอสังหาริมทรัพย์",
      "image": "https://images.unsplash.com/photo-1600585154340-be6161a56a0c",
    },
    {
      "title": "ธุรกิจและการค้า",
      "image": "https://images.unsplash.com/photo-1522202176988-66273c2fd55f",
    },
    {
      "title": "แรงงานต่างชาติ",
      "image": "https://images.unsplash.com/photo-1593642634367-d91a135587b5",
    },
    {
      "title": "เทคโนโลยี / ออนไลน์",
      "image": "https://images.unsplash.com/photo-1535223289827-42f1e9919769",
    },
    {
      "title": "นักสืบ / สืบสวน",
      "image":
          "https://plus.unsplash.com/premium_vector-1739329303582-548e4bb2b902?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", // นักสืบมืด ๆ มีอารมณ์
    },
    {
      "title": "ตรวจสัญญา / เอกสาร",
      "image":
          "https://images.unsplash.com/photo-1491234323906-4f056ca415bc?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "title": "ว่าความในศาล",
      "image": "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
    },
    {
      "title": "คดีอุบัติเหตุ / ประกันภัย",
      "image":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer\\20250404-111449-40.jpg",
    },
    {
      "title": "พิพาททั่วไป",
      "image":
          "https://gateway.we-builds.com/wb-py-media/uploads/lawyer\\20250404-111254-c3c7b1e2-3175-4e67-9145-ae7eda38e9a9.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward(); // Start animation

    _requestPermissions();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _requestPermissions() async {
    if (await Permission.camera.isDenied ||
        await Permission.microphone.isDenied) {
      final statuses = await [
        Permission.camera,
        Permission.microphone,
        Permission.bluetooth
      ].request();

      if (statuses[Permission.camera]!.isPermanentlyDenied ||
          statuses[Permission.microphone]!.isPermanentlyDenied) {
        openAppSettings(); // เปิด Settings หากถูกปฏิเสธแบบถาวร
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C),
      appBar: AppBar(
        title: const Text("เลือกหัวข้อคำปรึกษา"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        actions: [
          // 🔔 ปุ่มกระดิ่ง
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationPage()),
              );
            },
          ),
          // 🧑‍⚖️ ปุ่มโปรไฟล์
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: ClipOval(
                child: SecureBypassImage(
                  imageUrl:
                      "https://gateway.we-builds.com/wb-py-media/uploads/lawyer\\20250408-153949-Art Toy พี่หมู.png",
                  width: 36,
                  height: 36,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
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
          GridView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return FadeTransition(
                opacity: _animation,
                child: ScaleTransition(
                  scale: _animation,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LawyerListPage(
                            category: category["title"],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xFF2C2C3E), width: 2),
                      ),
                      child: ClipOval(
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            SecureBypassImage(
                              imageUrl: category["image"],
                              width: 50,
                              height: 50,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            // Image.network(
                            //   category["image"],
                            //   fit: BoxFit.cover,
                            //   errorBuilder: (context, error, stackTrace) =>
                            //       Container(color: Colors.grey),
                            // ),
                            Container(
                              color: Colors.black.withOpacity(0.4),
                            ),
                            Center(
                              child: Text(
                                category["title"],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
