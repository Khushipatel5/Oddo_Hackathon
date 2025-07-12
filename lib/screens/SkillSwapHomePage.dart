import 'package:flutter/material.dart';

class SkillSwapHomePage extends StatelessWidget {
  static const Color primaryColor = Color(0xFF344f77);
  static const Color backgroundColor = Color(0xFFf3f5f9);
  static const Color accentColor = Color(0xFFced7e0);

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

  final List<String> categories = [
    "JavaScript", "Python", "Music", "Graphic Design", "Flutter", "React"
  ];

  Widget buildSkillChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      margin: const EdgeInsets.only(right: 8, bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: primaryColor.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: primaryColor, fontWeight: FontWeight.w500, fontSize: 12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage("assets/profile.jpg"), // Optional
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Welcome Back!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text("123 Anywhere Street, Any City",
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    const Spacer(),
                    Icon(Icons.notifications_none, color: primaryColor),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search by skill or availability...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search, color: primaryColor),
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // Banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Your Skills, Your Power.\nLet’s Swap!",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Icon(Icons.swap_horiz,
                          color: Colors.white, size: 40),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Skill Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                  categories.map((skill) => buildSkillChip(skill)).toList(),
                ),
              ),

              const SizedBox(height: 20),

              // Top Users Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Top Swappers",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: users.map((user) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.grey.shade300,
                            offset: const Offset(2, 2),
                          )
                        ],
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 28,
                          backgroundColor: primaryColor,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(
                          user["name"],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                                "Offers: ${user["offered"].join(", ")}",
                                style: const TextStyle(fontSize: 12)),
                            Text(
                                "Wants: ${user["wanted"].join(", ")}",
                                style: const TextStyle(fontSize: 12)),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    size: 16, color: Colors.amber),
                                const SizedBox(width: 4),
                                Text("${user["rating"]}/5",
                                    style: const TextStyle(fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            // Handle swap request
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: accentColor,
                            foregroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text("Swap"),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
