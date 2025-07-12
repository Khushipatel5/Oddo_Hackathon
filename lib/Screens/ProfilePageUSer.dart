import 'package:flutter/material.dart';

class ModernProfilePage extends StatefulWidget {
  const ModernProfilePage({super.key});

  @override
  State<ModernProfilePage> createState() => _ModernProfilePageState();
}

class _ModernProfilePageState extends State<ModernProfilePage> {
  bool isEditMode = false;
  final nameController = TextEditingController(text: "Khushi Patel");
  final locationController = TextEditingController(text: "Rajkot");
  final availabilityController = TextEditingController(text: "Weekends");
  String profileVisibility = "Public";

  final List<String> allSkills = [
    "Flutter",
    "Web Development",
    "Graphic Design",
    "SEO",
    "Marketing",
    "Video Editing"
  ];

  List<String> offeredSkills = ["Flutter"];
  List<String> wantedSkills = ["SEO"];

  void toggleSkill(List<String> skillList, String skill) {
    setState(() {
      if (skillList.contains(skill)) {
        skillList.remove(skill);
      } else {
        skillList.add(skill);
      }
    });
  }

  Widget buildSkillDropdown(String label, List<String> selectedSkills, void Function(String) onToggle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: const Text("Select Skill"),
              isExpanded: true,
              items: allSkills.where((s) => !selectedSkills.contains(s)).map((skill) {
                return DropdownMenuItem(
                  value: skill,
                  child: Text(skill),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) onToggle(value);
              },
            ),
          ),
        ),
        Wrap(
          spacing: 8,
          children: selectedSkills.map((skill) => Chip(
            label: Text(skill),
            deleteIcon: const Icon(Icons.cancel, size: 18),
            onDeleted: () => onToggle(skill),
          )).toList(),
        ),
      ],
    );
  }

  Widget buildCardItem({required IconData icon, required Widget child}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.grey.shade700),
        title: child,
      ),
    );
  }

  Widget buildTextCard(String label, TextEditingController controller) {
    return buildCardItem(
      icon: Icons.text_fields,
      child: isEditMode
          ? TextField(
        controller: controller,
        decoration: InputDecoration(border: InputBorder.none, hintText: label),
      )
          : Text(controller.text),
    );
  }

  Widget buildDropdownCard() {
    return buildCardItem(
      icon: Icons.lock_outline,
      child: isEditMode
          ? DropdownButton<String>(
        value: profileVisibility,
        underline: const SizedBox.shrink(),
        items: ["Public", "Private"].map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
        onChanged: (val) => setState(() => profileVisibility = val!),
      )
          : Text(profileVisibility),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FF),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF344f77), Color(0xFF4a678a)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);

                      },
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(isEditMode ? Icons.check : Icons.edit, color: Colors.white),
                      onPressed: () => setState(() => isEditMode = !isEditMode),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.camera_alt, color: Colors.grey.shade700),
                ),
                const SizedBox(height: 10),
                Text(nameController.text, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const Text("Skill Swap User", style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  buildTextCard("Name", nameController),
                  buildTextCard("Location", locationController),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: buildSkillDropdown("Skills Offered", offeredSkills, (skill) => toggleSkill(offeredSkills, skill)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: buildSkillDropdown("Skills Wanted", wantedSkills, (skill) => toggleSkill(wantedSkills, skill)),
                  ),
                  buildTextCard("Availability", availabilityController),
                  buildDropdownCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
