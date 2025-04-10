import 'package:flutter/material.dart';

class RatingRow extends StatefulWidget {
  final double initialRating;

  const RatingRow({super.key, required this.initialRating});

  @override
  State<RatingRow> createState() => _RatingRowState();
}

class _RatingRowState extends State<RatingRow> {
  double currentRating = 0;

  @override
  void initState() {
    super.initState();
    currentRating = widget.initialRating;
  }

  void _showRatingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        double tempRating = currentRating;

        return AlertDialog(
          backgroundColor: const Color(0xFF2C2C3E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            "ให้คะแนนทนาย",
            style: TextStyle(color: Colors.white),
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        tempRating = index + 1.0;
                      });
                    },
                    icon: Icon(
                      index < tempRating
                          ? Icons.star
                          : Icons.star_border_outlined,
                      color: Colors.amber,
                      size: 32,
                    ),
                  );
                }),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // ปิด dialog
              },
              child:
                  const Text("ยกเลิก", style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7B61FF),
              ),
              onPressed: () {
                setState(() {
                  currentRating = tempRating;
                });
                Navigator.pop(context);
              },
              child: const Text("ยืนยัน"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showRatingDialog,
      child: Row(
        children: [
          const Text(
            "Rating ",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            currentRating.toStringAsFixed(1),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 12),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < currentRating.round() ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 22,
              );
            }),
          ),
        ],
      ),
    );
  }
}
