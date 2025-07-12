import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class AppConstants {
  static const Color primaryColor = Color(0xFF344f77); // Dark blue
  static const Color backgroundColor = Colors.white;
  static const Color inputFieldColor = Colors.white;
  static const Color formContainerColor = Color(0xFF344f77); // Dark blue
  static const Color buttonColor = Color(0xFFced7e0); // Light blue
  static const Color buttonTextColor = Color(0xFF2b4d5e);
}

class ValidationUtils {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}

class ReusableButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ReusableButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstants.buttonColor,
        foregroundColor: AppConstants.buttonTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        minimumSize: const Size(double.infinity, 50),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      setState(() => _errorMessage = null);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reset instructions sent!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Icon(Icons.more_horiz, color: AppConstants.primaryColor),
              ),
            ),
            const SizedBox(height: 100),
            const Icon(Icons.lock_outline, size: 80, color: AppConstants.primaryColor),
            const SizedBox(height: 20),
            Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppConstants.primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "No worries, we’ll send you\nreset instructions",
              style: TextStyle(fontSize: 14, color: AppConstants.primaryColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100),

            // Rounded container at the bottom
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppConstants.formContainerColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Form(
                        key: _formKey,
                        child: Column(

                          children: [
                            SizedBox(height: 60,),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Email",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600 , fontSize: 20),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _emailController,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: 'Enter your Email',
                                prefixIcon: const Icon(Icons.email, color: AppConstants.primaryColor),
                                filled: true,
                                fillColor: AppConstants.inputFieldColor,
                                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: ValidationUtils.validateEmail,
                            ),
                            const SizedBox(height: 30),
                            ReusableButton(
                              text: 'Reset Password',
                              onPressed: _resetPassword,
                            ),
                            const SizedBox(height: 20),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Back to Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            if (_errorMessage != null) ...[
                              const SizedBox(height: 10),
                              Text(
                                _errorMessage!,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // Bottom center back button
                    Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.keyboard_return, size: 20, color: AppConstants.primaryColor),
                      ),
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
}
