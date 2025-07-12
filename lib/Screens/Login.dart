import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  static const Color primaryColor = Color(0xFF344f77); // Dark blue
  static const Color backgroundColor = Colors.white;
  static const Color inputFieldColor = Colors.white;
  static const Color formContainerColor = Color(0xFF344f77); // Dark blue
  static const Color buttonColor = Color(0xFFced7e0); // Light blue
  static const Color buttonTextColor = Color(0xFF2b4d5e);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 48),
            // Logo Circle
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white.withOpacity(0.1),
              backgroundImage:
              AssetImage('assets/images/skill_swap_logo.jpg'), // Your logo
            ),
            const SizedBox(height: 32),

            // Welcome Text
            Text(
              'Welcome',
              style: GoogleFonts.orbitron(
                color: inputFieldColor,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 32),

            // Email / Phone
            _inputField(
              icon: Icons.person,
              hint: 'Email or Phone',
              obscureText: false,
              color: inputFieldColor,
            ),
            const SizedBox(height: 16),

            // Password
            _inputField(
              icon: Icons.lock,
              hint: 'Password',
              obscureText: true,
              color: inputFieldColor,
            ),
            const SizedBox(height: 10),

            // Forgot Password
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: inputFieldColor.withOpacity(0.8)),
              ),
            ),
            const SizedBox(height: 10),

            // White container fills remaining height
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
                      bgColor: primaryColor,
                      textColor: inputFieldColor,
                      isPrimary: true,
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
                      bgColor: buttonColor,
                      textColor: buttonTextColor,
                      isPrimary: false,
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

  Widget _inputField({
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

  Widget _mainButton(BuildContext context,
      {required String label,
        required Color bgColor,
        required Color textColor,
        required bool isPrimary}){
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
            color: isPrimary ? Colors.white70 : formContainerColor, // Customize
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
          onPressed: () {},
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
