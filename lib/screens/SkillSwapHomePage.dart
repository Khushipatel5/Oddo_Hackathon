import 'dart:ui';
import 'package:flutter/material.dart';

class SkillSwapHomePage extends StatelessWidget {
  static const Color primaryColor = Color(0xFF344f77);
  static const Color backgroundColor = Color(0xFFf3f5f9);
  static const Color cardGlassColor = Colors.white10;
  static const Color accentColor = Color(0xFFced7e0);
  static const Color textDark = Color(0xFF2b4d5e);

  final List<Map<String, dynamic>> users = [
    {
      "name": "Marc Demo",
      "offered": ["JavaScript", "Python"],
      "wanted": ["Music", "Graphic Designer"],
      "rating": 3.9
    },
    {
      "name": "Michell",
      "offered": ["JavaScript", "Python"],
      "wanted": ["Graphic Designer"],
      "rating": 2.5
    },
    {
      "name": "Joe Wills",
      "offered": ["JavaScript", "Python"],
      "wanted": ["Music", "Graphic Designer"],
      "rating": 4.0
    },
  ];

  Widget skillChip(String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      margin: const EdgeInsets.only(right: 8, bottom: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 5),
          Text(label, style: TextStyle(fontSize: 12, color: color)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 4,
        title: const Text("Skill Swap Platform"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Login", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Column(
        children: [
          // Floating Glass Search Bar
          Padding(
            padding: const EdgeInsets.all(14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.5, sigmaY: 4.5),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.filter_alt_outlined, color: primaryColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search by availability or skill",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.search, color: primaryColor),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Glass Cards List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.blueGrey.shade50],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12,
                        spreadRadius: 1,
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: primaryColor,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user["name"],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text("Skills Offered:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green[800])),
                              Wrap(
                                children: user["offered"]
                                    .map<Widget>((s) => skillChip(
                                    s, Icons.check_circle, Colors.green))
                                    .toList(),
                              ),
                              const SizedBox(height: 6),
                              Text("Skills Wanted:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue[800])),
                              Wrap(
                                children: user["wanted"]
                                    .map<Widget>((s) => skillChip(
                                    s, Icons.lightbulb, Colors.blue))
                                    .toList(),
                              ),
                              const SizedBox(height: 6),
                              Text("Rating: ${user["rating"]}/5",
                                  style: const TextStyle(color: Colors.black54)),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            backgroundColor: accentColor,
                            foregroundColor: textDark,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                          child: const Text("Request"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Ripple Pagination
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(7, (index) {
                bool isActive = index == 0;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 18 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: isActive ? primaryColor : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
