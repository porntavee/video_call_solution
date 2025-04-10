import 'package:flutter/material.dart';

import 'category.dart';
import 'secure_bypass_image.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),

          // 🔼 ชั้นบน: Form Login
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "WeLaw",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "เข้าสู่ระบบเพื่อเริ่มต้นการปรึกษากฎหมาย",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 40),
                  _buildInputField(label: "อีเมล"),
                  const SizedBox(height: 20),
                  _buildInputField(label: "รหัสผ่าน", obscureText: true),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("ลืมรหัสผ่าน?",
                          style: TextStyle(color: Colors.white70)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color(0xFF4CAF50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("เข้าสู่ระบบ",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ✅ Social login หรือปุ่มอื่น ๆ ต่อได้ตรงนี้
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Colors.white24)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "หรือเข้าสู่ระบบด้วย",
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.white24)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _socialButton(
                        icon: Icons.g_mobiledata,
                        label: "Google",
                        color: Colors.white,
                        bgColor: Colors.redAccent,
                        onPressed: () {
                          // TODO: เชื่อม Google Login
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CategorySelectionPage(),
                            ),
                          );
                        },
                      ),
                      _socialButton(
                        icon: Icons.facebook,
                        label: "Facebook",
                        color: Colors.white,
                        bgColor: const Color(0xFF1877F2),
                        onPressed: () {
                          // TODO: เชื่อม Facebook Login
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CategorySelectionPage(),
                            ),
                          );
                        },
                      ),
                      _socialButton(
                        icon: Icons.chat,
                        label: "LINE",
                        color: Colors.white,
                        bgColor: const Color(0xFF06C755),
                        onPressed: () {
                          // TODO: เชื่อม LINE Login
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CategorySelectionPage(),
                            ),
                          );
                        },
                      ),
                      _socialButton(
                        icon: Icons.verified_user,
                        label: "ThaiD",
                        color: Colors.white,
                        bgColor: const Color(0xFF0056A5),
                        onPressed: () {
                          // TODO: เชื่อม ThaiD Login
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CategorySelectionPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // ไปหน้า register
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategorySelectionPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "ยังไม่มีบัญชี? สมัครสมาชิก",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.black.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _socialButton({
    required IconData icon,
    required String label,
    required Color color,
    required Color bgColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 160,
      child: OutlinedButton.icon(
        icon: Icon(icon, color: color),
        label: Text(label, style: TextStyle(color: color)),
        style: OutlinedButton.styleFrom(
          backgroundColor: bgColor,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide.none,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
