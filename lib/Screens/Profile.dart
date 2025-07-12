import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oddo_hackathon_project/constants.dart';
import 'package:oddo_hackathon_project/database/table_models.dart';
import 'package:oddo_hackathon_project/screens/swap_request_page.dart';

class SkillSwapProfileUI extends StatefulWidget {
  final User user;
  final int currentUserId; // Needed for the "Request Swap" button

  const SkillSwapProfileUI({
    super.key,
    required this.user,
    required this.currentUserId,
  });

  @override
  State<SkillSwapProfileUI> createState() => _SkillSwapProfileUIState();
}

class _SkillSwapProfileUIState extends State<SkillSwapProfileUI> {
  // In a real app, you would fetch the user's specific skills here.
  // For this demo, we'll use placeholder lists.
  final List<String> offers = ['JavaScript', 'Python'];
  final List<String> wants = ['Music', 'Graphic Design'];
  final String availability = 'Weekends';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: Text('User Profile', style: GoogleFonts.offside(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
            ),
            child: Column(
              children: [
                // Use a placeholder if the image is null
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  backgroundImage: widget.user.imageUrl != null && widget.user.imageUrl!.isNotEmpty
                      ? MemoryImage(base64Decode(widget.user.imageUrl!))
                      : null,
                  child: widget.user.imageUrl == null || widget.user.imageUrl!.isEmpty
                      ? const Icon(Icons.person, size: 60, color: AppColors.primaryColor)
                      : null,
                ),
                const SizedBox(height: 12),
                Text(
                  widget.user.name,
                  style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  // Provide default text if location is null
                  widget.user.location ?? 'Location not specified',
                  style: const TextStyle(color: Colors.white70, fontSize: 17),
                ),
              ],
            ),
          ),

          // Body Section with User Details
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              children: [
                _buildDetailCard("Bio", widget.user.bio ?? 'No bio provided.'),
                _buildSkillSection("Offers", offers),
                _buildSkillSection("Wants", wants),
                _buildDetailCard("Availability", availability),

                const SizedBox(height: 40),
                // Swap Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SkillSwapScreen(
                            fromUserId: widget.currentUserId,
                            toUserId: widget.user.userId!,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text("Request Swap", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for text details like Bio and Availability
  Widget _buildDetailCard(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade200, blurRadius: 5, offset: const Offset(0, 2))
              ]
          ),
          child: Text(value, style: const TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  // Helper widget for displaying skill chips
  Widget _buildSkillSection(String title, List<String> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        skills.isEmpty
            ? Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text('No skills listed', style: TextStyle(fontSize: 16, color: Colors.grey)),
        )
            : Wrap(
          spacing: 8,
          runSpacing: 4,
          children: skills
              .map((skill) => Chip(
            label: Text(skill),
            backgroundColor: AppColors.primaryColor.withOpacity(0.1),
            labelStyle: const TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600),
          ))
              .toList(),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}