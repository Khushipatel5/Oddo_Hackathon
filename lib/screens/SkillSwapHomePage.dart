import 'package:flutter/material.dart';
import 'package:oddo_hackathon_project/constants.dart';
import 'package:oddo_hackathon_project/database/db_method.dart';
import 'package:oddo_hackathon_project/database/table_models.dart';
import 'package:oddo_hackathon_project/screens/swap_request_page.dart';

class SkillSwapHomePage extends StatefulWidget {
  @override
  State<SkillSwapHomePage> createState() => _SkillSwapHomePageState();
}

class _SkillSwapHomePageState extends State<SkillSwapHomePage> {
  bool showAvailability = true;

  List<User> availableUsers = [];
  List<Skill> skills = [];

  final Db_Methods dbMethods = Db_Methods();

  @override
  void initState() {
    super.initState();
    loadUsers();
    loadSkills();
  }

  Future<void> loadUsers() async {
    availableUsers = await dbMethods.getUsers();
    setState(() {});
  }

  Future<void> loadSkills() async {
    skills = await dbMethods.getSkills();
    setState(() {});
  }

  Widget buildSkillChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      margin: const EdgeInsets.only(right: 8, bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 12),
      ),
    );
  }

  Widget buildStatusBadge(String status) {
    final Color badgeColor =
    status == "Accepted" ? Colors.green : Colors.orange;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: badgeColor),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final usersToDisplay = availableUsers;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
                      backgroundImage: AssetImage("assets/profile.jpg"),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Welcome Back!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text("123 Anywhere Street, Any City",
                            style:
                            TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    const Spacer(),
                    Icon(Icons.notifications_none,
                        color: AppColors.primaryColor),
                  ],
                ),
              ),

              // Search
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search by skill or availability...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon:
                    Icon(Icons.search, color: AppColors.primaryColor),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 20),
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
                    color: AppColors.primaryColor,
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

              // Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: skills
                      .map((skill) => buildSkillChip(skill.name ?? ""))
                      .toList(),
                ),
              ),

              const SizedBox(height: 20),

              // Toggle buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => setState(() {
                          showAvailability = true;
                        }),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: showAvailability
                              ? AppColors.primaryColor
                              : Colors.white,
                          foregroundColor: showAvailability
                              ? Colors.white
                              : AppColors.primaryColor,
                          elevation: showAvailability ? 4 : 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side:
                            BorderSide(color: AppColors.primaryColor),
                          ),
                        ),
                        child: const Text("Availability"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => setState(() {
                          showAvailability = false;
                        }),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: !showAvailability
                              ? AppColors.primaryColor
                              : Colors.white,
                          foregroundColor: !showAvailability
                              ? Colors.white
                              : AppColors.primaryColor,
                          elevation: !showAvailability ? 4 : 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side:
                            BorderSide(color: AppColors.primaryColor),
                          ),
                        ),
                        child: const Text("Pending"),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Section Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  showAvailability
                      ? "Top Swappers"
                      : "Pending Requests",
                  style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),

              const SizedBox(height: 10),

              // Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: usersToDisplay.map((user) {
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
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(
                          user.name ?? "",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            if (showAvailability) ...[
                              Text(
                                  "Offers: N/A",
                                  style:
                                  const TextStyle(fontSize: 12)),
                              Text(
                                  "Wants: N/A",
                                  style:
                                  const TextStyle(fontSize: 12)),
                            ],
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    size: 16, color: Colors.amber),
                                const SizedBox(width: 4),
                                Text("4.0/5",
                                    style: const TextStyle(fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SkillSwapScreen(
                                  fromUserId: 1,
                                  toUserId: user.userId!,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonColor,
                            foregroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(showAvailability
                              ? "Request"
                              : "Pending"),
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