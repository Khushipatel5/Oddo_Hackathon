import 'package:flutter/material.dart';
import 'package:oddo_hackathon_project/constants.dart';
import 'package:oddo_hackathon_project/database/db_method.dart';
import 'package:oddo_hackathon_project/database/table_models.dart';

class SkillSwapScreen extends StatefulWidget {
  // final int fromUserId;
  // final int toUserId;

  SkillSwapScreen();

  @override
  State<SkillSwapScreen> createState() => _SkillSwapScreenState();
}

class _SkillSwapScreenState extends State<SkillSwapScreen> {
  String? selectedOfferedSkill;
  String? selectedWantedSkill;
  TextEditingController messageController = TextEditingController();

  List<String> skills = [];

  final Db_Methods dbMethods = Db_Methods();

  @override
  void initState() {
    super.initState();
    fetchSkills();
  }

  Future<void> fetchSkills() async {
    List<Skill> skillList = await dbMethods.getSkills();
    setState(() {
      skills = skillList.map((s) => s.name ?? '').where((s) => s.isNotEmpty).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      onPressed: () {

                      },
                      // onPressed: () async {
                      //   if (selectedOfferedSkill != null && selectedWantedSkill != null) {
                      //     List<Skill> allSkills = await dbMethods.getSkills();
                      //
                      //     int? offeredSkillId = allSkills.firstWhere(
                      //           (skill) => skill.name == selectedOfferedSkill,
                      //       orElse: () => Skill(skillId: -1, name: "", category: ""),
                      //     ).skillId;
                      //
                      //     int? requestedSkillId = allSkills.firstWhere(
                      //           (skill) => skill.name == selectedWantedSkill,
                      //       orElse: () => Skill(skillId: -1, name: "", category: ""),
                      //     ).skillId;
                      //
                      //     if (offeredSkillId != null && offeredSkillId > 0 &&
                      //         requestedSkillId != null && requestedSkillId > 0) {
                      //       await dbMethods.sendSwapRequest(
                      //         // fromUserId: widget.fromUserId,
                      //         // toUserId: widget.toUserId,
                      //         // offeredSkillId: offeredSkillId,
                      //         // requestedSkillId: requestedSkillId,
                      //       );
                      //
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(content: Text('Swap request submitted successfully')),
                      //       );
                      //     } else {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(content: Text('Skill not found in database')),
                      //       );
                      //     }
                      //   } else {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text('Please select both skills')),
                      //     );
                      //   }
                      // },
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
                    onTap: () {
                      Navigator.pop(context);
                    },
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

  // Future<void> submitSwapRequest(BuildContext context) async {
  //   if (selectedOfferedSkill == null ||
  //       selectedWantedSkill == null ||
  //       selectedOfferedSkill!.isEmpty ||
  //       selectedWantedSkill!.isEmpty) {
  //     showMessage(context, "Please select both skills.");
  //     return;
  //   }
  //
  //   // Find skill IDs from names
  //   List<Skill> skillList = await dbMethods.getSkills();
  //
  //   Skill? offeredSkill = skillList.firstWhere(
  //           (skill) => skill.skillName == selectedOfferedSkill,
  //       orElse: () => Skill(skillId: null));
  //
  //   Skill? wantedSkill = skillList.firstWhere(
  //           (skill) => skill.skillName == selectedWantedSkill,
  //       orElse: () => Skill(skillId: null));
  //
  //   if (offeredSkill.skillId == null || wantedSkill.skillId == null) {
  //     showMessage(context, "Skill IDs not found in database.");
  //     return;
  //   }
  //
  //   SwapRequest swapRequest = SwapRequest(
  //     swapId: null,
  //     fromUserId: widget.fromUserId,
  //     toUserId: widget.toUserId,
  //     offeredSkillId: offeredSkill.skillId,
  //     requestedSkillId: wantedSkill.skillId,
  //     status: "Pending",
  //   );
  //
  //   int insertedId = await dbMethods.insertSwapRequest(swapRequest);
  //
  //   if (insertedId > 0) {
  //     showMessage(context, "Swap request submitted!", isError: false);
  //   } else {
  //     showMessage(context, "Failed to submit swap request.");
  //   }
  // }

  void showMessage(BuildContext context, String message,
      {bool isError = true}) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(isError ? "Error" : "Success"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          )
        ],
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
          child: Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
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
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    );
  }
}