import 'package:flutter/material.dart';
import 'lawyer_list.dart';

class CategorySelection3DPage extends StatefulWidget {
  const CategorySelection3DPage({super.key});

  @override
  State<CategorySelection3DPage> createState() =>
      _CategorySelection3DPageState();
}

class _CategorySelection3DPageState extends State<CategorySelection3DPage> {
  final PageController _pageController = PageController(viewportFraction: 0.7);
  double _currentPage = 0;

  final List<Map<String, dynamic>> categories = [
    {
      "title": "กฎหมายแพ่งและอาญา",
      "icon": Icons.gavel,
      "gradient": [Color(0xFFBBDEFB), Color(0xFF1976D2)],
      "iconColor": Color(0xFF1565C0),
    },
    {
      "title": "กฎหมายครอบครัว",
      "icon": Icons.family_restroom,
      "gradient": [Color(0xFFFFE0B2), Color(0xFFFF9800)],
      "iconColor": Color(0xFFF57C00),
    },
    {
      "title": "กฎหมายแรงงาน",
      "icon": Icons.work_outline,
      "gradient": [Color(0xFFC8E6C9), Color(0xFF43A047)],
      "iconColor": Color(0xFF388E3C),
    },
    {
      "title": "ที่ดินและอสังหาริมทรัพย์",
      "icon": Icons.house_outlined,
      "gradient": [Color(0xFFFFCDD2), Color(0xFFC62828)],
      "iconColor": Color(0xFFD32F2F),
    },
    {
      "title": "ธุรกิจและการค้า",
      "icon": Icons.business_center,
      "gradient": [Color(0xFFD1C4E9), Color(0xFF673AB7)],
      "iconColor": Color(0xFF512DA8),
    },
    {
      "title": "แรงงานต่างชาติ",
      "icon": Icons.language,
      "gradient": [Color(0xFFE1BEE7), Color(0xFF8E24AA)],
      "iconColor": Color(0xFF7B1FA2),
    },
    {
      "title": "เทคโนโลยี / ออนไลน์",
      "icon": Icons.computer,
      "gradient": [Color(0xFFCFD8DC), Color(0xFF607D8B)],
      "iconColor": Color(0xFF455A64),
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppBar(
        title: const Text("เลือกหัวข้อคำปรึกษา"),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black87,
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final scale = (_currentPage - index).abs().clamp(0.0, 1.0);
          final angle = (_currentPage - index) * 0.3;

          final category = categories[index];

          return Transform(
            transform: Matrix4.identity()
              ..scale(1 - scale * 0.1)
              ..rotateY(angle),
            alignment: Alignment.center,
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: List<Color>.from(category["gradient"]),
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: category["iconColor"].withOpacity(0.3),
                      offset: const Offset(0, 8),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      category["icon"],
                      size: 48,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      category["title"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
