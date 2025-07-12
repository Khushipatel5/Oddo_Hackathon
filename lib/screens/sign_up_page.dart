import 'package:flutter/material.dart';
import 'package:oddo_hackathon_project/constants.dart';


class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // HEADER
            ClipPath(
              clipper: TopRightRoundedClipper(),
              child: Container(
                height: 300,
                width: double.infinity,
                color: AppColors.formContainerColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.more_horiz, color: AppColors.backgroundColor, size: 30),
                      SizedBox(height: 40),
                      Text(
                        "Let’s",
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Create Your Account",
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  buildTextField(
                    icon: Icons.person,
                    hintText: 'Full Name',
                  ),
                  SizedBox(height: 20),
                  buildTextField(
                    icon: Icons.email,
                    hintText: 'Email Address',
                  ),
                  SizedBox(height: 20),
                  buildTextField(
                    icon: Icons.lock,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  buildTextField(
                    icon: Icons.lock,
                    hintText: 'Retype Password',
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        activeColor: AppColors.buttonTextColor,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                      ),
                      Text(
                        "I agree to the ",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Terms & Privacy",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.buttonTextColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
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
                        "Sign Up",
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
                      "Have an account? Sign In",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
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

  Widget buildTextField({
    required IconData icon,
    required String hintText,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputFieldColor,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.primaryColor),
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.primaryColor.withOpacity(0.6)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
        style: TextStyle(color: AppColors.primaryColor),
      ),
    );
  }
}

/// Custom Clipper to create top-right rounded shape
class TopRightRoundedClipper extends CustomClipper<Path> {
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
