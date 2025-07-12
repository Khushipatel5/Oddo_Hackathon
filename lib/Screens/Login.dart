import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oddo_hackathon_project/constants.dart';
import 'package:oddo_hackathon_project/screens/sign_up_page.dart';
import 'package:oddo_hackathon_project/database/db_method.dart';
import 'package:oddo_hackathon_project/database/table_models.dart';
import 'package:oddo_hackathon_project/utils/import_export.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Db_Methods dbMethods = Db_Methods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 48),
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white.withOpacity(0.1),
              backgroundImage: AssetImage('assets/images/skill_swap_logo.jpg'),
            ),
            const SizedBox(height: 32),
            Text(
              'Welcome',
              style: GoogleFonts.orbitron(
                color: AppColors.inputFieldColor,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 32),
            _inputField(
              controller: emailPhoneController,
              icon: Icons.person,
              hint: 'Email',
              obscureText: false,
              color: AppColors.inputFieldColor,
            ),
            const SizedBox(height: 16),
            _inputField(
              controller: passwordController,
              icon: Icons.lock,
              hint: 'Password',
              obscureText: true,
              color: AppColors.inputFieldColor,
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: AppColors.inputFieldColor.withOpacity(0.8),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 32),
                    _mainButton(
                      context,
                      label: 'Login',
                      bgColor: AppColors.primaryColor,
                      textColor: AppColors.inputFieldColor,
                      isPrimary: true,
                      onTap: () => login(context),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'or',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _mainButton(
                      context,
                      label: 'Create an account',
                      bgColor: AppColors.buttonColor,
                      textColor: AppColors.buttonTextColor,
                      isPrimary: false,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    String email = emailPhoneController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showMessage(context, "Please enter both email and password.");
      return;
    }

    try {
      List<User> users = await dbMethods.getUsers();

      // Using constants for fields
      final matchingUser = users.firstWhere(
            (user) =>
        user.toMap()[COL_USER_EMAIL.trim()] == email &&
            user.toMap()[COL_USER_PASSWORD.trim()] == password,
      );

      if (matchingUser.toMap()[COL_USER_EMAIL.trim()] != null &&
          matchingUser.toMap()[COL_USER_EMAIL.trim()] != "") {
        showMessage(context, "Login Successful!", isError: false);
        // Navigate to next page if required
      } else {
        showMessage(context, "Invalid credentials.");
      }
    } catch (e) {
      showMessage(context, "An error occurred while logging in: $e");
    }
  }

  void showMessage(BuildContext context, String message, {bool isError = true}) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(isError ? "Error" : "Success"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          )
        ],
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    required bool obscureText,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          style: TextStyle(color: color),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(icon, color: color),
            hintText: hint,
            hintStyle: TextStyle(color: color.withOpacity(0.7)),
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
    );
  }

  Widget _mainButton(
      BuildContext context, {
        required String label,
        required Color bgColor,
        required Color textColor,
        required bool isPrimary,
        required VoidCallback onTap,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: isPrimary
              ? [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            )
          ]
              : [],
          border: Border.all(
            color: isPrimary ? Colors.white70 : AppColors.formContainerColor,
            width: 1.5,
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            shadowColor: Colors.transparent,
          ),
          onPressed: onTap,
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
