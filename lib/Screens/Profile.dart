import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oddo_hackathon_project/constants.dart';

class SkillSwapProfileUI extends StatelessWidget {
  final String name = 'Marc Demo';
  final String location = 'New York, USA';
  final String availability = 'Weekends';
  final List<String> offers = ['JavaScript', 'Python'];
  final List<String> wants = ['Music', 'Graphic Design'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Skill Swap', style: GoogleFonts.offside(color: AppColors.backgroundColor, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              color: AppColors.primaryColor ,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=1"),
                ),
                SizedBox(height: 12),
                Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  location,
                  style: TextStyle(color: Colors.white70, fontSize: 17),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              children: [
                // Name
                Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(name, style: TextStyle(fontSize: 16)),
                ),
                SizedBox(height: 16),

                // Location
                Text("Location", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(location, style: TextStyle(fontSize: 16)),
                ),
                SizedBox(height: 16),

                // Offers
                Text("Offers", style: TextStyle(fontWeight: FontWeight.bold)),
                Wrap(
                  spacing: 8,
                  children: offers
                      .map((skill) => Chip(
                    label: Text(skill),
                    backgroundColor: Colors.blue.shade50,
                  ))
                      .toList(),
                ),
                SizedBox(height: 16),

                // Wants
                Text("Wants", style: TextStyle(fontWeight: FontWeight.bold)),
                Wrap(
                  spacing: 8,
                  children: wants
                      .map((skill) => Chip(
                    label: Text(skill),
                    backgroundColor: Colors.blue.shade50,
                  ))
                      .toList(),
                ),
                SizedBox(height: 16),

                // Availability Text
                Text("Availability", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    availability,
                    style: TextStyle(fontSize: 16),
                  ),
                ),

                SizedBox(height: 130),
                // Swap Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF344f77),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text("Request Swap", style: TextStyle(fontSize: 16,color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
