import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String lawyerName;
  final String lawyerImageUrl;

  const ChatPage({
    super.key,
    required this.lawyerName,
    required this.lawyerImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C),
      appBar: AppBar(
        title: Text("แชทกับ $lawyerName"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: BubbleMessage(
                    message: "สวัสดีครับ สนใจสอบถามอะไรได้เลยนะครับ",
                    isMe: false,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: BubbleMessage(
                    message: "อยากปรึกษาเรื่องกฎหมายครอบครัวครับ",
                    isMe: true,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C3E),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "พิมพ์ข้อความ...",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BubbleMessage extends StatelessWidget {
  final String message;
  final bool isMe;

  const BubbleMessage({super.key, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      constraints: const BoxConstraints(maxWidth: 250),
      decoration: BoxDecoration(
        color: isMe ? const Color(0xFF7B61FF) : const Color(0xFF3A3A50),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
