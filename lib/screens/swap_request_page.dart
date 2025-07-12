import 'package:flutter/material.dart';
import 'package:oddo_hackathon_project/constants.dart';


class SkillSwapScreen extends StatefulWidget {
  @override
  State<SkillSwapScreen> createState() => _SkillSwapScreenState();
}

class _SkillSwapScreenState extends State<SkillSwapScreen> {
  String? selectedOfferedSkill;
  String? selectedWantedSkill;
  TextEditingController messageController = TextEditingController();

  List<String> skills = [
    "Programming",
    "Design",
    "Writing",
    "Music",
    "Cooking"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            ClipPath(
              child: Container(
                color: AppColors.primaryColor,
                width: double.infinity,
                height: 280,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.more_horiz, color: Colors.white, size: 30),
                    SizedBox(height: 30),
                    Text(
                      "Swap",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Your Skills",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // FORM AREA
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  buildDropdownField(
                    text: "Choose your offered skill",
                    icon: Icons.swap_horiz,
                    hintText: "Select Here",
                    value: selectedOfferedSkill,
                    onChanged: (value) {
                      setState(() {
                        selectedOfferedSkill = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  buildDropdownField(
                    text: "Choose their wanted skill",
                    icon: Icons.swap_horiz,
                    hintText: "Select Here",
                    value: selectedWantedSkill,
                    onChanged: (value) {
                      setState(() {
                        selectedWantedSkill = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  buildMessageBox(),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: AppColors.buttonTextColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Go back to Dashboard",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDropdownField({
    required String text,
    required IconData icon,
    required String hintText,
    required String? value,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w500),),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: DropdownButtonFormField<String>(
            value: value,
            icon: Icon(Icons.arrow_drop_down, color: AppColors.primaryColor),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: AppColors.primaryColor),
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
            ),
            items: skills.map((skill) {
              return DropdownMenuItem(
                value: skill,
                child: Text(
                  skill,
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget buildMessageBox() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: messageController,
        maxLines: 5,
        decoration: InputDecoration(
          hintText: "Message",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16 , horizontal: 20),
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 80);
    path.quadraticBezierTo(size.width, 0, size.width - 80, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
